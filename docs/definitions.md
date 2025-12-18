# books

Books catalog with pricing and stock flags.

## Columns
| Column | Type | Null | Default | Description | Crypto |
| --- | --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |  |
| tenant_id | BIGINT | NO |  | Owning tenant (FK tenants.id). |  |
| title | VARCHAR(255) | NO |  | Book title. |  |
| slug | VARCHAR(255) | NO |  | URL-friendly unique slug. |  |
| slug_ci | mysql: VARCHAR(255) / postgres: TEXT | YES |  | Generated lowercase slug used for case-insensitive uniqueness. |  |
| short_description | VARCHAR(512) | YES |  | Short blurb. |  |
| full_description | mysql: LONGTEXT / postgres: TEXT | YES |  | Long description (rich text allowed). |  |
| price | mysql: DECIMAL(12,2) / postgres: NUMERIC(12,2) | NO | 0.00 | Current unit price. |  |
| currency | CHAR(3) | NO | EUR | ISO 4217 currency code (3 letters). |  |
| author_id | BIGINT | NO |  | Author (FK authors.id). |  |
| main_category_id | BIGINT | NO |  | Primary category (FK categories.id). |  |
| isbn | VARCHAR(32) | YES |  | ISBN identifier. |  |
| language | CHAR(5) | YES |  | Language code (e.g., en, cs). |  |
| pages | mysql: INT / postgres: INTEGER | YES |  | Number of pages (if applicable). |  |
| publisher | VARCHAR(255) | YES |  | Publisher name. |  |
| published_at | DATE | YES |  | Publication date. |  |
| sku | VARCHAR(64) | YES |  | Stock keeping unit. |  |
| is_active | BOOLEAN | NO | mysql: 1 / postgres: TRUE | Visible in catalog. |  |
| is_available | BOOLEAN | NO | mysql: 1 / postgres: TRUE | Available for purchase/download. |  |
| stock_quantity | mysql: INT / postgres: INTEGER | NO | 0 | Units in stock. |  |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
| version | mysql: INT / postgres: INTEGER | NO | 0 | Optimistic locking version counter. |  |
| deleted_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | Soft delete timestamp. |  |
| is_live | mysql: TINYINT(1) / postgres: BOOLEAN | YES |  | Generated flag (deleted_at IS NULL). |  |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_books_tenant_id | tenant_id, id |
| ux_books_tenant_isbn | tenant_id, isbn |
| ux_books_tenant_slug_live_ci | tenant_id, slug_ci, is_live |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_books_author_id | author_id | INDEX idx_books_author_id (author_id) |
| idx_books_main_category_id | main_category_id | INDEX idx_books_main_category_id (main_category_id) |
| idx_books_sku | sku | INDEX idx_books_sku (sku) |
| idx_books_tenant_author | tenant_id,author_id | CREATE INDEX idx_books_tenant_author ON books (tenant_id, author_id) |
| idx_books_tenant_category | tenant_id,main_category_id | CREATE INDEX idx_books_tenant_category ON books (tenant_id, main_category_id) |
| ux_books_tenant_id | tenant_id,id | CREATE UNIQUE INDEX ux_books_tenant_id ON books (tenant_id, id) |
| ux_books_tenant_isbn | tenant_id,isbn | CREATE UNIQUE INDEX ux_books_tenant_isbn ON books (tenant_id, isbn) |
| ux_books_tenant_slug_live_ci | tenant_id,slug_ci,is_live | CREATE UNIQUE INDEX ux_books_tenant_slug_live_ci ON books (tenant_id, slug_ci, is_live) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_books_author | tenant_id,author_id | authors(tenant_id,id) | ON DELETE RESTRICT |
| fk_books_category | tenant_id,main_category_id | categories(tenant_id,id) | ON DELETE RESTRICT |
| fk_books_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_books_tenant_id | tenant_id, id |
| ux_books_tenant_isbn | tenant_id, isbn |
| ux_books_tenant_slug_live_ci | tenant_id, slug_ci, is_live |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_books_author_id | author_id | CREATE INDEX IF NOT EXISTS idx_books_author_id ON books (author_id) |
| idx_books_main_category_id | main_category_id | CREATE INDEX IF NOT EXISTS idx_books_main_category_id ON books (main_category_id) |
| idx_books_sku | sku | CREATE INDEX IF NOT EXISTS idx_books_sku ON books (sku) |
| idx_books_tenant_author | tenant_id,author_id | CREATE INDEX IF NOT EXISTS idx_books_tenant_author ON books (tenant_id, author_id) |
| idx_books_tenant_category | tenant_id,main_category_id | CREATE INDEX IF NOT EXISTS idx_books_tenant_category ON books (tenant_id, main_category_id) |
| ux_books_tenant_id | tenant_id,id | CREATE UNIQUE INDEX IF NOT EXISTS ux_books_tenant_id ON books (tenant_id, id) |
| ux_books_tenant_isbn | tenant_id,isbn | CREATE UNIQUE INDEX IF NOT EXISTS ux_books_tenant_isbn ON books (tenant_id, isbn) |
| ux_books_tenant_slug_live_ci | tenant_id,slug_ci,is_live | CREATE UNIQUE INDEX IF NOT EXISTS ux_books_tenant_slug_live_ci ON books (tenant_id, slug_ci, is_live) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_books_author | tenant_id,author_id | authors(tenant_id,id) | ON DELETE RESTRICT |
| fk_books_category | tenant_id,main_category_id | categories(tenant_id,id) | ON DELETE RESTRICT |
| fk_books_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_books | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_books_inventory_status | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_books_with_assets | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_books | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_books_inventory_status | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
| vw_books_with_assets | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
