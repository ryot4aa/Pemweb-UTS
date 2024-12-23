-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk sistem_informasi_mahasiswa
CREATE DATABASE IF NOT EXISTS `sistem_informasi_mahasiswa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistem_informasi_mahasiswa`;

-- membuang struktur untuk table sistem_informasi_mahasiswa.berita
CREATE TABLE IF NOT EXISTS `berita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `berita` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.berita: ~2 rows (lebih kurang)
INSERT INTO `berita` (`id`, `judul`, `berita`, `created_at`, `updated_at`) VALUES
	(2, 'Peraturan rektor tentang Tugas Akhir', 'Berikut adalah Peraturan Rektor mengenai Pelaksanaan Tugas Akhir, Skripsi dan Tesis di lingkungan Institut Teknologi Nasional Tahun 2021', '2021-07-04 23:27:09', '2024-11-14 11:08:18'),
	(5, 'UAS PEMWEB', 'Uas pemweb berbasis project kelompok', '2024-12-16 02:19:38', '2024-12-16 02:19:38'),
	(6, 'Pedoman Akademik Institut Teknologi Nasional ', 'Tri Dharma perguruan tinggi Institut Teknologi Nasional', '2024-12-16 02:21:21', '2024-12-16 02:21:21');

-- membuang struktur untuk table sistem_informasi_mahasiswa.biodata
CREATE TABLE IF NOT EXISTS `biodata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'assets/img/default.jpg',
  `jenis_kelamin` tinyint NOT NULL DEFAULT '0',
  `tempat_lahir` varchar(64) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `golongan_darah` tinyint NOT NULL DEFAULT '0',
  `agama` tinyint NOT NULL DEFAULT '0',
  `alamat` text NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '0 = tidak aktif\r\n1 = aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `biodata_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4319056 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.biodata: ~5 rows (lebih kurang)
INSERT INTO `biodata` (`id`, `id_user`, `nama_lengkap`, `foto`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `golongan_darah`, `agama`, `alamat`, `no_telepon`, `status`, `created_at`, `updated_at`) VALUES
	(1, 5, 'Anwar Subkiman', 'assets/img/default.jpg', 0, 'Ujung Berung', '1995-08-17', 0, 0, 'Bandung', '08123456789', 1, '2024-11-11 14:48:25', '2024-11-11 14:48:26'),
	(9, 3, 'Super Admin', 'uploads/1625438851.jpg', 0, 'Tangerang', '2000-01-25', 0, 0, 'Sidoarjo', '08798654321', 1, '2021-06-30 15:06:04', '2024-11-11 14:53:41'),
	(4319052, 41, 'Freya Jayawardana', 'uploads/1731340966.jpg', 1, 'Yogyakarta', '2005-05-11', 1, 0, 'Jakarta', '08123456789', 1, '2024-11-11 16:02:46', '2024-11-11 16:02:46'),
	(4319055, 44, 'Azizi Shafa Asadel', 'uploads/1731584429.jpg', 1, 'Jakarta', '2004-08-17', 1, 0, 'Jakarta', '081759456214', 1, '2024-11-14 11:40:29', '2024-11-14 11:40:29');

-- membuang struktur untuk table sistem_informasi_mahasiswa.dosen
CREATE TABLE IF NOT EXISTS `dosen` (
  `nip` int NOT NULL AUTO_INCREMENT,
  `nama_dosen` varchar(255) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.dosen: ~3 rows (lebih kurang)
INSERT INTO `dosen` (`nip`, `nama_dosen`, `departemen`, `id_user`) VALUES
	(1, 'M Rizky Hidayat', 'Teknik Informatika', NULL),
	(2, 'Tyo Riyandi', 'Teknik Informatika', NULL),
	(3, 'Anwar Subkiman', 'Teknik Informatika', 5);

-- membuang struktur untuk table sistem_informasi_mahasiswa.fakultas
CREATE TABLE IF NOT EXISTS `fakultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_fakultas` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.fakultas: ~0 rows (lebih kurang)
INSERT INTO `fakultas` (`id`, `nama_fakultas`, `created_at`, `updated_at`) VALUES
	(1, 'teknik komputer', '2021-06-21 09:31:08', '2024-11-11 14:08:18'),
	(2, 'ilmu filsafat', '2024-11-11 14:07:45', '2024-11-11 14:07:55');

-- membuang struktur untuk table sistem_informasi_mahasiswa.jadwal_kuliah
CREATE TABLE IF NOT EXISTS `jadwal_kuliah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mata_kuliah` int NOT NULL,
  `id_dosen` int NOT NULL,
  `jam_kuliah` time NOT NULL,
  `hari_kuliah` varchar(14) NOT NULL,
  `ruang` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_mata_kuliah` (`id_mata_kuliah`),
  KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `jadwal_kuliah_ibfk_1` FOREIGN KEY (`id_mata_kuliah`) REFERENCES `mata_kuliah` (`id`),
  CONSTRAINT `jadwal_kuliah_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.jadwal_kuliah: ~8 rows (lebih kurang)
INSERT INTO `jadwal_kuliah` (`id`, `id_mata_kuliah`, `id_dosen`, `jam_kuliah`, `hari_kuliah`, `ruang`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, '08:30:00', 'Senin', 'A-10', '2021-06-22 03:45:27', '2021-06-22 09:24:27'),
	(2, 1, 2, '10:30:00', 'Senin', 'B-01', '2021-06-22 03:45:27', '2021-06-22 09:24:30'),
	(3, 6, 1, '08:30:00', 'Selasa', 'A-10', '2021-07-05 00:09:26', '2021-07-05 00:09:26'),
	(4, 3, 2, '10:30:00', 'Selasa', 'A-01', '2021-07-05 00:20:16', '2021-07-05 00:22:50'),
	(5, 5, 1, '22:30:05', 'Kamis', 'C-02', '2024-11-11 14:21:33', '2024-11-11 15:49:15'),
	(6, 4, 1, '19:00:00', 'Kamis', 'C-02', '2024-11-11 14:22:30', '2024-11-11 14:22:30'),
	(7, 2, 2, '23:59:00', 'Kamis', '02306', '2024-11-14 11:20:08', '2024-11-14 11:44:24'),
	(8, 7, 3, '10:00:00', 'Senin', '02306', '2024-11-14 11:43:42', '2024-11-14 11:43:42');

-- membuang struktur untuk table sistem_informasi_mahasiswa.jadwal_mahasiswa
CREATE TABLE IF NOT EXISTS `jadwal_mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_jadwal_kuliah` int NOT NULL,
  `id_user` int NOT NULL,
  `semester` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_jadwal_kuliah` (`id_jadwal_kuliah`),
  KEY `nim` (`id_user`),
  CONSTRAINT `jadwal_mahasiswa_ibfk_1` FOREIGN KEY (`id_jadwal_kuliah`) REFERENCES `jadwal_kuliah` (`id`),
  CONSTRAINT `jadwal_mahasiswa_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.jadwal_mahasiswa: ~0 rows (lebih kurang)
INSERT INTO `jadwal_mahasiswa` (`id`, `id_jadwal_kuliah`, `id_user`, `semester`, `created_at`, `updated_at`) VALUES
	(26, 5, 41, 1, '2024-11-14 11:47:50', '2024-11-14 11:47:50'),
	(27, 3, 41, 1, '2024-12-16 01:44:31', '2024-12-16 01:44:31');

-- membuang struktur untuk table sistem_informasi_mahasiswa.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_dosen` int NOT NULL,
  `id_prodi` int NOT NULL,
  `semester` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`,`id_dosen`,`id_prodi`),
  KEY `id_dosen` (`id_dosen`),
  KEY `id_prodi` (`id_prodi`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`nip`),
  CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.mahasiswa: ~3 rows (lebih kurang)
INSERT INTO `mahasiswa` (`id`, `id_user`, `id_dosen`, `id_prodi`, `semester`, `created_at`, `updated_at`) VALUES
	(8, 41, 1, 4, 1, '2024-11-11 16:02:46', '2024-11-11 16:02:46'),
	(11, 44, 3, 1, 1, '2024-11-14 11:40:29', '2024-11-14 11:40:29');

-- membuang struktur untuk table sistem_informasi_mahasiswa.mata_kuliah
CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_mata_kuliah` varchar(255) NOT NULL,
  `id_prodi` int NOT NULL,
  `sks` int NOT NULL,
  `semester` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_prodi` (`id_prodi`),
  CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.mata_kuliah: ~7 rows (lebih kurang)
INSERT INTO `mata_kuliah` (`id`, `nama_mata_kuliah`, `id_prodi`, `sks`, `semester`, `created_at`, `updated_at`) VALUES
	(1, 'Basis Data', 2, 2, 1, '2021-06-22 03:44:09', '2021-07-04 22:28:21'),
	(2, 'Algoritma Pemrograman', 1, 2, 1, '2021-06-22 03:44:09', '2021-06-22 03:44:09'),
	(3, 'Desain dan Pemrograman Web', 1, 2, 1, '2021-07-04 11:47:59', '2021-07-04 11:47:59'),
	(4, 'Filsafat Sains dan Teknologi', 4, 4, 1, '2024-11-11 14:16:18', '2024-11-11 14:19:15'),
	(5, 'Filsafat dan Spiritualitas', 3, 4, 1, '2024-11-11 14:19:04', '2024-11-11 14:19:04'),
	(6, 'Desain Grafis', 2, 3, 1, '2021-07-04 23:31:25', '2021-07-04 23:31:25'),
	(7, 'Pemograman Web', 1, 3, 3, '2024-11-14 11:19:08', '2024-11-14 11:19:08');

-- membuang struktur untuk table sistem_informasi_mahasiswa.prodi
CREATE TABLE IF NOT EXISTS `prodi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(64) NOT NULL,
  `id_fakultas` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_fakultas` (`id_fakultas`),
  CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.prodi: ~4 rows (lebih kurang)
INSERT INTO `prodi` (`id`, `nama_prodi`, `id_fakultas`, `created_at`, `updated_at`) VALUES
	(1, 'Teknik Informatika', 1, '2021-06-21 09:32:52', '2021-06-21 09:32:52'),
	(2, 'Sistem Informasi', 1, '2021-07-04 22:28:01', '2021-07-04 22:28:01'),
	(3, 'Filsafat Agama', 2, '2024-11-11 14:09:26', '2024-11-11 14:09:26'),
	(4, 'Filsafat Sains', 2, '2024-11-11 14:10:09', '2024-11-11 14:10:09');

-- membuang struktur untuk table sistem_informasi_mahasiswa.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.roles: ~3 rows (lebih kurang)
INSERT INTO `roles` (`id`, `nama_role`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2021-06-30 14:28:44', '2021-06-30 14:28:44'),
	(2, 'mahasiswa', '2021-06-30 14:28:44', '2021-06-30 14:28:44'),
	(3, 'dosen', '2021-06-30 14:28:50', '2021-06-30 14:28:50');

-- membuang struktur untuk table sistem_informasi_mahasiswa.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel sistem_informasi_mahasiswa.users: ~5 rows (lebih kurang)
INSERT INTO `users` (`id`, `id_role`, `username`, `password`, `created_at`, `updated_at`) VALUES
	(3, 1, 'admin', 'admin', '2021-06-30 15:05:28', '2024-11-11 08:51:18'),
	(5, 3, 'anwar', 'anwar', '2024-11-11 14:39:34', '2024-11-11 14:55:26'),
	(41, 2, '152023111', '12345', '2024-11-11 16:02:46', '2024-11-12 07:06:12'),
	(44, 2, '152023044', '8c4102eee35c459c817c5286378e3f7a', '2024-11-14 11:40:29', '2024-11-14 11:40:29');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
