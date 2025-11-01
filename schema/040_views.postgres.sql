-- Auto-generated from schema-views-postgres.psd1 (map@c5e4097)
-- engine: postgres
-- table:  books
-- Contract view for [books]
-- Adds saleability helper.
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
  CASE WHEN (is_active AND is_available AND (stock_quantity IS NULL OR stock_quantity > 0)) THEN 1 ELSE 0 END AS is_saleable,
  created_at,
  updated_at,
  version,
  deleted_at
FROM books;
