
INSERT INTO users (username, email) VALUES
('crypto_king', 'king@crypto.com'),
('nft_queen', 'queen@art.io'),
('pixel_artist', 'pixel@studio.net'),
('collector_joe', 'joe@collections.com'),
('meta_whale', 'whale@ocean.meta'),
('artist_anna', 'anna@creative.work'),
('investor_bob', 'bob@capital.xyz'),
('gamer_dave', 'dave@play2earn.gg'),
('defi_wizard', 'wizard@finance.magic'),
('newbie_ned', 'ned@start.here');


INSERT INTO collections (name, description, creator_id) VALUES
('CryptoPunks 2.0', 'The next generation of punks.', 1),
('Bored Apes Redux', 'Apes but more bored.', 2),
('Pixel Landscapes', 'Beautiful 8-bit scenery.', 3),
('Abstract Thoughts', 'Mind-bending shapes and colors.', 6),
('Metaverse Items', 'Wearables for your avatar.', 5),
('Gaming Assets', 'Swords and shields for RPGs.', 8),
('Photography Gems', 'Rare real-world moments.', 4),
('Music NFT Alpha', 'First edition tracks.', 1),
('Virtual Real Estate', 'Land in the cloud.', 7),
('Meme Economy', 'Invest in laughter.', 9);


INSERT INTO nfts (name, description, image_url, collection_id, creator_id, royalty_percentage) VALUES
('Punk #001', 'First of the new gen.', 'http://img.com/punk1.png', 1, 1, 5.00),
('Ape #101', 'Golden fur ape.', 'http://img.com/ape101.png', 2, 2, 2.50),
('Sunset Valley', 'Pixel art sunset.', 'http://img.com/sunset.png', 3, 3, 10.00),
('Chaos Theory', 'Abstract swirl.', 'http://img.com/chaos.png', 4, 6, 7.50),
('Cyber Jacket', 'Wearable NFT.', 'http://img.com/jacket.png', 5, 5, 5.00),
('Legendary Sword', 'Damage +100.', 'http://img.com/sword.png', 6, 8, 3.00),
('City Lights', 'Night photography.', 'http://img.com/city.png', 7, 4, 8.00),
('Beat Drop', 'Exclusive track.', 'http://img.com/beat.mp3', 8, 1, 15.00),
('Plot A-1', 'Prime location.', 'http://img.com/land.png', 9, 7, 2.00),
('Doge Coin Art', 'Much wow.', 'http://img.com/doge.png', 10, 9, 0.00);


INSERT INTO ownership_history (nft_id, owner_id, transferred_from, price_paid) VALUES
(1, 1, NULL, 0.00),
(2, 2, NULL, 0.00),
(3, 3, NULL, 0.00),
(1, 4, 1, 100.00), 
(2, 5, 2, 250.00),
(3, 6, 3, 50.00),  
(4, 6, NULL, 0.00),
(5, 5, NULL, 0.00),
(6, 8, NULL, 0.00),
(7, 4, NULL, 0.00);


INSERT INTO listings (nft_id, seller_id, price, status) VALUES
(1, 4, 150.00, 'active'),
(2, 5, 300.00, 'active'),
(3, 6, 75.00, 'sold'),
(4, 6, 500.00, 'cancelled'),
(5, 5, 200.00, 'active'),
(6, 8, 1000.00, 'active'),
(7, 4, 120.00, 'sold'),
(8, 1, 50.00, 'active'),
(9, 7, 5000.00, 'active'),
(10, 9, 10.00, 'sold');


INSERT INTO sales (listing_id, buyer_id, sale_price, royalty_paid) VALUES
(3, 7, 75.00, 7.50), 
(7, 2, 120.00, 9.60), 
(10, 3, 10.00, 0.00), 
(1, 2, 150.00, 7.50), 
(2, 1, 300.00, 7.50), 
(5, 3, 200.00, 10.00), 
(6, 4, 1000.00, 30.00), 
(8, 5, 50.00, 7.50), 
(9, 6, 5000.00, 100.00), 
(4, 1, 500.00, 37.50); 


INSERT INTO payments (sale_id, payer_id, payee_id, amount, payment_type) VALUES
(1, 7, 6, 67.50, 'sale'), 
(1, 7, 3, 7.50, 'royalty'), 
(2, 2, 4, 110.40, 'sale'),
(2, 2, 4, 9.60, 'royalty'), 
(3, 3, 9, 10.00, 'sale'),
(3, 3, 9, 0.00, 'royalty'),
(4, 2, 4, 142.50, 'sale'),
(4, 2, 1, 7.50, 'royalty'),
(5, 1, 5, 292.50, 'sale'),
(5, 1, 2, 7.50, 'royalty');


INSERT INTO activity_logs (user_id, action, entity_type, entity_id) VALUES
(1, 'created', 'collection', 1),
(1, 'minted', 'nft', 1),
(2, 'created', 'collection', 2),
(2, 'minted', 'nft', 2),
(4, 'purchased', 'nft', 1),
(4, 'listed', 'listing', 1),
(5, 'purchased', 'nft', 2),
(5, 'listed', 'listing', 2),
(6, 'listed', 'listing', 3),
(7, 'purchased', 'nft', 3);
