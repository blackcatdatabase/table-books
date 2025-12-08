# books

Books catalog with pricing and stock flags.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| author_id | BIGINT | NO |  | Author (FK authors.id). |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| currency | CHAR(3) | NO | EUR | ISO 4217 currency code (3 letters). |
| deleted_at | TIMESTAMPTZ(6) | YES |  | Soft delete timestamp. |
| full_description | TEXT | YES |  | Long description (rich text allowed). |
| id | BIGINT | NO |  | Surrogate primary key. |
| is_active | BOOLEAN | NO | TRUE | Visible in catalog. |
| is_available | BOOLEAN | NO | TRUE | Available for purchase/download. |
| isbn | VARCHAR(32) | YES |  | ISBN identifier. |
| language | CHAR(5) | YES |  | Language code (e.g., en, cs). |
| main_category_id | BIGINT | NO |  | Primary category (FK categories.id). |
| pages | INTEGER | YES |  | Number of pages (if applicable). |
| price | NUMERIC(12,2) | NO | 0.00 | Current unit price. |
| published_at | DATE | YES |  | Publication date. |
| publisher | VARCHAR(255) | YES |  | Publisher name. |
| short_description | VARCHAR(512) | YES |  | Short blurb. |
| sku | VARCHAR(64) | YES |  | Stock keeping unit. |
| slug | VARCHAR(255) | NO |  | URL-friendly unique slug. |
| stock_quantity | INTEGER | NO | 0 | Units in stock. |
| title | VARCHAR(255) | NO |  | Book title. |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |

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
| vw_books | mysql | algorithm=MERGE, security=INVOKER | [packages\books\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/books/schema/040_views.mysql.sql) |
| vw_books_inventory_status | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\books\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/books/schema/040_views_joins.mysql.sql) |
| vw_books_with_assets | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\books\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/books/schema/040_views_joins.mysql.sql) |
| vw_books | postgres |  | [packages\books\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/books/schema/040_views.postgres.sql) |
| vw_books_inventory_status | postgres |  | [packages\books\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/books/schema/040_views_joins.postgres.sql) |
| vw_books_with_assets | postgres |  | [packages\books\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/books/schema/040_views_joins.postgres.sql) |
