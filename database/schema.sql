CREATE DATABASE IF NOT EXISTS dbnilai
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE dbnilai;

CREATE TABLE IF NOT EXISTS nilaimhsw (
  nim VARCHAR(20) NOT NULL,
  nm_lengkap VARCHAR(100) NOT NULL,
  file_path VARCHAR(255) NULL,
  nilai_akhir DECIMAL(5,2) NOT NULL,
  nilai_huruf CHAR(1) NULL,
  predikat VARCHAR(50) NULL,
  created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (nim),
  KEY nilaimhsw_nama_index (nm_lengkap),
  KEY nilaimhsw_predikat_index (predikat)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS gambar (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nama_file VARCHAR(255) COLLATE utf8mb4_bin NOT NULL,
  tgl_unggah DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY gambar_nama_file_unique (nama_file)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
