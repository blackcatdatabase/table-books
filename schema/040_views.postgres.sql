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

-- Auto-generated from schema-views-feature-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  books_catalog_health_summary
-- High-level catalog health
CREATE OR REPLACE VIEW vw_catalog_health_summary AS
SELECT
  (SELECT COUNT(*) FROM authors WHERE deleted_at IS NULL) AS authors_live,
  (SELECT COUNT(*) FROM categories WHERE deleted_at IS NULL) AS categories_live,
  (SELECT COUNT(*) FROM books WHERE deleted_at IS NULL) AS books_live,
  (SELECT COUNT(*) FROM books b
     WHERE b.deleted_at IS NULL
       AND NOT EXISTS (SELECT 1 FROM book_assets a WHERE a.book_id = b.id AND a.asset_type=''cover'')) AS books_missing_cover,
  (SELECT COUNT(*) FROM books b
     WHERE b.is_active AND b.is_available AND (b.stock_quantity IS NULL OR b.stock_quantity > 0)) AS books_saleable;

