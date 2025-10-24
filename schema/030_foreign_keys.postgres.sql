-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  books
ALTER TABLE books ADD CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE RESTRICT;

ALTER TABLE books ADD CONSTRAINT fk_books_category FOREIGN KEY (main_category_id) REFERENCES categories(id) ON DELETE RESTRICT;
