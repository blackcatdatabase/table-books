-- Auto-generated from schema-map-postgres.psd1 (map@38d5403)
-- engine: postgres
-- table:  books
CREATE INDEX IF NOT EXISTS idx_books_author_id ON books (author_id);

CREATE INDEX IF NOT EXISTS idx_books_main_category_id ON books (main_category_id);

CREATE INDEX IF NOT EXISTS idx_books_sku ON books (sku);
