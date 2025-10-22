-- Auto-generated from schema-map.psd1 (map@6cefe8e)
-- table: books
ALTER TABLE books ADD CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE RESTRICT;

ALTER TABLE books ADD CONSTRAINT fk_books_category FOREIGN KEY (main_category_id) REFERENCES categories(id) ON DELETE RESTRICT;
