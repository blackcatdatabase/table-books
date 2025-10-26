-- Auto-generated from schema-map-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  books
CREATE TABLE IF NOT EXISTS books (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL UNIQUE,
  short_description VARCHAR(512) NULL,
  full_description LONGTEXT NULL,
  price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  currency CHAR(3) NOT NULL DEFAULT 'EUR',
  author_id BIGINT UNSIGNED NOT NULL,
  main_category_id BIGINT UNSIGNED NOT NULL,
  isbn VARCHAR(32) NULL,
  language CHAR(5) NULL,
  pages INT UNSIGNED NULL,
  publisher VARCHAR(255) NULL,
  published_at DATE NULL,
  sku VARCHAR(64) NULL,
  is_active BOOLEAN NOT NULL DEFAULT 1,
  is_available BOOLEAN NOT NULL DEFAULT 1,
  stock_quantity INT UNSIGNED NOT NULL DEFAULT 0,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  version INT UNSIGNED NOT NULL DEFAULT 0,
  deleted_at DATETIME(6) NULL,
  INDEX idx_books_author_id (author_id),
  INDEX idx_books_main_category_id (main_category_id),
  INDEX idx_books_sku (sku),
  CONSTRAINT chk_books_currency CHECK (currency REGEXP '^[A-Z]{3}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
