# Rekap Nilai Mahasiswa — UTS Praktikum Pemrograman Web

Aplikasi PHP 8 + PDO MySQL dengan template AdminLTE. Data mahasiswa dibaca dari tabel **`nilaimhsw`**. Kolom **`file_path`** menyimpan alamat gambar relatif terhadap folder proyek; thumbnail ditampilkan bersama nama di dalam kolom **Nama Mahasiswa**.

## Instalasi baru

1. Salin/clone proyek ke `htdocs/selectdb`.
2. Aktifkan Apache dan MySQL XAMPP.
3. Impor **[`database/dbnilai.sql`](database/dbnilai.sql)** melalui phpMyAdmin. File ekspor ini berisi skema database, tabel `nilaimhsw` dan `gambar`, serta **36 mahasiswa fiktif** dengan variasi nama, nilai, predikat, dan alamat gambar.
4. Buka `http://localhost/selectdb/`.

Koneksi bawaan: host `127.0.0.1`, port `3306`, database `dbnilai`, pengguna `root`, password kosong. Atur `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, dan `DB_PASSWORD` pada lingkungan PHP bila diperlukan.

Aset template AdminLTE disertakan di `assets/vendor/` beserta lisensinya. Font, ikon Bootstrap, dan JavaScript Bootstrap dimuat dari CDN dan membutuhkan koneksi internet.

## Memperbarui instalasi sebelumnya

Jalankan file berikut secara berurutan melalui phpMyAdmin:

1. `database/uts.sql` — memastikan kolom foto lama tersedia.
2. `database/002_nilaimhsw.sql` — membuat tabel `nilaimhsw` dengan kolom `file_path`.
3. `database/003_copy_nilai.sql` — menyalin data tabel `nilai` beserta alamat fotonya ke `nilaimhsw`.
4. `database/dummy.sql` — menambahkan 36 mahasiswa dummy.

Migrasi mempertahankan tabel lama dan tidak menimpa NIM yang sudah ada pada tabel tujuan. Semua file tersebut aman dijalankan ulang. Jika kembali memakai versi aplikasi lama, tabel `nilai` masih tersedia; perubahan baru pada `nilaimhsw` tidak otomatis disalin kembali ke `nilai`.

## Demonstrasi fitur

| Fitur | Cara mencoba |
| --- | --- |
| Membaca foto | Thumbnail muncul di sebelah nama dalam kolom yang sama. Foto dapat diunggah melalui **Tambah Nilai** atau **Edit**. |
| Pencarian nama | Isi sebagian nama, misalnya `Putri`, lalu klik **Terapkan** atau tekan Enter. |
| Pencarian predikat | Pilih predikat pada dropdown lalu klik **Terapkan**. Bisa digabungkan dengan nama. |
| Sorting nilai akhir | Klik ikon panah/judul **Nilai Akhir** untuk berganti ASC dan DESC. Kolom lain tidak memiliki kontrol sorting. |
| Pagination | Pilih **5, 10, atau 15** record per halaman, lalu klik **Terapkan**. Gunakan **First Page**, **Previous**, nomor halaman, **Next**, atau **Last Page**. |

Pencarian, predikat, urutan, dan jumlah record tetap dipertahankan saat berpindah halaman. Perubahan pencarian, filter, jumlah record, atau urutan dimulai dari halaman pertama. Tombol navigasi awal/akhir dinonaktifkan ketika sudah berada di batas halaman.

Foto unggahan menerima JPG/JPEG/PNG/GIF maksimal 1 MB dan disimpan di `img/mahasiswa/`. Pastikan folder ini dapat ditulis oleh PHP/Apache. Saat edit, kosongkan pilihan foto untuk mempertahankan foto sebelumnya. Foto lama dibersihkan setelah diganti atau data mahasiswa dihapus. Gambar pada 36 data dummy berupa ilustrasi avatar lokal di `assets/demo/`; file tersebut disertakan di repositori dan dapat dibuka tanpa layanan gambar eksternal. Mahasiswa tanpa gambar menggunakan avatar bawaan.

## Isi SQL dan repositori

- `database/dbnilai.sql`: hasil ekspor MySQL/MariaDB siap impor, berisi struktur dan 36 data demo; tidak memuat data unggahan pribadi dari instalasi lokal.
- `database/schema.sql`: struktur database tanpa data mahasiswa.
- `database/dummy.sql`: 36 data dummy; `INSERT IGNORE` mencegah duplikasi NIM saat dijalankan ulang.
- `assets/demo/`: gambar yang dirujuk oleh data dummy dalam ekspor SQL.
- `.gitignore`: mengecualikan unggahan pengguna, konfigurasi `.env`, dan artefak pengujian dari Git.

## Pengujian

```sh
php tests/grade_directory_test.php
```

Uji logika membutuhkan PDO SQLite. Uji integrasi membutuhkan database terpisah bernama `selectdb_uts_test` dengan struktur dari `database/schema.sql` (ganti nama database di file SQL ketika membuat database uji).

Jalankan server uji dari folder proyek:

```sh
DB_NAME=selectdb_uts_test php -S 127.0.0.1:8081 -t ..
```

Jalankan dari terminal lain:

```sh
DB_NAME=selectdb_uts_test TEST_BASE_URL=http://127.0.0.1:8081/selectdb php tests/http_directory_test.php
```

Atur variabel koneksi yang sama pada server dan pengujian bila koneksi MySQL berbeda dari bawaan XAMPP. Pengujian mencakup ukuran halaman 5/10/15, semua tombol navigasi, kombinasi pencarian/filter/sorting, unggah dan penggantian foto, penghapusan, validasi gambar, NIM ganda, serta CSRF. Data uji dibersihkan setelah pengujian.
