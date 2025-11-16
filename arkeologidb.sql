-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Bulan Mei 2025 pada 20.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arkeologidb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `arkeolog`
--

CREATE TABLE `arkeolog` (
  `id_arkeolog` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `institusi` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `arkeolog`
--

INSERT INTO `arkeolog` (`id_arkeolog`, `nama`, `institusi`, `email`) VALUES
(1, 'Dr. Andi Kurniawan', 'Universitas Arkeologi Nusantara', 'andi@uan.ac.id'),
(2, 'Prof. Sari Lestari', 'Pusat Arkeologi Nasional', 'sari@pan.or.id'),
(3, 'Dr. Budi Raharjo', 'Universitas Gadjah Mada', 'budi@ugm.ac.id'),
(4, 'Dr. Lina Susanti', 'Universitas Indonesia', 'lina@ui.ac.id'),
(5, 'Dr. Yoga Saputra', 'Universitas Hasanuddin', 'yoga@unhas.ac.id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `artefak`
--

CREATE TABLE `artefak` (
  `id_artefak` int(11) NOT NULL,
  `id_lokasi` int(11) DEFAULT NULL,
  `id_budaya` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_ditemukan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `artefak`
--

INSERT INTO `artefak` (`id_artefak`, `id_lokasi`, `id_budaya`, `nama`, `deskripsi`, `tanggal_ditemukan`) VALUES
(1, 1, 1, 'Menhir A', 'Menhir silinder besar', '2023-07-10'),
(2, 2, 1, 'Menhir B', 'Menhir dengan pahatan pola lingkar', '2023-07-12'),
(3, 3, 2, 'Prasasti Majapahit', 'Prasasti batu bertulisan Kawi', '2023-08-05'),
(4, 4, 3, 'Patung Ganesha', 'Patung batu dewa Ganesha', '2023-08-10'),
(5, 5, 1, 'Patung Lembah', 'Patung batu besar berbentuk manusia', '2023-09-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `artefak_ekspedisi`
--

CREATE TABLE `artefak_ekspedisi` (
  `id_artefak` int(11) NOT NULL,
  `id_ekspedisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `artefak_ekspedisi`
--

INSERT INTO `artefak_ekspedisi` (`id_artefak`, `id_ekspedisi`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `budaya`
--

CREATE TABLE `budaya` (
  `id_budaya` int(11) NOT NULL,
  `nama_budaya` varchar(100) DEFAULT NULL,
  `periode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `budaya`
--

INSERT INTO `budaya` (`id_budaya`, `nama_budaya`, `periode`) VALUES
(1, 'Megalitik', '2000 SM - 500 M'),
(2, 'Majapahit', '1293 - 1500 M'),
(3, 'Hindu-Buddha', '600 - 1500 M'),
(4, 'Prasejarah', '5000 SM - 1000 SM'),
(5, 'Kolonial', '1600 - 1945 M');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekspedisi`
--

CREATE TABLE `ekspedisi` (
  `id_ekspedisi` int(11) NOT NULL,
  `id_arkeolog` int(11) DEFAULT NULL,
  `id_situs` int(11) DEFAULT NULL,
  `nama_ekspedisi` varchar(100) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ekspedisi`
--

INSERT INTO `ekspedisi` (`id_ekspedisi`, `id_arkeolog`, `id_situs`, `nama_ekspedisi`, `tanggal_mulai`, `tanggal_selesai`, `catatan`) VALUES
(1, 1, 1, 'Eksplorasi Gunung Padang I', '2023-07-01', '2023-07-20', 'Eksplorasi tahap awal'),
(2, 2, 2, 'Ekskavasi Trowulan 2023', '2023-08-01', '2023-08-25', 'Penggalian lanjutan'),
(3, 3, 3, 'Ekskavasi Sambisari', '2023-08-10', '2023-08-22', 'Pemetaan reruntuhan candi'),
(4, 4, 4, 'Survei Liang Bua', '2023-09-01', '2023-09-10', 'Penelitian manusia purba'),
(5, 5, 5, 'Penelitian Lembah Bada', '2023-09-15', '2023-09-25', 'Pencatatan artefak batu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_laboratorium`
--

CREATE TABLE `hasil_laboratorium` (
  `id_hasil` int(11) NOT NULL,
  `id_artefak` int(11) DEFAULT NULL,
  `hasil` text DEFAULT NULL,
  `tanggal_analisis` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `hasil_laboratorium`
--

INSERT INTO `hasil_laboratorium` (`id_hasil`, `id_artefak`, `hasil`, `tanggal_analisis`) VALUES
(1, 1, 'Analisis komposisi batu: granit, umur 2500 SM.', '2023-07-25'),
(2, 2, 'Analisis morfologi menunjukkan pahatan simbol astral.', '2023-07-27'),
(3, 3, 'Teks prasasti dari zaman Hayam Wuruk, akhir abad ke-14.', '2023-08-30'),
(4, 4, 'Batu berpori dengan sisa pigmen merah, simbol pemujaan.', '2023-09-03'),
(5, 5, 'Patung dipahat dari batu andesit, estimasi tahun 1800 SM.', '2023-09-28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `id_situs` int(11) DEFAULT NULL,
  `nama_lokasi` varchar(100) DEFAULT NULL,
  `koordinat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `id_situs`, `nama_lokasi`, `koordinat`) VALUES
(1, 1, 'Blok A', '-6.993, 107.512'),
(2, 1, 'Blok B', '-6.995, 107.514'),
(3, 2, 'Candi Utama', '-7.565, 112.438'),
(4, 3, 'Sambisari Barat', '-7.748, 110.402'),
(5, 5, 'Lembah Tengah', '-1.432, 120.254');

-- --------------------------------------------------------

--
-- Struktur dari tabel `situs_arkeologi`
--

CREATE TABLE `situs_arkeologi` (
  `id_situs` int(11) NOT NULL,
  `nama_situs` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `situs_arkeologi`
--

INSERT INTO `situs_arkeologi` (`id_situs`, `nama_situs`, `deskripsi`, `lokasi`) VALUES
(1, 'Situs Gunung Padang', 'Situs megalitik tertua di Asia Tenggara', 'Cianjur, Jawa Barat'),
(2, 'Situs Trowulan', 'Pusat kerajaan Majapahit', 'Mojokerto, Jawa Timur'),
(3, 'Situs Sambisari', 'Candi bawah tanah peninggalan Hindu', 'Yogyakarta'),
(4, 'Situs Liang Bua', 'Situs manusia Flores', 'Flores, NTT'),
(5, 'Situs Lembah Bada', 'Situs patung batu besar', 'Sulawesi Tengah');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `arkeolog`
--
ALTER TABLE `arkeolog`
  ADD PRIMARY KEY (`id_arkeolog`);

--
-- Indeks untuk tabel `artefak`
--
ALTER TABLE `artefak`
  ADD PRIMARY KEY (`id_artefak`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_budaya` (`id_budaya`);

--
-- Indeks untuk tabel `artefak_ekspedisi`
--
ALTER TABLE `artefak_ekspedisi`
  ADD PRIMARY KEY (`id_artefak`,`id_ekspedisi`),
  ADD KEY `id_ekspedisi` (`id_ekspedisi`);

--
-- Indeks untuk tabel `budaya`
--
ALTER TABLE `budaya`
  ADD PRIMARY KEY (`id_budaya`);

--
-- Indeks untuk tabel `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD PRIMARY KEY (`id_ekspedisi`),
  ADD KEY `id_arkeolog` (`id_arkeolog`),
  ADD KEY `id_situs` (`id_situs`);

--
-- Indeks untuk tabel `hasil_laboratorium`
--
ALTER TABLE `hasil_laboratorium`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_artefak` (`id_artefak`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`),
  ADD KEY `id_situs` (`id_situs`);

--
-- Indeks untuk tabel `situs_arkeologi`
--
ALTER TABLE `situs_arkeologi`
  ADD PRIMARY KEY (`id_situs`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `arkeolog`
--
ALTER TABLE `arkeolog`
  MODIFY `id_arkeolog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `artefak`
--
ALTER TABLE `artefak`
  MODIFY `id_artefak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `budaya`
--
ALTER TABLE `budaya`
  MODIFY `id_budaya` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ekspedisi`
--
ALTER TABLE `ekspedisi`
  MODIFY `id_ekspedisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `hasil_laboratorium`
--
ALTER TABLE `hasil_laboratorium`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `situs_arkeologi`
--
ALTER TABLE `situs_arkeologi`
  MODIFY `id_situs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `artefak`
--
ALTER TABLE `artefak`
  ADD CONSTRAINT `artefak_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`),
  ADD CONSTRAINT `artefak_ibfk_2` FOREIGN KEY (`id_budaya`) REFERENCES `budaya` (`id_budaya`);

--
-- Ketidakleluasaan untuk tabel `artefak_ekspedisi`
--
ALTER TABLE `artefak_ekspedisi`
  ADD CONSTRAINT `artefak_ekspedisi_ibfk_1` FOREIGN KEY (`id_artefak`) REFERENCES `artefak` (`id_artefak`),
  ADD CONSTRAINT `artefak_ekspedisi_ibfk_2` FOREIGN KEY (`id_ekspedisi`) REFERENCES `ekspedisi` (`id_ekspedisi`);

--
-- Ketidakleluasaan untuk tabel `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD CONSTRAINT `ekspedisi_ibfk_1` FOREIGN KEY (`id_arkeolog`) REFERENCES `arkeolog` (`id_arkeolog`),
  ADD CONSTRAINT `ekspedisi_ibfk_2` FOREIGN KEY (`id_situs`) REFERENCES `situs_arkeologi` (`id_situs`);

--
-- Ketidakleluasaan untuk tabel `hasil_laboratorium`
--
ALTER TABLE `hasil_laboratorium`
  ADD CONSTRAINT `hasil_laboratorium_ibfk_1` FOREIGN KEY (`id_artefak`) REFERENCES `artefak` (`id_artefak`);

--
-- Ketidakleluasaan untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD CONSTRAINT `lokasi_ibfk_1` FOREIGN KEY (`id_situs`) REFERENCES `situs_arkeologi` (`id_situs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
