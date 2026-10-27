-- Database untuk dashboard admin (ukk_nadhif)
CREATE DATABASE IF NOT EXISTS ukk_nadhif
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE ukk_nadhif;

-- Tabel admin (login)
CREATE TABLE IF NOT EXISTS admin (
  id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL,
  pw       VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_admin_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel barang
CREATE TABLE IF NOT EXISTS barang (
  id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name     VARCHAR(150) NOT NULL,
  category VARCHAR(100) NOT NULL DEFAULT '',
  stock    INT UNSIGNED NOT NULL DEFAULT 0,
  price    DECIMAL(14,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel transaksi
CREATE TABLE IF NOT EXISTS transaksi (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  product_id INT UNSIGNED NOT NULL,
  quantity   INT UNSIGNED NOT NULL,
  unit_price DECIMAL(14,2) NOT NULL,
  total      DECIMAL(14,2) NOT NULL,
  status     ENUM('pending','completed','cancelled') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_transaksi_product (product_id),
  CONSTRAINT fk_transaksi_barang FOREIGN KEY (product_id) REFERENCES barang (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Akun admin awal (password disimpan apa adanya karena backend membandingkan teks langsung)
INSERT INTO admin (username, pw) VALUES ('admin', 'admin123');
