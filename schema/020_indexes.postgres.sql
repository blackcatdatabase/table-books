-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  books

CREATE INDEX IF NOT EXISTS idx_books_author_id ON books (author_id);

CREATE INDEX IF NOT EXISTS idx_books_main_category_id ON books (main_category_id);

CREATE INDEX IF NOT EXISTS idx_books_sku ON books (sku);

CREATE UNIQUE INDEX IF NOT EXISTS ux_books_tenant_slug_live_ci ON books (tenant_id, slug_ci, is_live);

CREATE UNIQUE INDEX IF NOT EXISTS ux_books_tenant_isbn ON books (tenant_id, isbn);

CREATE UNIQUE INDEX IF NOT EXISTS ux_books_tenant_id ON books (tenant_id, id);

CREATE INDEX IF NOT EXISTS idx_books_tenant_author ON books (tenant_id, author_id);

CREATE INDEX IF NOT EXISTS idx_books_tenant_category ON books (tenant_id, main_category_id);
