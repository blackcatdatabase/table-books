-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-10-24T09:45:40Z)
-- engine: postgres
-- table:  books
-- Contract view for [books]
CREATE OR REPLACE VIEW vw_books AS
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
  created_at,
  updated_at,
  deleted_at
FROM books;
