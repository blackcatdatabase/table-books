-- Auto-generated from joins-mysql.yaml (map@85230ed)
-- engine: mysql
-- view:   books_with_assets

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_books_with_assets AS
SELECT
  b.id,
  b.tenant_id,
  b.title,
  b.is_active,
  b.is_available,
  SUM(CASE WHEN ba.asset_type = 'cover' THEN 1 ELSE 0 END) AS cover_assets,
  SUM(CASE WHEN ba.asset_type IN ('pdf','epub','mobi','sample','extra') THEN 1 ELSE 0 END) AS downloadable_assets
FROM books b
LEFT JOIN book_assets ba
  ON ba.tenant_id = b.tenant_id AND ba.book_id = b.id
GROUP BY b.id, b.tenant_id, b.title, b.is_active, b.is_available;

-- Auto-generated from joins-mysql.yaml (map@85230ed)
-- engine: mysql
-- view:   books_inventory_status

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_books_inventory_status AS
SELECT
  b.id,
  b.tenant_id,
  b.title,
  b.stock_quantity,
  COALESCE(SUM(ir.quantity), 0) AS reserved_quantity,
  b.stock_quantity - COALESCE(SUM(ir.quantity), 0) AS available_quantity
FROM books b
LEFT JOIN inventory_reservations ir
  ON ir.tenant_id = b.tenant_id AND ir.book_id = b.id
GROUP BY b.id, b.tenant_id, b.title, b.stock_quantity;

