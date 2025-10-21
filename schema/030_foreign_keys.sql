-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00)
-- table: books
ALTER TABLE books ADD CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE RESTRICT;

ALTER TABLE books ADD CONSTRAINT fk_books_category FOREIGN KEY (main_category_id) REFERENCES categories(id) ON DELETE RESTRICT;
