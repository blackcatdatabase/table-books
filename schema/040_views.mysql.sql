-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  books
-- Contract view for [books]
-- Adds saleability helper.
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_books AS
SELECT
  id,
  title,
  slug,
  short_description,
  full_description,
  price,
  currency,
  author_id,
  main_category_id,
  isbn,
  language,
  pages,
  publisher,
  published_at,
  sku,
  is_active,
  is_available,
  stock_quantity,
  (is_active = 1 AND is_available = 1 AND (stock_quantity IS NULL OR stock_quantity > 0)) AS is_saleable,
  created_at,
  updated_at,
  deleted_at
FROM books;
