-- Auto-generated from schema-views-postgres.yaml (map@sha1:EDC13878AE5F346E7EAD2CF0A484FEB7E68F6CDD)
-- engine: postgres
-- table:  books

-- Contract view for [books]
-- Adds saleability helper.
CREATE OR REPLACE VIEW vw_books AS
SELECT
  id,
  tenant_id,
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
  (is_active AND is_available AND (stock_quantity IS NULL OR stock_quantity > 0)) AS is_saleable,
  created_at,
  updated_at,
  version,
  deleted_at
FROM books;
