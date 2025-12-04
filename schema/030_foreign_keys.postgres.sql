-- Auto-generated from schema-map-postgres.yaml (map@74ce4f4)
-- engine: postgres
-- table:  books

ALTER TABLE books ADD CONSTRAINT fk_books_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE books ADD CONSTRAINT fk_books_author FOREIGN KEY (tenant_id, author_id) REFERENCES authors(tenant_id, id) ON DELETE RESTRICT;

ALTER TABLE books ADD CONSTRAINT fk_books_category FOREIGN KEY (tenant_id, main_category_id) REFERENCES categories(tenant_id, id) ON DELETE RESTRICT;
