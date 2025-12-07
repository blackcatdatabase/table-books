-- Auto-generated from joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   books_with_assets

-- Books with asset availability summary
CREATE OR REPLACE VIEW vw_books_with_assets AS
SELECT
  b.id,
  b.tenant_id,
  b.title,
  b.is_active,
  b.is_available,
  COUNT(*) FILTER (WHERE ba.asset_type = $$cover$$) AS cover_assets,
  COUNT(*) FILTER (WHERE ba.asset_type IN ($$pdf$$,$$epub$$,$$mobi$$,$$sample$$,$$extra$$)) AS downloadable_assets
FROM books b
LEFT JOIN book_assets ba
  ON ba.tenant_id = b.tenant_id AND ba.book_id = b.id
GROUP BY b.id, b.tenant_id, b.title, b.is_active, b.is_available;
