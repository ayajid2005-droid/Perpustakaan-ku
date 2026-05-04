-- DATABASE PERPUSTAKAAN LENGKAP

CREATE DATABASE IF NOT EXISTS perpustakaan;
USE perpustakaan;

-- TABEL ANGGOTA
CREATE TABLE anggota (
nim VARCHAR(20) PRIMARY KEY,
nama VARCHAR(100),
alamat TEXT,
jenis_kelamin VARCHAR(10),
jurusan VARCHAR(100),
no_hp VARCHAR(15),
email VARCHAR(100)
);

-- TABEL BUKU
CREATE TABLE data_buku (
kode_buku INT AUTO_INCREMENT PRIMARY KEY,
judul_buku VARCHAR(255),
penulis VARCHAR(255),
tahun INT,
kategori VARCHAR(100)
);

-- TABEL PUSTAKAWAN
CREATE TABLE pustakawan (
id_pustakawan INT AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR(100),
alamat TEXT,
no_hp VARCHAR(15),
email VARCHAR(100),
jabatan VARCHAR(100)
);

-- TABEL LOGIN
CREATE TABLE login (
id_login INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50),
password VARCHAR(255),
level VARCHAR(20)
);

-- TABEL PEMINJAMAN
CREATE TABLE peminjaman (
id_peminjaman INT AUTO_INCREMENT PRIMARY KEY,
nim VARCHAR(20),
kode_buku INT,
tanggal_pinjam DATE,
tanggal_kembali DATE,
status VARCHAR(20),

FOREIGN KEY (nim) REFERENCES anggota(nim)
    ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (kode_buku) REFERENCES data_buku(kode_buku)
    ON DELETE CASCADE ON UPDATE CASCADE

);

-- TABEL PENGEMBALIAN
CREATE TABLE pengembalian (
id_pengembalian INT AUTO_INCREMENT PRIMARY KEY,
id_peminjaman INT,
tanggal_dikembalikan DATE,
denda INT,

FOREIGN KEY (id_peminjaman) REFERENCES peminjaman(id_peminjaman)
    ON DELETE CASCADE ON UPDATE CASCADE

);

-- DATA AWAL

INSERT INTO anggota VALUES
('2023001', 'Ahmad', 'Banjarmasin', 'Laki-laki', 'Pendidikan', '08123456789', 'ahmad@mail.com'),
('2023002', 'Siti', 'Banjarbaru', 'Perempuan', 'Perpustakaan', '08234567890', 'siti@mail.com');

INSERT INTO data_buku (judul_buku, penulis, tahun, kategori) VALUES
('Media Pembelajaran', 'Azhar Arsyad', 2007, 'Pendidikan'),
('Sukses Melakukan Presentasi', 'Rhenald Kasali', 2001, 'Komunikasi'),
('Pendidikan Kewarganegaraan', 'Mardenis', 2022, 'Warganegara');

INSERT INTO pustakawan (nama, alamat, no_hp, email, jabatan) VALUES
('Budi', 'Banjarmasin', '0811111111', 'budi@mail.com', 'Admin');

INSERT INTO login (username, password, level) VALUES
('admin', 'admin123', 'admin');

INSERT INTO peminjaman (nim, kode_buku, tanggal_pinjam, tanggal_kembali, status) VALUES
('2023001', 1, '2026-05-01', '2026-05-07', 'Dipinjam');

INSERT INTO pengembalian (id_peminjaman, tanggal_dikembalikan, denda) VALUES
(1, '2026-05-06', 0);