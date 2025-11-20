# 📦 Books

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **books** (repo: `books`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT | — | AS | PK |
| tenant_id | BIGINT | NO | — |  |
| title | VARCHAR(255) | NO | — |  |
| slug | VARCHAR(255) | NO | — |  |
| slug_ci | TEXT | — | — |  |
| short_description | VARCHAR(512) | YES | — |  |
| full_description | TEXT | YES | — |  |
| price | NUMERIC(12,2) | NO | 0.00 |  |
| currency | CHAR(3) | NO | 'EUR' |  |
| author_id | BIGINT | NO | — |  |
| main_category_id | BIGINT | NO | — |  |
| isbn | VARCHAR(32) | YES | — |  |
| language | CHAR(5) | YES | — |  |
| pages | INTEGER | YES | — |  |
| publisher | VARCHAR(255) | YES | — |  |
| published_at | DATE | YES | — |  |
| sku | VARCHAR(64) | YES | — |  |
| is_active | BOOLEAN | NO | TRUE |  |
| is_available | BOOLEAN | NO | TRUE |  |
| stock_quantity | INTEGER | NO | 0 |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |
| version | INTEGER | NO | 0 |  |
| deleted_at | TIMESTAMPTZ(6) | YES | — |  |
| is_live | BOOLEAN | YES | — |  |

## Relationships
- FK → **authors** via (tenant_id,author_id) (ON DELETE RESTRICT).
- FK → **categories** via (tenant_id,main_category_id) (ON DELETE RESTRICT).
- FK → **tenants** via (tenant_id) (ON DELETE RESTRICT).

```mermaid
erDiagram
  BOOKS {
    INT id PK
    INT tenant_id
    VARCHAR title
    VARCHAR slug
    VARCHAR slug_ci
    VARCHAR short_description
    VARCHAR full_description
    DECIMAL price
    VARCHAR currency
    INT author_id
    INT main_category_id
    VARCHAR isbn
    VARCHAR language
    INTEGER pages
    VARCHAR publisher
    DATETIME published_at
    VARCHAR sku
    BOOLEAN is_active
    BOOLEAN is_available
    INTEGER stock_quantity
    TIMESTAMPTZ created_at
    TIMESTAMPTZ updated_at
    INTEGER version
    TIMESTAMPTZ deleted_at
    BOOLEAN is_live
  }
  BOOKS }o--|| AUTHORS : "tenant_id, author_id"
  BOOKS }o--|| CATEGORIES : "tenant_id, main_category_id"
  BOOKS }o--|| TENANTS : "tenant_id"
```

## Indexes
- 8 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
