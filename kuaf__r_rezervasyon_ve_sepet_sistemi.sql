-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 09 Oca 2025, 18:37:57
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kuaför_rezervasyon_ve_sepet_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islem_gecmisi`
--

CREATE TABLE `islem_gecmisi` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `islem_turu` varchar(50) DEFAULT NULL,
  `islem_detayi` text DEFAULT NULL,
  `olusturulma_tarihi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `islem_gecmisi`
--

INSERT INTO `islem_gecmisi` (`id`, `kullanici_id`, `islem_turu`, `islem_detayi`, `olusturulma_tarihi`) VALUES
(1, 1, 'Randevu Oluşturma', '10 Ocak 2025 tarihli randevu', '2025-01-09 20:30:45'),
(2, 2, 'Sipariş', '85 TL değerinde sipariş', '2025-01-09 20:30:45'),
(3, 3, 'Yorum Yapma', 'Memnun kaldım, teşekkürler.', '2025-01-09 20:30:45'),
(4, 4, 'Randevu İptal', '11 Ocak 2025 tarihli randevu iptal edildi.', '2025-01-09 20:30:45'),
(5, 5, 'Sipariş', '300 TL değerinde sipariş', '2025-01-09 20:30:45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `kullanici_adi` varchar(50) DEFAULT NULL,
  `sifre` varchar(100) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `olusturulma_tarihi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `kullanici_adi`, `sifre`, `rol`, `olusturulma_tarihi`) VALUES
(1, 'ahmet123', 'pass123', 'kullanici', '2025-01-09 20:30:45'),
(2, 'mehmet456', 'pass456', 'kullanici', '2025-01-09 20:30:45'),
(3, 'ayse789', 'pass789', 'admin', '2025-01-09 20:30:45'),
(4, 'fatma852', 'pass852', 'kullanici', '2025-01-09 20:30:45'),
(5, 'ali951', 'pass951', 'admin', '2025-01-09 20:30:45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevular`
--

CREATE TABLE `randevular` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `randevu_tarihi` date DEFAULT NULL,
  `randevu_saati` time DEFAULT NULL,
  `olusturulma_tarihi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `randevular`
--

INSERT INTO `randevular` (`id`, `kullanici_id`, `randevu_tarihi`, `randevu_saati`, `olusturulma_tarihi`) VALUES
(1, 1, '2025-01-10', '10:00:00', '2025-01-09 20:30:45'),
(2, 2, '2025-01-10', '11:00:00', '2025-01-09 20:30:45'),
(3, 3, '2025-01-11', '12:30:00', '2025-01-09 20:30:45'),
(4, 4, '2025-01-11', '15:00:00', '2025-01-09 20:30:45'),
(5, 5, '2025-01-12', '09:00:00', '2025-01-09 20:30:45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `toplam_fiyat` decimal(18,2) DEFAULT NULL,
  `isim_soyisim` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`id`, `kullanici_id`, `adres`, `toplam_fiyat`, `isim_soyisim`) VALUES
(1, 1, 'İstanbul Kadıköy', 120.50, 'Ahmet Yılmaz'),
(2, 2, 'Ankara Çankaya', 85.00, 'Mehmet Demir'),
(3, 3, 'İzmir Konak', 200.75, 'Ayşe Çelik'),
(4, 4, 'Bursa Osmangazi', 150.25, 'Fatma Kaya'),
(5, 5, 'Antalya Muratpaşa', 300.00, 'Ali Vural');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `id` int(11) NOT NULL,
  `kullanici_adi` varchar(50) DEFAULT NULL,
  `yorum` text DEFAULT NULL,
  `yorum_id` int(11) DEFAULT NULL,
  `yorum_tarihi` date DEFAULT NULL,
  `randevu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`id`, `kullanici_adi`, `yorum`, `yorum_id`, `yorum_tarihi`, `randevu_id`) VALUES
(1, 'ahmet123', 'Hizmet çok güzeldi.', 1, '2025-01-10', 1),
(2, 'mehmet456', 'Bekleme süresi çok uzundu.', 2, '2025-01-10', 2),
(3, 'ayse789', 'Memnun kaldım, teşekkürler.', 3, '2025-01-11', 3),
(4, 'fatma852', 'Fiyatlar biraz yüksek.', 4, '2025-01-11', 4),
(5, 'ali951', 'Her şey harikaydı.', 5, '2025-01-12', 5);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `islem_gecmisi`
--
ALTER TABLE `islem_gecmisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kullanici_id` (`kullanici_id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `randevular`
--
ALTER TABLE `randevular`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kullanici_id` (`kullanici_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kullanici_id` (`kullanici_id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yorum_id` (`yorum_id`),
  ADD KEY `randevu_id` (`randevu_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `islem_gecmisi`
--
ALTER TABLE `islem_gecmisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `randevular`
--
ALTER TABLE `randevular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `islem_gecmisi`
--
ALTER TABLE `islem_gecmisi`
  ADD CONSTRAINT `islem_gecmisi_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`);

--
-- Tablo kısıtlamaları `randevular`
--
ALTER TABLE `randevular`
  ADD CONSTRAINT `randevular_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`);

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`);

--
-- Tablo kısıtlamaları `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD CONSTRAINT `yorumlar_ibfk_1` FOREIGN KEY (`yorum_id`) REFERENCES `siparisler` (`id`),
  ADD CONSTRAINT `yorumlar_ibfk_2` FOREIGN KEY (`randevu_id`) REFERENCES `randevular` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
