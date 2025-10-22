-- =======================================================
-- Airbnb Database Seed Data (seed.sql)
-- Author: Ntando Loliwe
-- Project: ALX Airbnb Database
-- =======================================================

-- ==========================
-- Insert Users
-- ==========================
INSERT INTO User (first_name, last_name, email, phone_number, password_hash, role)
VALUES
('Sarah', 'Nkosi', 'sarah.nkosi@example.com', '+27 81 222 3344', 'hashed_pw_1', 'host'),
('Thabo', 'Molefe', 'thabo.molefe@example.com', '+27 72 444 5566', 'hashed_pw_2', 'guest'),
('Lerato', 'Moyo', 'lerato.moyo@example.com', '+27 63 111 2233', 'hashed_pw_3', 'guest'),
('David', 'Smith', 'david.smith@example.com', '+44 7911 123456', 'hashed_pw_4', 'host');

-- ==========================
-- Insert Locations
-- ==========================
INSERT INTO Location (country, city, postal_code, address_line)
VALUES
('South Africa', 'Cape Town', '8001', '12 Green Point Street'),
('South Africa', 'Johannesburg', '2000', '88 Rosebank Drive'),
('United Kingdom', 'London', 'SW1A 1AA', '10 Downing Street'),
('South Africa', 'Durban', '4001', '22 Umhlanga Rocks Road');

-- ==========================
-- Insert Properties
-- ==========================
INSERT INTO Property (user_id, location_id, title, description, price_per_night, max_guests, property_type)
VALUES
(1, 1, 'Seaside Apartment', 'A cozy modern apartment with ocean views', 850.00, 4, 'Apartment'),
(4, 3, 'Urban Studio Flat', 'Compact but stylish studio flat in central London', 1200.00, 2, 'Studio'),
(1, 2, 'Luxury Villa', 'Spacious villa with a pool and large garden', 2500.00, 6, 'Villa');

-- ==========================
-- Insert Amenities
-- ==========================
INSERT INTO Amenity (name)
VALUES
('WiFi'),
('Pool'),
('Air Conditioning'),
('Parking'),
('Kitchen'),
('TV');

-- ==========================
-- Link Property Amenities
-- ==========================
INSERT INTO Property_Amenity (property_id, amenity_id)
VALUES
(1, 1), (1, 5), (1, 6),       -- Seaside Apartment
(2, 1), (2, 4),               -- Urban Studio Flat
(3, 1), (3, 2), (3, 3), (3, 5); -- Luxury Villa

-- ==========================
-- Insert Bookings
-- ==========================
INSERT INTO Booking (user_id, property_id, check_in_date, check_out_date, total_price, booking_status)
VALUES
(2, 1, '2025-01-05', '2025-01-10', 4250.00, 'confirmed'),
(3, 2, '2025-02-15', '2025-02-20', 6000.00, 'confirmed'),
(2, 3, '2025-03-01', '2025-03-05', 10000.00, 'pending');

-- ==========================
-- Insert Payments
-- ==========================
INSERT INTO Payment (booking_id, amount, payment_method, status)
VALUES
(1, 4250.00, 'credit_card', 'completed'),
(2, 6000.00, 'paypal', 'completed'),
(3, 10000.00, 'bank_transfer', 'pending');

-- ==========================
-- Insert Reviews
-- ==========================
INSERT INTO Review (booking_id, rating, comment)
VALUES
(1, 5, 'Amazing stay! The view was breathtaking and the host was very friendly.'),
(2, 4, 'Good location, clean apartment, but a bit noisy at night.'),
(3, 3, 'Booking process was smooth, but haven’t stayed yet since it’s still pending.');

-- =======================================================
-- End of Seed Data
-- =======================================================
