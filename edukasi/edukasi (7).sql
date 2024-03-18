-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Mar 2024 pada 14.56
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edukasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `konten`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Lokasi Buka Puasa Gratis di Jakarta Saat Ramadan 2024', 'Masjid Istiqlal menyediakan buka puasa gratis selama bulan Ramadan 1445 Hijriah/2024 Masehi. Meski demikian, jumlah hidangan buka puasa gratis yang disediakan oleh Masjid Istiqlal terbatas.\r\n\r\n', 'berita1.jpeg', '2024-03-12 08:45:03', '2024-03-12 08:45:03'),
(2, 'Warga Palestina Salat Tarawih di Masjid Al-Aqsa Dijaga Ketat Pasukan Israel', 'Malam pertama bulan suci Ramadan pada Minggu (10/3) waktu setempat, kawasan Masjid Al-Aqsa dijaga ketat oleh pasukan zionis Israel. Para tentara IDF memberlakukan pembatasan akses masuk warga Palestina ke Masjid Al-Aqsa.\r\nWarga Palestina yang diizinkan masuk ke Masjid Al-Aqsa untuk melaksanakan salat tarawih hanya wanita dan pria berusia 40 tahun ke atas. Sementara pemuda Palestina dilarang untuk melaksanakan salat tarawih di Masji Al-Aqsa.', 'berita2.jpeg', '2024-03-12 08:46:01', '2024-03-12 08:46:01'),
(3, 'Selama Ramadhan, jam kerja ASN di Tangerang berkurang 4,5 jam', 'Pemerintah Kabupaten Pemkab Tangerang, Provinsi Banten, menyebutkan jam kerja Aparatur Sipil Negara (ASN) di lingkup pemerintahan kabupaten itu berkurang 4,5 jam atau menjadi 32 jam per minggu selama Ramadhan. Pengurangan jam kerja bagi ASN tersebut, lanjutnya, diatur dalam Surat Edaran (SE) Nomor 1 Tahun 2024 tentang Jam kerja Aparatur Sipil Negara pada bulan Ramadhan 1445 Hijriah, mengacu pada Peraturan Presiden Nomor 21 Tahun 2023.\r\nIa menerangkan bagi pegawai ASN dengan sistem lima hari kerja yang terhitung dari hari Senin sampai Kamis masuk kerja pukul 08.00 WIB-15.00 WIB dengan waktu istirahat jam 12.00 WIB sampai 12.30 WIB', 'berita3.jpeg', '2024-03-12 08:53:52', '2024-03-12 08:53:52'),
(4, 'BMKG: Waspadai potensi angin kencang di Jateng selatan', 'Badan Meteorologi, Klimatologi, dan Geofisika (BMKG) meminta masyarakat Jawa Tengah (Jateng) bagian selatan agar mewaspadai angin kencang yang berpotensi terjadi hingga beberapa hari ke depan.\r\n\r\n\"Potensi terjadinya angin kencang ini turut dipicu oleh adanya bibit siklon tropis 91S di selatan Pulau Jawa,\" kata Kepala Kelompok Teknisi BMKG Stasiun Tunggul Wulung Cilacap Teguh Wardoyo di Cilacap, Selasa.\r\n\r\nDalam hal ini, kata dia, bibit siklon tropis 91S tersebut berada di Samudra Hindia sebelah barat daya Banten bergerak ke arah tenggara atau selatan Pulau Jawa.', 'berita4.jpeg', '2024-03-12 08:55:28', '2024-03-12 08:55:28'),
(5, 'Pemerintah Susun Aturan yang Bolehkan Jabatan ASN Diisi TNI-Polri', 'Menteri Pendayagunaan Aparatur Negara dan Reformasi Birokrasi (Menpan RB) Abdullah Azwar Anas mengatakan, saat ini pihaknya sedang menyusun rancangan Peraturan Pemerintah (PP) tentang manajemen aparatur sipil negara (ASN). Salah satu isi dalam rancangan PP tersebut yakni jabatan ASN yang bisa diisi oleh prajurit TNI dan Polri. \"Aturan ini juga membahas jabatan ASN yang bisa diisi oleh prajurit TNI dan personel Polri, serta sebaliknya,\" ujar Anas dilansir siaran pers dari laman resmi Kemenpan RB, Selasa (12/3/2024). Meski demikian, Anas menegaskan aturan tersebut nantinya bersifat resiprokal (timbal balik).', 'berita5.jpg', '2024-03-12 14:00:49', '2024-03-12 14:00:49'),
(6, 'Pemkot Tangerang imbau masyarakat cek keamanan pangan di pasar', 'Dinas Ketahanan Pangan Kota Tangerang, Banten, mengimbau masyarakat memanfaatkan Pojok Uji Keamanan Pangan yang berada di pasar tradisional maupun modern guna memastikan pangan yang dibeli tidak mengandung zat berbahaya.\r\n\r\n\"Gunakan Pojok Uji Keamanan Pangan untuk memastikan pangan yang dibeli dalam kondisi layak konsumsi dan tak ada kandungan zat berbahaya,\" kata Kepala Dinas Ketahanan Pangan (DKP) Kota Tangerang Muhdorun di Tangerang, Selasa.\r\n\r\nTak hanya bagi masyarakat sebagai pembeli tetapi pedagang selaku penjual pun bisa menggunakan layanan tersebut sehingga pangan yang dijual dalam kondisi terjamin keamanannya.\r\n\r\nDKP Kota Tangerang, lanjut Muhdorun, pada 4-6 Maret 2024 telah melakukan pengujian 206 sampel produk pangan, pertanian, peternakan, perikanan dan pangan olahan di sejumlah pasar tradisional.\r\n\r\nHasilnya, DKP Kota Tangerang mendapatkan 94,17 persen produk pangan yang telah diuji dinyatakan aman atau tidak mengandung zat kimia berbahaya.', 'berita6.jpg', '2024-03-12 14:01:48', '2024-03-12 14:01:48'),
(7, 'Prakiraan cuaca Semarang hari ini', 'Badan Meteorologi, Klimatologi, dan Geofisika (BMKG) mengeluarkan peringatan dini hujan sedang hingga lebat disertai petir pada Selasa, bagi sejumlah wilayah.\r\n\r\nSementara sebagian besar kota-kota di Indonesia diperkirakan berawan, bahkan berawan tebal, pada pagi hari, seperti Denpasar, Serang, Bengkulu, Jakarta Pusat, Jambi, Semarang, Surabaya, Palangkaraya, Tarakan, Tanjung Pinang, Bandar Lampung, Ambon, Mataram, Makassar, Kendari, dan Manado.\r\n\r\nHujan ringan diperkirakan turun pada siang di sejumlah kota, yaitu Denpasar, Serang, Yogyakarta, Jambi, Bandung, Semarang, Palangkaraya, Tanjung Pinang, Mataram, Jayapura, Manokwari, Mamuju, Kendari, dan Padang.', 'berita7.jpg', '2024-03-12 14:04:21', '2024-03-12 14:04:21'),
(8, 'BI NTT menyiapkan kas keliling penukaran uang sambut Idul Fitri', 'Kantor Perwakilan Bank Indonesia (BI) Wilayah Provinsi Nusa Tenggara Timur (NTT) menyediakan pelayanan kas keliling untuk penukaran uang rupiah selama bulan Ramadhan dalam menyambut Hari Raya Idul Fitri 1445 Hijriah.\r\n\r\n“Ini merupakan upaya yang kami lakukan dalam rangka memberikan kemudahan kepada masyarakat untuk memperoleh uang rupiah,” kata Kepala Perwakilan BI Provinsi NTT Agus Sistyo Widjajati, di Kupang, Senin malam.\r\n\r\nDia mengatakan bahwa ada dua lokasi yang menjadi lokasi penukaran uang melalui kas keliling yang disiapkan oleh BI yang dilakukan selama empat hari.\r\n\r\nAgus menambahkan bahwa lokasi pertama dilaksanakan di Bundaran Tirosa atau yang dikenal oleh masyarakat di Kota Kupang sebagai Bundaran PU yang dimulai pada 20 Maret, lalu 27 Maret, dan 3 April.\r\n\r\nSelain itu, pihaknya akan memanfaatkan momentum area hari bebas kendaraan bermotor atau car free day (CFD) di Kota Kupang bekerja sama dengan sejumlah perbankan di ibu kota Provinsi NTT itu.', 'berita8.jpg', '2024-03-12 14:05:38', '2024-03-12 14:05:38'),
(9, '2.000 staf medis di Jalur Gaza tidak miliki makanan berbuka puasa', 'Kementerian Kesehatan Palestina pada Senin mengatakan 2.000 staf medis yang bekerja di rumah sakit-rumah sakit di Jalur Gaza utara tidak memiliki makanan untuk berbuka puasa sambil masih mengerjakan tugas pada hari pertama puasa Ramadan.\r\n\r\n\"Para petugas medis sangat terpapar kelaparan yang melanda Jalur Gaza utara,\" ujar juru bicara Kementerian Kesehatan Palestina Ashraf al-Qudra dalam pernyataan.\r\n\r\nDia menyerukan agar organisasi-organisasi bantuan internasional untuk segera bergerak menyediakan makanan bagi staf medis.\r\n\r\nPada Senin (11/3), warga Palestina di Gaza, seperti juga Muslim di seluruh dunia, menjalani hari pertama Ramadan di bawah pemboman Israel yang terus berlanjut di Jalur Gaza, menjadikannya bulan terberat bagi mereka karena harus mengungsi dan kekurangan makanan, air, dan sebagian besar kebutuhan pokok.\r\n\r\nIsrael telah melancarkan serangan militer mematikan di Jalur Gaza sejak serangan lintas batas pada 7 Oktober oleh kelompok perlawanan Palestina, Hamas, yang menewaskan hampir 1.200 orang.\r\n', 'berita9.jpg', '2024-03-12 14:06:49', '2024-03-12 14:06:49'),
(10, 'Pemerintah Inggris janjikan dana untuk lindungi komunitas Muslim', 'emerintah Inggris pada Senin mengumumkan dana lebih dari 117 juta poundsterling (sekitar Rp2,32 triliun) untuk melindungi masjid, sekolah dan pusat komunitas Muslim di Inggris dari serangan kebencian selama empat tahun ke depan.\r\n\r\nLangkah tersebut menyusul janji Perdana Menteri Rishi Sunak pada akhir Februari untuk menyediakan dana lebih dari 70 juta poundsterling (sekitar Rp1,39 triliun) untuk melindungi sekolah-sekolah Yahudi, sinagoge, dan fasilitas lain yang digunakan oleh komunitas Yahudi.\r\n\r\nPemerintah mengatakan dana tersebut dialokasikan untuk mencerminkan jumlah situs komunitas yang digunakan oleh masing-masing agama, di mana warga Muslim Inggris jumlahnya 14 kali lebih banyak di antara penduduk Inggris dan Wales dibandingkan dengan warga Yahudi Inggris.\r\n\r\nSunak dan partai Konservatif yang berkuasa mendapat kecaman keras karena dianggap telah memungkinkan Islamofobia meningkat di Inggris.\r\n\r\nInsiden Islamofobia meningkat lebih dari tiga kali lipat sejak serangan Hamas pada 7 Oktober 2023, menurut Tell MAMA, sebuah organisasi yang memantau sentimen dan pelecehan anti-Muslim di Inggris.', 'berita10.jpg', '2024-03-12 14:08:03', '2024-03-12 14:08:03'),
(11, 'Menlu Saudi, Inggris bahas perkembangan di Gaza', 'Menteri Luar Negeri Arab Saudi Faisal bin Farhan pada Senin membahas perkembangan perang Israel yang berlangsung di Gaza dengan Menlu Inggris David Cameron.\r\n\r\nMenurut kantor berita SPA, bin Farhan menerima panggilan telepon dari Cameron dan membahas isu-isu regional dan internasional yang menjadi kepentingan bersama, terutama perkembangan di Jalur Gaza.\r\n\r\nPercakapan mereka terjadi di tengah upaya AS, Qatar, dan Mesir untuk menjembatani perbedaan pandangan antara Israel dan kelompok perlawanan Palestina Hamas untuk mencapai gencatan senjata di Gaza dan kesepakatan pertukaran sandera.\r\n\r\nSeperti kebanyakan umat Islam di seluruh dunia, warga Palestina di Gaza pada Senin memasuki bulan suci Ramadan, yang kali ini menjadi bulan puasa paling berat yang harus mereka jalani di bawah bombardir Israel yang terus berlanjut di Jalur Gaza.\r\n\r\nKantor berita Anadolu melaporkan sedikitnya 31.000 orang telah tewas dan 73.000 lainnya terluka akibat pengeboman Israel sejak serangan lintas batas oleh Hamas pada 7 Oktober.\r\n\r\nIsrael juga menerapkan blokade yang melumpuhkan wilayah kantong Palestina itu sehingga penduduknya, khususnya di Gaza utara, terancam kelaparan.\r\n\r\nSekitar 85 persen warga Gaza terpaksa mengungsi akibat serangan Israel di tengah kekurangan makanan, air bersih, dan obat-obatan, sementara 60 persen infrastruktur di sana telah rusak dan hancur, menurut catatan PBB.\r\n\r\nPutusan sela Mahkamah Internasional pada Januari memerintahkan Israel untuk menghentikan aksi genosida dan mengambil tindakan yang dapat menjamin bantuan kemanusiaan diberikan kepada warga sipil di Gaza.\r\n\r\nPada 24 November, Qatar memediasi kesepakatan antara Israel dan Hamas mengenai gencatan senjata sementara dan pertukaran beberapa tahanan dan sandera, serta pengiriman bantuan kemanusiaan ke Jalur Gaza. Gencatan senjata itu telah diperpanjang beberapa kali dan berakhir pada 1 Desember.', 'berita11.jpg', '2024-03-12 14:11:29', '2024-03-12 14:11:29'),
(12, 'Mayor Teddy Dipromosikan Jadi Wadanyonif Para Raider 328/ Dirgahayu', '- Mayor Teddy Indra Wijaya yang selama ini dikenal sebagai ajudan Menteri Pertahanan, Prabowo Subianto mendapat promosi jabatan menjadi Wakil Komandan Batalyon Infantri (Wadanyonif) Para Rider 328/Dirgahayu.\r\nPromosi jabatan Teddy ini tertuang dalam Keputusan Kepala Staf TNI AD (KASAD) nomor 137/II/2024 tanggal 24 Februari 2024.\r\n\r\n\"Mayor Inf Teddy menjadi Wadanyonif Para Raider 328/Dirgahayu, Brigif Para Raider 17/Divif 1/Kostrad,\" kata Kadispend Brigjen Kristomei Sianturi saat dikonfirmasi, Selasa (12/3).\r\n\r\n\r\n\r\nBaca artikel CNN Indonesia \"Mayor Teddy Dipromosikan Jadi Wadanyonif Para Raider 328/ Dirgahayu\" selengkapnya di sini: https://www.cnnindonesia.com/nasional/20240312172059-20-1073429/mayor-teddy-dipromosikan-jadi-wadanyonif-para-raider-328-dirgahayu.\r\n\r\nDownload Apps CNN Indonesia sekarang https://app.cnnindonesia.com/', 'berita12.jpeg', '2024-03-12 14:15:31', '2024-03-12 14:15:31'),
(13, 'NeutraDC Serahkan Fasilitas Pengelolaan Sampah Bagi Warga Desa Jambidan Yogyakarta\r\n', 'Anak perusahaan PT Telkom Indonesia (Persero) Tbk (Telkom) yang bergerak di bisnis data center, NeutraDC (PT Telkom Data Ekosistem), memperkuat implementasi terkait Environmental, Social, and Corporate Governance (ESG) dengan memberikan mesin sekaligus bangunan pengelolaan sampah untuk 10.450 warga Desa Jambidan, Kapanewon, Banguntapan, Kabupaten Bantul, Yogyakarta.\r\n\r\nPenyerahan bantuan secara simbolis dilakukan dalam momen rangkaian perayaan ulang tahun kedua NeutraDC di Yogyakarta, Senin (6/3/2024).\r\n\r\nUpaya implementasi ESG dalam rangkaian ulang tahun NeutraDC ini juga merupakan bagian dari program EXIST (ESG Existence for Sustainability by Telkom Indonesia\r\nGerakan ini sebagai langkah konkret dalam mewujudkan kehidupan dan bisnis yang lebih berkelanjutan. Program ESG Telkom melalui EXIST hadir dengan tiga pilar utama yaitu Environmental (lingkungan), Social (sosial), dan Governance (tata kelola).\r\n\r\n', 'berita13.jpg', '2024-03-12 14:16:55', '2024-03-12 14:16:55'),
(14, 'Semakin Dibutuhkan, Kenali Tren AI 2024 untuk Perkembangan Bisnis', 'Setiap tahunnya, perkembangan teknologi terus mengalami percepatan, dan kecerdasan buatan atau artificial intelligence (AI) terus menjadi inovasi yang hangat diperbincangkan.\r\n\r\nDengan ramainya AI saat ini, para peneliti, publik, dan penggemar teknologi tentu ingin tahu lebih jauh tentang lanskap evolusi AI pada tahun 2024 ini dan implikasi potensialnya bagi masyarakat.\r\n\r\nGenerative AI (Gen AI) yang hadir di tahun 2024 adalah cerminan hasil dari penelitian, pengembangan, dan eksperimen selama bertahun-tahun lamanya. Ini mencakup berbagai teknologi, aplikasi, dan tren yang sedang membentuk arah perkembangan AI di masa-masa mendatang.\r\n\r\nTren ini menandakan pergeseran menuju efisiensi dan personalisasi dalam solusi bisnis, sehingga Gen AI bukan lagi menjadi alat generik, namun menjadi strategi yang sangat spesialis. Gen AI akan memainkan peran yang signifikan dalam layanan pelanggan, meningkatkan engagement, dan menyederhanakan operasi.\r\n\r\nGen AI yang dipersonalisasi sesuai dengan kebutuhan perusahaan akan memberikan keunggulan kompetitif dalam dunia bisnis yang dinamis.', 'berita14.jpg', '2024-03-12 14:18:05', '2024-03-12 14:18:05'),
(15, 'Mudik Gratis Pegadaian 2024: Syarat, Link Daftar, Rute, dan Jadwal Keberangkatan', 'Mengutip dari Instagram @tjslpegadaian, pendaftaran mudik gratis PT Pegadaian akan dibuka mulai 13-15 Maret 2024.\r\n\r\nPemudik dari wilayah JABODETABEK dapat melakukan registrasi melalui link ini.\r\n\r\nSyarat dan Ketentuan Pendaftaran\r\nAcara Mudik Bersama BUMN ini dilaksankan oleh PT Pegadaian\r\nPeserta Mudik Bersama BUMN tidak dipungut biaya dan dilarang untuk diperjualbelikan\r\nPeserta Mudik Bersama BUMN berdomisili di JABODETABEK\r\nPeserta Mudik Bersama BUMN terdiri dari nasabah dan non-nasabah (selama kuota masih tersedia)\r\nBagi nasabah harus melampirkan No. CIF atau nomor nasabah (No. CIF dapat dilihat di kertas SBG, Buku Tabungan EMas dan Aplikasi Pegadaian Digital)\r\nPeserta Mudik Bersama BUMN harus dalam keadaan sehat jasmani dan rohani\r\nBaca juga: Cara Mendaftar Mudik Gratis Dishub Jatim 2024, Cek Syarat, Kuota, dan Jadwal, Dibuka 13 Maret 2024\r\n\r\nPeserta Mudik Bersama BUMN harus terdaftar di Kartu Keluarga\r\nJumlah peserta mudik maksimal 4 orang (Dewasa/Anak-anak berumur diatas 6 bulan)\r\nAnak-anak berumur di bawah 6 bulan (bayi) tanpa tempat duduk tidak perlu didaftarkan\r\nTiket tidak dapat digantikan atau diwakilkan atas nama orang lain\r\nBagi peserta yang melakukan pembatalan, tidak bisa mengikuti program mudik Pegadaian di tahun berikutnya\r\nPeserta Mudik Asyik Bersama BUMN wajib mengikuti akun Instagram @pegadaian_id dan @tjslpegadaian\r\nBersedia menerima informasi yang dikirimkan melalui Email dan WhatsApp dari PT Pegadaian dan Kementerian BUMN\r\nPersetujuan pendaftaran Mudik Asyik Bersama BUMN ini diputuskan dengan memperhatikan syarat dan ketentuan dan kuota yang diputuskan oleh panitia pelaksana\r\nRute Mudik\r\nPurwokerta (GT Slawi - Prupuk - Bumiayu - Ajibarang - Purwokerto)\r\nSemarang 1 (GT Kaliwungu - GT Ungaran - Salatiga)\r\nSemarang 2 (GT Kendal - GT Krapyak - Demak - Kudus)\r\nSolo (GT Biyolali - Kertosuro - Solo)\r\nMadiun (GT Ngawi - Maospati - Madiun)\r\nSurabaya (GT Jombang - GT Mojokerto - GT Waru Surabaya - Terminal Bungurasih)\r\nYogyakarta 1 Jalur Utara (Klaten - Sleman - Yogyakarta)\r\nYogyakarta 2 Jalur Selatan (Gombong - Kebumen - Kutoarjo - Purwokerto - Waters - Yogyakarta)\r\nGresik (Pati - Rembang - Tuban - Lamongan - Gresik)\r\nPekalongan (GT Palimanan - GT Brebes - GT Pemalang - GT Pekalongan)\r\nJadwal Keberangkatan\r\nMudik Gratis PT Pegadaian 2024 akan dijadwalkan berangkat pada 5 April 2024, pukul 09.00 WIB.\r\n\r\nUntuk lokasi keberangkatan, para pemudik akan berangkat dari Kantor Cabang Pegadaian, Kebon Nanas.\r\n', 'berita15.jpg', '2024-03-12 14:19:17', '2024-03-12 14:19:17'),
(16, 'Puluhan UMKM Dapat Hibah Alat Tepat Guna untuk Tembus Pasar Ekspor\r\n', 'PT Pertamina (Persero) memberikan hibah alat teknologi tepat guna kepada 28 UMKM senilai total Rp 690 juta yang didistribusikan secara bertahap mulai akhir 2023 untuk mendorong UMKM naik kelas dan go global.\r\n\r\nVice President Corporate Communication Pertamina Fadjar Djoko Santoso menyatakan, UMKM adalah urat nadi dan penopang perekonomian daerah dan nasional, sehingga pemberian dukungan ini dapat memacu pertumbuhan UMKM serta meningkatkan ekonomi keluarga dan masyarakat.\r\n\r\n\r\n“Kami konsisten melakukan upaya pengembangan UMKM melalui program pelatihan, pameran, dan bantuan alat hibah teknologi, agar para pelaku usaha dapat menghasilkan produk-produk yang berdaya saing tinggi, sehingga memiliki peluang yang besar untuk mengembangkan produk yang berorientasi pada ekspor,” kata Fadjar dalam keterangannya, Selasa (12/3/2024).\r\n\r\nHibah teknologi diberikan kepada para Champion UMK Academy Pertamina tahun 2023 dan 10 besar peserta Pertapreneur Aggregator.\r\n', 'berita15.jpg', '2024-03-12 14:20:16', '2024-03-12 14:20:16'),
(17, 'Jelang Mudik Lebaran, Gapasdap Minta Pemerintah Membuat Aturan soal Muatan Kendaraan Listrik', 'Gabungan Pengusaha Angkutan Sungai, Danau dan Penyeberangan atau Gapasdap mendesak pemerintah segera membuat aturan tentang muatan kendaraan listrik sebelum momentum mudik lebaran tiba.\r\n\r\nRegulasi tentang muatan kendaraan berbasis tenaga listrik ini memang belum tercantum dalam standar operasional prosedur (SOP) keamanan yang diatur oleh Kementerian Perhubungan. Sementara potensi bahaya korsleting kendaraan listrik sangat tinggi.\r\n\r\n\"Muatan electric vehicle ini memiliki tingkat bahaya yang luar biasa,\" kata Kepala Bidang Usaha dan Pentarifan DPP Gapasdap, Rachmatika Ardiyanto di Surabaya, Jumat (8/3/2024).\r\n\r\nSebelumnya, Gapasdap telah menggelar dua kali Focus Group Discussion (FGD) Mitigasi Risiko Terhadap Muatan Kapal dan Muatan Kendaraan Listrik di Angkutan Penyeberangan.\r\n\r\nFGD diikuti oleh Ketua Dewan Penasehat Gapasdap Bambang Haryo Soekartono (BHS), Ketua Umum Gapasdap Khoiri Soetomo, Ketua Komite Nasional Keselamatan Transportasi (KNKT) Ir Suryanto Cahyono serta Koordinator Kesyahbandaran dan Patroli Direktorat Transportasi Sungai, Danau dan Penyeberangan, Wahyudi beserta sejumlah asosiasi terkait. Yakni ASDP dan Asperindo. Termasuk pihak asuransi Jasa Raharja.\r\n\r\nTindak lanjut FGD tersebut menjadi sebuah rekomendasi panduan ekspedisi dan penanganan kebakaran kendaraan listrik.\r\n\r\n\"Hasil FGD kita rekomendasikan kepada Kemenhub agar segera membuat aturan itu mungkin bisa bekerja sama dengan perguruan tinggi dan sebagainya,\" ujarnya.\r\n\r\n', 'berita16.jpg', '2024-03-12 14:21:35', '2024-03-12 14:21:35'),
(18, 'Beri Layanan Melebihi Ekspektasi, BRI Berhasil Raih 3 Penghargaan di Pertamina Appreciation Night\r\n', 'PT. Bank Rakyat Indonesia (Persero) Tbk atau BRI berhasil menjadi Top Local Bank pada “Pertamina Appreciation Night” yang diselenggarakan di Jakarta, Selasa (5/3/2024).\r\n\r\nDalam acara tersebut Pertamina mengundang 22 bank rekanan sebagai nominator untuk 10 kategori. BRI sendiri berhasil memborong 3 penghargaan yakni sebagai Bank Trade Finance, Bank Penempatan, dan Bank Pinjaman Jangka Pendek untuk PT Pertamina (Persero) dan grup perusahaan.\r\n\r\nSelain itu, BRI juga berhasil menjadi Nominator dalam kategori Bank Presepsi, Bank Penyedia Valas, dan Bank Operasi. Penghargaan tersebut diserahkan langsung oleh Direktur Keuangan Pertamina Emma Sri Martini.\r\n', 'berita17.jpg', '2024-03-12 14:22:38', '2024-03-12 14:22:38'),
(19, 'Aturan Penjualan BBM Subsidi Termasuk Pertalite Segera Rampung, Pertamina Beri Tanggapan Begini\r\n', 'Pemerintah segera melakukan pembatasan distribusi bahan bakar minyak (BBM) jenis Pertalite.\r\n\r\nAturan tersebut akan tertuang dalam revisi Peraturan Presiden (Perpres) Nomor 191 Tahun 2014 tentang Penyediaan, Pendistribusian dan Harga Jual Eceran Bahan Bakar Minyak.\r\nSebelumnya, Menteri Energi dan Sumber Daya Mineral (ESDM) Arifin Tasrif mengatakan, upaya untuk mengetatkan penjualan BBM subsidi perlu dilakukan untuk memastikan penyaluran secara tepat sasaran dan menjaga keuangan negara.\r\n\r\nPemerintah pun akan melanjutkan pembahasan revisi Peraturan Presiden Nomor 191 Tahun 2014 tentang Penyediaan, Pendistribusian dan Harga Jual Eceran Bahan Bakar Minyak.\r\n\r\n', 'berita18.jpg', '2024-03-12 14:24:37', '2024-03-12 14:24:37'),
(20, 'QRIS Sukses Bawa Indonesia Negara Paling Terkemuka dalam Pembayaran Digital di ASEAN\r\n', 'Indonesia sukses menjadi tuan rumah penyelenggaraan Konferensi Tingkat Tinggi (KTT) ASEAN atau ASEAN Summit ke-42 yang dihadiri para kepala negara dan kepala pemerintahan di Labuan Bajo, Nusa Tenggara Timur pada bulan Mei 2023.\r\n\r\nIndonesia berpeluang menjadi pemain utama sekaligus motor penggerak digitalisasi sistem pembayaran dan penggunaan mata uang lokal di wilayah Asia Tenggara yang ditopang oleh posisi keketuaan Indonesia di ASEAN.\r\n\r\nDengan skala ekonomi terbesar di Asia Tenggara, Indonesia adalah satu-satunya anggota G20 di kawasan. Kekuatan ini memampukan Indonesia untuk menjadi salah satu negara yang melaksanakan digitalisasi paling cepat di dunia.\r\n\r\nPandemi Covid-19 telah mendorong pergeseran hebat dalam perilaku konsumen sehingga memicu kebiasaan belanja dalam jaringan (daring) dan pembayaran berbasis digital secara masif di Indonesia.\r\n\r\nKondisi tersebut menciptakan lingkungan yang cocok untuk berjamurnya unicorn lokal berbasis teknologi di Indonesia.\r\n\r\nPada Januari 2020, tepat sebelum virus Corona melumpuhkan hampir semua sendi kehidupan di dunia, Bank Indonesia mewajibkan seluruh perusahaan jasa pembayaran untuk menyesuaikan sistem Quick Response (QR) mereka dengan standar tunggal bernama QRIS.\r\n\r\nQRIS memungkinkan interoperabilitas di antara bank-bank dan penyedia layanan e-wallet (dompet elektronik), menekan biaya transaksi dan meningkatkan efisiensi bagi para pelaku usaha. \r\n\r\nSebelumnya, pemilik usaha harus membayar biaya yang mahal untuk menyediakan lebih dari satu QR Code, atau bahkan perangkat Electric Data Capture (EDC) untuk pembayaran dengan kartu debit atau kredit.\r\n\r\nBerkat rendahnya biaya merchant (merchant fees) melalui QRIS, saat ini jumlah usaha yang menggunakan sistem tersebut mencapai 22,4 juta, lebih dari tiga kali lipat jumlah usaha yang menggunakan QR di Thailand. Hal ini menjadikan Indonesia di posisi teratas di Asia Tenggara dalam hal pembayaran digital berbasis QR.\r\n', 'berita19.jpg', '2024-03-12 14:25:33', '2024-03-12 14:25:33'),
(21, 'Harga Pangan Kompak Turun di Awal Ramadan 2024, Beras Dijual Murah Rp16.050, Gula Anjlok Rp17.600\r\n', 'Sejumlah bahan pangan kompak mengalami penurunan harga di awal Ramadan 2024 versi Muhamadiyah yang jatuh pada hari ini.\r\n\r\nSeperti harga beras kualitas super yang dibanderol lebih murah dari pekan sebelumnya, anjlok jadi Rp 16.050 per kg.\r\n\r\n\r\nDiikuti penurunan harga komoditas beras kualitas medium yang kini dibanderol di kisaran Rp 15.150 per kg.\r\n\r\nTak hanya itu, menurut pantauan data Badan Pangan Nasional harga gula pasir lokal pada awal Ramadan juga tereret turun Rp 17.600 per kg.\r\n\r\nDisusul penurunan harga minyak goreng yang amblas jadi Rp 19.800 per kg.\r\n\r\nSerta telur ayam yang dijual murah di kisaran harga Rp 31.050 per kg.\r\n\r\n', 'berita20.jpg', '2024-03-12 14:26:34', '2024-03-12 14:26:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `no_bp` varchar(25) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `no_bp`, `no_hp`, `email`, `created_at`, `updated_at`) VALUES
(3, 'BP003', '0823615231919', 'siti@gmail.com', '2024-03-12 08:57:34', '2024-03-12 08:57:34'),
(4, 'BP004', '082361524004', 'adi4@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(5, 'BP005', '082361524005', 'lina5@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(6, 'BP006', '082361524006', 'rudi6@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(7, 'BP007', '082361524007', 'sari7@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(8, 'BP008', '082361524008', 'joko8@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(9, 'BP009', '082361524009', 'dewi9@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(10, 'BP010', '082361524010', 'agus10@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(11, 'BP011', '082361524011', 'tina11@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(12, 'BP012', '082361524012', 'edi12@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(13, 'BP013', '082361524013', 'wati13@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(14, 'BP014', '082361524014', 'budi14@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(15, 'BP015', '082361524015', 'nina15@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(16, 'BP016', '082361524016', 'roni16@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(17, 'BP017', '082361524017', 'desi17@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(18, 'BP018', '082361524018', 'hani18@gmail.com', '2024-03-12 13:52:13', '2024-03-12 13:52:13'),
(19, 'BP019', '082361524006', 'lisa@gmail.com', '2024-03-12 13:53:16', '2024-03-12 13:53:16'),
(20, 'BP020', '082361524007', 'dimas@gmail.com', '2024-03-12 13:53:16', '2024-03-12 13:53:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `created_at`, `updated_at`) VALUES
(1, 'fira', 'fira@gmail.com', '$2y$10$NRrpwaWiBDmV3W1pebMXkuKguzT2oFo1XSqGyarxFOz.9283wAh0O', 'firafara', '2024-03-11 12:06:50', '2024-03-11 12:06:50'),
(2, 'e', 'tes@gmail.com', '$2y$10$mFzWGbyqeAUXq8yyq3VJeejHU/C.9SYLStw6Xy.5ky23NeqQOa3je', 'e', '2024-03-11 12:09:27', '2024-03-11 12:09:27'),
(3, 'coba', 'coba@gmail.com', '$2y$10$pQIjpq/OwqupnGrT8xE1q.NdnGeSzNoZp7P.9.7YZ/IQjjMQRea3a', 'coba', '2024-03-12 06:21:13', '2024-03-12 06:21:13'),
(5, 'coba3', 'coba3@gmail.com', '$2y$10$6z80u97pKKrX/FJ0lNdEWeOMJVzc5jbIJYh.zG/fW1XVQAvQmRA2K', 'coba3', '2024-03-12 06:32:24', '2024-03-12 06:32:24'),
(6, 'coba4', 'coba4@gmail.com', '$2y$10$Blta1EkP76ZKmebHEc7IZ.Tsh078ZxmlzewRsRgkuZlf4FgtjSewG', 'coba4', '2024-03-12 06:36:10', '2024-03-12 06:36:10'),
(7, 'budi', 'budi@gmail.com', '$2y$10$ksYhIeDvTp6Crcf6V8WiZua4fmvNXwWxsdtGahEt1J1m.j4/IQTvm', 'budi', '2024-03-12 06:40:18', '2024-03-12 06:40:18'),
(8, 'nana', 'nana@gmail.com', '$2y$10$Dxit3sAYXmUm6qH/..Z1y.k.ewr/kFJYejfbapJwZ8Kmh7iuooEfa', 'nana', '2024-03-13 14:59:05', '2024-03-13 14:59:05'),
(9, 'q', 'q@gmail.com', '$2y$10$43SmVd.6sR0ONoaHrGJmPeQ7E0uJVHhhLrqubfdvPvG0SIIpjxtBa', 'q', '2024-03-15 07:32:38', '2024-03-15 07:32:38'),
(10, 'testing', 'testing@gmail.com', '$2y$10$sFsa6.YxNLWMKcpMxGeKsehalfo28VbhcgSkpr/LZWdp70n7hEZrG', 'testing', '2024-03-15 08:22:22', '2024-03-15 08:22:22'),
(11, 't', 't@gmail.com', '$2y$10$.qpOaOkGCcKBB0jcUJBVne65YMllBRKPzMR0KN9l1Ap8ZYmzids22', 't', '2024-03-16 07:38:55', '2024-03-16 07:38:55'),
(12, 'wahyu', 'wahyu@gmail.com', '$2y$10$W/fvXY.MGPxm7TASupQ1Y.UgIeTwquRcBaprvoprK3Nvhs4camLHm', 'wahyu', '2024-03-16 12:54:31', '2024-03-16 12:54:31'),
(13, 'tes4', 'tes4@gmail.com', '$2y$10$0z3M6jveIAQJJSmIDJLCRuyReekEx7I1U6K5Z8QKGPWL0LRPuBYkW', 'tes4', '2024-03-16 15:07:26', '2024-03-16 15:07:26');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
