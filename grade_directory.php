<?php

declare(strict_types=1);

function directoryOptions(array $query, array $predicates): array
{
    $search = is_string($query['search'] ?? null) ? trim($query['search']) : '';
    $predicate = is_string($query['filter_predikat'] ?? null) ? $query['filter_predikat'] : '';
    $limit = filter_var($query['per_page'] ?? 5, FILTER_VALIDATE_INT);
    $page = filter_var($query['page'] ?? 1, FILTER_VALIDATE_INT);

    return [
        'search' => $search,
        'filter_predikat' => in_array($predicate, $predicates, true) ? $predicate : '',
        'sort' => ($query['sort'] ?? '') === 'asc' ? 'asc' : 'desc',
        'per_page' => in_array($limit, [5, 10, 15], true) ? $limit : 5,
        'page' => $page !== false && $page > 0 ? $page : 1,
    ];
}

function directoryUrl(array $options, array $changes = []): string
{
    return '?' . http_build_query(array_replace($options, $changes));
}

function loadGradeDirectory(PDO $pdo, array $options): array
{
    $where = [];
    $parameters = [];
    if ($options['search'] !== '') {
        $where[] = "nm_lengkap LIKE :search_name ESCAPE '!'";
        $parameters['search_name'] = '%' . strtr($options['search'], ['!' => '!!', '%' => '!%', '_' => '!_']) . '%';
    }
    if ($options['filter_predikat'] !== '') {
        $where[] = 'predikat = :predicate';
        $parameters['predicate'] = $options['filter_predikat'];
    }
    $whereSql = $where === [] ? '' : ' WHERE ' . implode(' AND ', $where);
    $count = $pdo->prepare('SELECT COUNT(*) FROM nilaimhsw' . $whereSql);
    $count->execute($parameters);
    $totalData = (int) $count->fetchColumn();
    $totalPages = max(1, (int) ceil($totalData / $options['per_page']));
    $page = min($options['page'], $totalPages);
    $offset = ($page - 1) * $options['per_page'];
    // Only these two fixed SQL keywords may be used for the grade order.
    $direction = $options['sort'] === 'asc' ? 'ASC' : 'DESC';
    $statement = $pdo->prepare(
        'SELECT nim, nm_lengkap, nilai_akhir, nilai_huruf, predikat, file_path, created_date, modified_date FROM nilaimhsw'
        . $whereSql . ' ORDER BY nilai_akhir ' . $direction . ', nim ASC LIMIT :limit OFFSET :offset'
    );
    foreach ($parameters as $name => $value) {
        $statement->bindValue(':' . $name, $value, PDO::PARAM_STR);
    }
    $statement->bindValue(':limit', $options['per_page'], PDO::PARAM_INT);
    $statement->bindValue(':offset', $offset, PDO::PARAM_INT);
    $statement->execute();

    return ['records' => $statement->fetchAll(), 'totalData' => $totalData, 'totalPages' => $totalPages, 'page' => $page, 'offset' => $offset];
}

function studentPhotoExtension(array $file): ?string
{
    $error = $file['error'] ?? UPLOAD_ERR_NO_FILE;
    if ($error === UPLOAD_ERR_NO_FILE) {
        return null;
    }
    if ($error !== UPLOAD_ERR_OK || ($file['size'] ?? 0) > 1000000) {
        throw new InvalidArgumentException('Foto gagal diterima. Pilih foto maksimal 1 MB lalu coba lagi.');
    }
    $temporaryFile = $file['tmp_name'] ?? null;
    $image = is_string($temporaryFile) && is_file($temporaryFile) ? @getimagesize($temporaryFile) : false;
    $extensions = [IMAGETYPE_JPEG => 'jpg', IMAGETYPE_PNG => 'png', IMAGETYPE_GIF => 'gif'];
    if ($image === false || !isset($extensions[$image[2]])) {
        throw new InvalidArgumentException('Foto harus berupa gambar JPG, JPEG, PNG, atau GIF.');
    }

    return $extensions[$image[2]];
}

function studentPhotoUrl(?string $filePath): string
{
    if ($filePath !== null
        && (preg_match('#^img/mahasiswa/[a-f0-9]{32}\.(jpg|png|gif)$#D', $filePath) === 1
            || preg_match('#^assets/demo/avatar-0[1-6]\.svg$#D', $filePath) === 1)
        && is_file(__DIR__ . '/' . $filePath)) {
        return $filePath;
    }

    return 'assets/default-avatar.svg';
}

function removeStudentPhoto(?string $filePath): void
{
    $url = studentPhotoUrl($filePath);
    if (str_starts_with($url, 'img/mahasiswa/') && !unlink(__DIR__ . '/' . $url)) {
        error_log('Foto lama gagal dibersihkan: ' . $filePath);
    }
}
