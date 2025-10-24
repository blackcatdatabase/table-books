-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  books
CREATE INDEX idx_books_author_id ON books (author_id);

CREATE INDEX idx_books_main_category_id ON books (main_category_id);

CREATE INDEX idx_books_sku ON books (sku);
