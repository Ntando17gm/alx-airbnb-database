# Airbnb Database Sample Data

## Overview
This script populates the Airbnb database with **sample data** for testing and development purposes.  
It simulates real-world Airbnb usage, including multiple users, properties, bookings, payments, and reviews.

---

## Files
- **seed.sql** – Contains SQL INSERT statements for all tables.

---

## Entities Populated
- **User** – 4 sample users (2 hosts, 2 guests)
- **Location** – 4 cities (Cape Town, Johannesburg, Durban, London)
- **Property** – 3 sample listings with price and guest capacity
- **Amenity** – Common property amenities
- **Property_Amenity** – Links between properties and amenities
- **Booking** – Multiple confirmed and pending bookings
- **Payment** – Reflects completed and pending payments
- **Review** – Realistic user feedback for completed stays

---

## How to Use
1. Ensure all tables are created by running `schema.sql` first.
2. Then run the seed file:
   ```bash
   psql -U <your_username> -d <your_database> -f seed.sql
