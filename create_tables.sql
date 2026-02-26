
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    creator_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE nfts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100),
    image_url VARCHAR(100),
    collection_id INTEGER REFERENCES collections(id) ON DELETE SET NULL,
    creator_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    royalty_percentage DECIMAL(5, 2) DEFAULT 0.00
);


CREATE TABLE ownership_history (
    id SERIAL PRIMARY KEY,
    nft_id INTEGER REFERENCES nfts(id) ON DELETE CASCADE,
    owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    acquired_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transferred_from INTEGER REFERENCES users(id) ON DELETE SET NULL,
    price_paid DECIMAL(18, 2) DEFAULT 0.00
);


CREATE TABLE listing_posts (
    id SERIAL PRIMARY KEY,
    nft_id INTEGER REFERENCES nfts(id) ON DELETE CASCADE,
    seller_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    price DECIMAL(18, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'sold', 'cancelled')),
    listed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    listing_id INTEGER REFERENCES listing_posts(id) ON DELETE CASCADE,
    buyer_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    sale_price DECIMAL(18, 2) NOT NULL,
    royalty_paid DECIMAL(18, 2) DEFAULT 0.00,
    sold_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    sale_id INTEGER REFERENCES sales(id) ON DELETE CASCADE,
    payer_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    payee_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    amount DECIMAL(18, 2) NOT NULL,
    payment_type VARCHAR(20) CHECK (payment_type IN ('sale', 'royalty')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE activity_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    action VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50) NOT NULL,
    entity_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
