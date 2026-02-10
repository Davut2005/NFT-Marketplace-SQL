CREATE OR REPLACE VIEW vw_user_listings AS
SELECT
    l.id AS listing_id,
    l.seller_id,
    l.price,
    l.status,
    l.listed_at,
    n.id AS nft_id,
    n.name AS nft_name,
    n.collection_id
FROM listings l
JOIN nfts n ON l.nft_id = n.id
WHERE l.status = 'active';

CREATE OR REPLACE VIEW vw_collection_stats AS
SELECT
    c.id AS collection_id,
    c.name AS collection_name,
    COUNT(DISTINCT n.id) AS total_nfts,
    COUNT(DISTINCT l.id) AS active_listings_count,
    COALESCE(AVG(l.price), 0) AS avg_listing_price,
    COALESCE(SUM(s.sale_price), 0) AS total_sales_volume
FROM collections c
LEFT JOIN nfts n ON c.id = n.collection_id
LEFT JOIN listings l ON n.id = l.nft_id AND l.status = 'active'
LEFT JOIN sales s ON l.id = s.listing_id
GROUP BY c.id, c.name;
