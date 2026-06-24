CREATE TABLE ecommerce (
     user_id INT NOT NULL,
	 session_id VARCHAR(50),
	 event_time TIMESTAMP,
	 event_type VARCHAR(50),
	 product_category VARCHAR(100),
	 device_type VARCHAR(50),
	 traffic_source VARCHAR(100)	 
);
SELECT *
FROM ecommerce
LIMIT 10;
SELECT COUNT(*) AS total_rows
FROM ecommerce;
SELECT event_type, COUNT(*) AS event_count
FROM ecommerce
GROUP BY event_type
ORDER BY event_count DESC;
SELECT COUNT(DISTINCT user_id) AS unique_user
FROM ecommerce;
SELECT DISTINCT event_type
FROM ecommerce;
SELECT
     COUNT(DISTINCT CASE WHEN event_type = 'visit' THEN user_id END) AS visitors,
	 COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN user_id END) AS product_viewers,
	 COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS cart_users,
	 COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchasers 
FROM ecommerce;
SELECT
    device_type,
	COUNT(DISTINCT CASE WHEN event_type = 'visit' THEN user_id END) AS vistors,
	COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN user_id END) AS product_views,
	COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart,
	COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
FROM ecommerce
GROUP BY device_type;
SELECT 
    traffic_source,
	COUNT(DISTINCT CASE WHEN event_type = 'visit' THEN user_id END) AS visitors,
	COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN user_id END) AS product_views,
	COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart,
	COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
FROM ecommerce
GROUP BY traffic_source;
SELECT 
    product_category,
	COUNT(DISTINCT CASE WHEN event_type = 'visit' THEN user_id END) AS visitors,
	COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN user_id END) AS product_views,
	COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart,
	COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
FROM ecommerce
GROUP BY product_category
ORDER BY purchases DESC;
