<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – books

Books catalog with pricing and stock flags.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| title | VARCHAR(255) | NO | — | Book title. |  |
| slug | VARCHAR(255) | NO | — | URL-friendly unique slug. |  |
| short_description | VARCHAR(512) | YES | — | Short blurb. |  |
| full_description | LONGTEXT | YES | — | Long description (rich text allowed). |  |
| price | DECIMAL(12,2) | NO | 0.00 | Current unit price. |  |
| currency | CHAR(3) | NO | ''EUR'' | ISO 4217 currency code (3 letters). |  |
| author_id | BIGINT UNSIGNED | NO | — | Author (FK authors.id). |  |
| main_category_id | BIGINT UNSIGNED | NO | — | Primary category (FK categories.id). |  |
| isbn | VARCHAR(32) | YES | — | ISBN identifier. |  |
| language | CHAR(5) | YES | — | Language code (e.g., en, cs). |  |
| pages | INT UNSIGNED | YES | — | Number of pages (if applicable). |  |
| publisher | VARCHAR(255) | YES | — | Publisher name. |  |
| published_at | DATE | YES | — | Publication date. |  |
| sku | VARCHAR(64) | YES | — | Stock keeping unit. |  |
| is_active | BOOLEAN | NO | 1 | Visible in catalog. |  |
| is_available | BOOLEAN | NO | 1 | Available for purchase/download. |  |
| stock_quantity | INT UNSIGNED | NO | 0 | Units in stock. |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |
| deleted_at | DATETIME(6) | YES | — | Soft delete timestamp. |  |
