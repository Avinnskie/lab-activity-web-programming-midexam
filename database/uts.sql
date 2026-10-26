-- Jalankan satu kali di phpMyAdmin untuk database yang sudah ada.
USE dbnilai;

ALTER TABLE nilai ADD COLUMN IF NOT EXISTS foto VARCHAR(255) NULL AFTER nm_lengkap;
