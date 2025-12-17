-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  books

CREATE UNIQUE INDEX ux_books_tenant_slug_live_ci ON books (tenant_id, slug_ci, is_live);

CREATE UNIQUE INDEX ux_books_tenant_isbn ON books (tenant_id, isbn);

CREATE UNIQUE INDEX ux_books_tenant_id ON books (tenant_id, id);

CREATE INDEX idx_books_tenant_author ON books (tenant_id, author_id);

CREATE INDEX idx_books_tenant_category ON books (tenant_id, main_category_id);
