-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for jobskuy
CREATE DATABASE IF NOT EXISTS `jobskuy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jobskuy`;

-- Dumping structure for table jobskuy.detail_pesanan
CREATE TABLE IF NOT EXISTS `detail_pesanan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produk_id` int NOT NULL,
  `qty` int NOT NULL,
  `pesanan_id` int NOT NULL,
  PRIMARY KEY (`id`,`produk_id`,`pesanan_id`),
  KEY `pesanan_id` (`pesanan_id`),
  KEY `produk_id` (`produk_id`),
  CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pesanan_ibfk_3` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.detail_pesanan: ~4 rows (approximately)
INSERT INTO `detail_pesanan` (`id`, `produk_id`, `qty`, `pesanan_id`) VALUES
	(121, 1, 1, 105),
	(122, 6, 1, 106),
	(123, 3, 2, 107),
	(124, 7, 1, 108);

-- Dumping structure for table jobskuy.info_pembayaran
CREATE TABLE IF NOT EXISTS `info_pembayaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `info` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.info_pembayaran: ~0 rows (approximately)
INSERT INTO `info_pembayaran` (`id`, `info`) VALUES
	(1, 'Bacalah dengan teliti apabila ingin melakukan transaksi\r\n\r\nPembayaran Transaksi Bisa Melalui Rekening Di Bawah Ini\r\nBRI => 66019288 a/n Jobskuy\r\n\r\nkemudian konfirmasi pembayaran bisa di menu pembayaran');

-- Dumping structure for table jobskuy.kategori_produk
CREATE TABLE IF NOT EXISTS `kategori_produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.kategori_produk: ~4 rows (approximately)
INSERT INTO `kategori_produk` (`id`, `nama`, `deskripsi`) VALUES
	(6, 'Graphics & Design', ''),
	(7, 'Programming & Tech', ''),
	(8, 'Digital Marketing', ''),
	(9, 'Video & Animation', '');

-- Dumping structure for table jobskuy.kontak
CREATE TABLE IF NOT EXISTS `kontak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `pesan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.kontak: ~23 rows (approximately)
INSERT INTO `kontak` (`id`, `nama`, `email`, `subjek`, `pesan`) VALUES
	(93, '', 'wawan13596@gmail.com', '', ''),
	(94, '', 'wawan13596@gmail.com', '', ''),
	(95, '', 'wawan13596@gmail.com', '', ''),
	(96, '', 'wawan13596@gmail.com', '', ''),
	(97, '', 'wawan13596@gmail.com', '', ''),
	(98, '', 'wawan13596@gmail.com', '', ''),
	(99, '', 'wawan13596@gmail.com', '', ''),
	(100, '', 'wawan13596@gmail.com', '', ''),
	(101, '', 'wawan13596@gmail.com', '', ''),
	(102, '', 'wawan13596@gmail.com', '', ''),
	(103, '', 'wawan13596@gmail.com', '', ''),
	(104, '', 'wawan13596@gmail.com', '', ''),
	(105, '', 'wawan13596@gmail.com', '', ''),
	(106, 'wawan nawan', 'wawan13596@gmail.com', '1', 'wer'),
	(107, '', 'wawan13596@gmail.com', '', ''),
	(108, '', 'wawan13596@gmail.com', '', ''),
	(109, '', 'wawan13596@gmail.com', '', ''),
	(110, '', 'wawan13596@gmail.com', '', ''),
	(111, '', 'wawan13596@gmail.com', '', ''),
	(112, '', 'wawan13596@gmail.com', '', ''),
	(113, '', 'wawan13596@gmail.com', '', ''),
	(114, '', 'wawan13596@gmail.com', '', ''),
	(115, '', 'wawan13596@gmail.com', '', '');

-- Dumping structure for table jobskuy.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pesanan` int NOT NULL,
  `id_user` int NOT NULL,
  `file` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `status` enum('pending','verified','','') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.pembayaran: ~8 rows (approximately)
INSERT INTO `pembayaran` (`id`, `id_pesanan`, `id_user`, `file`, `total`, `status`, `keterangan`, `created_at`) VALUES
	(35, 105, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (7).png', 1200000, 'verified', '', '2024-01-21 15:26:34'),
	(36, 106, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (5).png', 30000, 'verified', '', '2024-01-21 15:28:38'),
	(37, 106, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (6).png', 50000, 'verified', '', '2024-01-21 15:36:33'),
	(38, 106, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (5).png', 1000000, 'verified', '', '2024-01-21 15:37:41'),
	(39, 106, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (5).png', 320000, 'verified', '', '2024-01-21 15:38:16'),
	(40, 107, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (5).png', 10000000, 'verified', '', '2024-01-21 15:47:24'),
	(41, 108, 7, '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot (5).png', 1400000, 'verified', '', '2024-01-23 15:09:47'),
	(42, 109, 10, '49eb6a44db57cba8d66b3404fa9f0ad4denissa-devy-fU2Mus9qmN8-unsplash.jpg', 1200000, 'verified', 'asdasd', '2024-02-01 05:20:32');

-- Dumping structure for table jobskuy.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal_pesan` datetime NOT NULL,
  `user_id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `read` enum('0','1') NOT NULL,
  `status` enum('lunas','belum lunas','','') NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.pesanan: ~4 rows (approximately)
INSERT INTO `pesanan` (`id`, `tanggal_pesan`, `user_id`, `nama`, `telephone`, `read`, `status`) VALUES
	(105, '2024-01-21 09:26:13', 7, 'wawan', '0812345678', '1', 'lunas'),
	(106, '2024-01-21 09:28:24', 7, 'wawan', '0812345678', '1', 'lunas'),
	(107, '2024-01-21 09:38:59', 7, 'wawan', '0812345678', '1', 'lunas'),
	(108, '2024-01-23 09:07:59', 7, 'wawan', '0812345678', '1', 'lunas');

-- Dumping structure for table jobskuy.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kategori_produk_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`,`kategori_produk_id`),
  KEY `kategori_produk_id` (`kategori_produk_id`),
  KEY `produk_relation_2` (`user_id`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produk_relation_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.produk: ~8 rows (approximately)
INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `gambar`, `harga`, `kategori_produk_id`, `user_id`) VALUES
	(1, 'Software Development', 'â€¢ Pengembang aplikasi yang bersemangat dengan latar belakang yang kuat dalam merancang, mengkode, dan mengimplementasikan aplikasi web progresif. \r\nâ€¢ Terampil dalam memanfaatkan teknologi dan kerangka kerja modern untuk memberikan solusi yang ramah pengguna. Berkomitmen untuk selalu mengikuti tren industri dan praktik terbaik untuk secara konsisten memberikan solusi inovatif dan efektif. Didedikasikan untuk memberikan pengalaman pengguna yang luar biasa dan mencapai tujuan proyek tepat waktu dan sesuai anggaran.', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-17 005310.png', 1200000, 7, NULL),
	(2, 'Social Media Marketing', 'Prosesnya mudah, dan Anda akan dipandu sepanjang proyek. Postingan dikirimkan sebelum dimulainya kampanye bulanan untuk ditinjau dan disetujui.', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-20 200027.png', 1300000, 8, NULL),
	(3, 'Art & Illustration', 'Saya seorang seniman digital, saya menggambar gambar apa pun sesuai pesanan. Sangat cepat dan efisien', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-16 125724.png', 1500000, 6, NULL),
	(4, 'Character Animation', 'Saya menganalisis semua rekaman dengan sangat hati-hati untuk mendapatkan hasil yang bagus. Target utama saya adalah membuat video apa pun menjadi sinematik dan selesai dengan baik. Sebenarnya saya percaya pada pekerjaan yang sempurna, baik proyek besar maupun kecil.', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-17 005003.png', 1000000, 9, NULL),
	(5, 'Logo Design', 'Saya akan bekerja dengan Anda untuk memahami merek dan audiens target Anda, dan kemudian saya akan menciptakan merek yang secara visual menakjubkan dan mudah diingat. Saya akan menggunakan keahlian saya dalam tipografi, teori warna, dan komposisi untuk menciptakan ikon yang unik dan abadi.', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-20 202009.png', 1250000, 6, NULL),
	(6, 'Scripting', 'Saya mempunyai hasrat terhadap angka 0 dan angka 1. Meskipun saya baru mengenal platform lepas ini, saya telah memiliki pengalaman bertahun-tahun bekerja di Web, rekayasa data, dan Pengembangan Perangkat Lunak menggunakan berbagai teknologi. Saya menikmati menciptakan sesuatu dan selalu', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-20 202232.png', 1400000, 7, NULL),
	(7, 'Video Marketing', 'Saya mendapat kehormatan bekerja dengan beberapa influencer top di seluruh dunia dalam relaksasi dan 10 niche teratas serta banyak niche berbeda di YouTube. Saya telah mempelajari: E-Commerce, YouTube, Pemasaran, dan Penjualan.', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-20 202443.png', 1400000, 8, NULL),
	(8, 'Visual Effects', 'Gig-nya menawarkan solusi lengkap komposisi efek visual (VFX) dari awal hingga akhir. Dari pengeditan video sederhana dan penilaian warna hingga VFX kompleks termasuk penguncian layar hijau, penghapusan objek, penempatan lingkungan 3D, pelacakan 2D dan 3D, koreksi warna, pelacakan pembersihan digital, dan pengomposisian. Pertunjukan dapat mengambil proyek apa pun, dalam bentuk pendek atau panjang. Jangan ragu untuk menghubungi saya dengan kebutuhan spesifik Anda.', '49eb6a44db57cba8d66b3404fa9f0ad4Screenshot 2023-11-20 202737.png', 1500000, 9, NULL);

-- Dumping structure for table jobskuy.review
CREATE TABLE IF NOT EXISTS `review` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produk_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jobskuy.review: ~5 rows (approximately)
INSERT INTO `review` (`id`, `produk_id`, `user_id`, `rating`, `review`, `created_at`) VALUES
	(2, 1, 10, 4, 'OK', '2024-01-31 23:59:50'),
	(3, 1, 10, 2, 'andkabsd', '2024-02-01 00:28:54'),
	(4, 1, 7, 3, 'bagus barangnya', '2024-02-01 00:31:55'),
	(5, 7, 7, 3, 'review mantap', '2024-02-01 00:47:54'),
	(6, 7, 7, 5, 'review baru', '2024-02-01 00:48:38');

-- Dumping structure for table jobskuy.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `alamat` text,
  `password` text NOT NULL,
  `status` enum('user','admin','freelance') NOT NULL,
  `skills` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table jobskuy.user: ~4 rows (approximately)
INSERT INTO `user` (`id`, `nama`, `email`, `telephone`, `alamat`, `password`, `status`, `skills`) VALUES
	(1, 'Administrator', 'admin@gmail.com', '08985432330', 'pekanbaru', '21232f297a57a5a743894a0e4a801fc3', 'admin', NULL),
	(7, 'wawan', 'wawan13596@gmail.com', '0812345678', 'pekanbaru', '202cb962ac59075b964b07152d234b70', 'user', NULL),
	(9, 'annisa', 'annisa@gmail.com', '0813233873738', 'rumbai', '84d9ee44e457ddef7f2c4f25dc8fa865', 'user', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
