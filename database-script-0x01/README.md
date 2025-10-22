# Airbnb Database Schema

## Overview
This directory contains the SQL scripts that define the relational database schema for the **Airbnb Database Project**, part of the ALX Backend Software Engineering track.

The schema implements a **normalized database design (3NF)** that supports users, properties, bookings, payments, and reviews — mirroring the functionality of an Airbnb-like system.

---

## Files
- **schema.sql** – Contains SQL statements for creating tables, constraints, and indexes.

---

## Schema Highlights
- **User** – Stores host and guest profiles with roles.
- **Property** – Represents listings created by hosts.
- **Booking** – Tracks reservations and booking statuses.
- **Payment** – Manages financial transactions per booking.
- **Review** – Captures feedback and ratings.
- **Location** – Stores address details to avoid redundancy.
- **Amenity / Property_Amenity** – Many-to-many link between properties and amenities.

---

## Database Rules
- Enforced **foreign key constraints** to maintain referential integrity.
- Used **CHECK constraints** for controlled value ranges.
- Added **indexes** for faster query performance on foreign key columns.

---

## Author
**Ntando Loliwe**  
Aspiring Backend Software Developer | ALX Africa  
GitHub: [Ntando17gm](https://github.com/Ntando17gm)
