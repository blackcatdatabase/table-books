<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – books

Books catalog with pricing and stock flags.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — |  |  |
| title | VARCHAR(255) | NO | — | Book title. |  |
| slug | VARCHAR(255) | NO | — | URL-friendly unique slug. |  |
| slug_ci | TEXT | — | — |  |  |
| short_description | VARCHAR(512) | YES | — | Short blurb. |  |
| full_description | TEXT | YES | — | Long description (rich text allowed). |  |
| price | NUMERIC(12,2) | NO | 0.00 | Current unit price. |  |
| currency | CHAR(3) | NO | 'EUR' | ISO 4217 currency code (3 letters). |  |
| author_id | BIGINT | NO | — | Author (FK authors.id). |  |
| main_category_id | BIGINT | NO | — | Primary category (FK categories.id). |  |
| isbn | VARCHAR(32) | YES | — | ISBN identifier. |  |
| language | CHAR(5) | YES | — | Language code (e.g., en, cs). |  |
| pages | INTEGER | YES | — | Number of pages (if applicable). |  |
| publisher | VARCHAR(255) | YES | — | Publisher name. |  |
| published_at | DATE | YES | — | Publication date. |  |
| sku | VARCHAR(64) | YES | — | Stock keeping unit. |  |
| is_active | BOOLEAN | NO | TRUE | Visible in catalog. |  |
| is_available | BOOLEAN | NO | TRUE | Available for purchase/download. |  |
| stock_quantity | INTEGER | NO | 0 | Units in stock. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
| version | INTEGER | NO | 0 |  |  |
| deleted_at | TIMESTAMPTZ(6) | YES | — | Soft delete timestamp. |  |
| is_live | BOOLEAN | YES | — |  |  |