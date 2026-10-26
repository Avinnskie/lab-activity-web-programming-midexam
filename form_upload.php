<?php
date_default_timezone_set("Asia/Pontianak");
require_once __DIR__ . "/connection.php";

$daftarGambar = [];
$databaseError = null;
try {
    $pdo = databaseConnection();
    $daftarGambar = $pdo->query("SELECT id, nama_file, tgl_unggah FROM gambar ORDER BY id DESC")->fetchAll();
} catch (PDOException $exception) {
    error_log($exception->getMessage());
    $databaseError = "Data gambar gagal dibaca. Pastikan MySQL aktif dan tabel gambar dari database/gambar.sql sudah diimpor.";
}
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Gambar</title>
</head>

<body>

    <h2>Form Upload Gambar</h2>

    <?php if (isset($_GET["uploaded"]) && $_GET["uploaded"] == "1") { ?>
        <p role="status">Gambar berhasil diupload dan ditampilkan pada tabel di bawah.</p>
    <?php } ?>

    <form action="upload.php" method="POST" enctype="multipart/form-data">

        <label for="photo">Pilih Gambar:</label>
        <input type="file" id="photo" name="photo" accept="image/jpeg,image/png,image/gif" aria-describedby="photo-help" required>
        <p id="photo-help">Format JPG, JPEG, PNG, atau GIF. Maksimal 1 MB.</p>

        <br><br>

        <input type="submit" name="submit" value="Upload Gambar">

    </form>

    <h2>Daftar Gambar</h2>

    <table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse; width: 100%;">
        <thead>
            <tr>
                <th scope="col">No.</th>
                <th scope="col">Nama File</th>
                <th scope="col">Tgl Unggah</th>
                <th scope="col">Preview</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($databaseError !== null) { ?>
                <tr>
                    <td colspan="4" role="alert"><?= htmlspecialchars($databaseError, ENT_QUOTES, "UTF-8") ?></td>
                </tr>
            <?php } elseif ($daftarGambar == []) { ?>
                <tr>
                    <td colspan="4">Belum ada gambar yang diupload.</td>
                </tr>
            <?php } ?>

            <?php foreach ($daftarGambar as $nomor => $gambar) {
                $namaFile = basename($gambar["nama_file"]);
                $alamatGambar = "img/" . rawurlencode($namaFile);
            ?>
                <tr>
                    <td><?= $nomor + 1 ?></td>
                    <td><?= htmlspecialchars("img/" . $namaFile, ENT_QUOTES, "UTF-8") ?></td>
                    <td><?= htmlspecialchars($gambar["tgl_unggah"], ENT_QUOTES, "UTF-8") ?></td>
                    <td>
                        <a href="<?= $alamatGambar ?>" target="_blank" rel="noopener">
                            <img src="<?= $alamatGambar ?>" alt="<?= htmlspecialchars($namaFile, ENT_QUOTES, "UTF-8") ?>" style="max-width: 180px; max-height: 150px;">
                        </a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

</body>

</html>
