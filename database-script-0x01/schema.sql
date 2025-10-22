-- =======================================================
-- Airbnb Database Schema (schema.sql)
-- Author: Ntando Loliwe
-- Project: ALX Airbnb Database
-- =======================================================

-- Drop existing tables to reset schema (use with caution)
DROP TABLE IF EXISTS Review, Payment, Booking, Property_Amenity, Amenity, Property, Location, User CASCADE;

-- =======================================================
-- Table: User
-- =======================================================
CREATE TABLE User (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('host', 'guest')) DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =======================================================
-- Table: Location
-- =======================================================
CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    address_line VARCHAR(255)
);

-- =======================================================
-- Table: Property
-- =======================================================
CREATE TABLE Property (
    property_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    location_id INT REFERENCES Location(location_id),
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price_per_night DECIMAL(10,2) NOT NULL,
    max_guests INT DEFAULT 1,
    property_type VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_property_user_id ON Property(user_id);
CREATE INDEX idx_property_location_id ON Property(location_id);

-- =======================================================
-- Table: Amenity
-- =======================================================
CREATE TABLE Amenity (
    amenity_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- =======================================================
-- Table: Property_Amenity (Many-to-Many Relationship)
-- =======================================================
CREATE TABLE Property_Amenity (
    property_id INT REFERENCES Property(property_id) ON DELETE CASCADE,
    amenity_id INT REFERENCES Amenity(amenity_id) ON DELETE CASCADE,
    PRIMARY KEY (property_id, amenity_id)
);

-- =======================================================
-- Table: Booking
-- =======================================================
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    property_id INT NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    booking_status VARCHAR(20) CHECK (booking_status IN ('pending', 'confirmed', 'cancelled')) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- =======================================================
-- Table: Payment
-- =======================================================
CREATE TABLE Payment (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    status VARCHAR(20) CHECK (status IN ('completed', 'pending', 'failed')) DEFAULT 'pending'
);

CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- =======================================================
-- Table: Review
-- =======================================================
CREATE TABLE Review (
    review_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_review_booking_id ON Review(booking_id);

-- =======================================================
-- End of Schema
-- =======================================================
