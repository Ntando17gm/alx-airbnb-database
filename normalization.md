# Database Normalization – Airbnb Database

## Objective
The goal of this task is to ensure that the Airbnb database is fully normalized to the **Third Normal Form (3NF)**, minimizing redundancy and improving data integrity.

---

## Step 1: Review of Initial Schema
Our initial schema includes the following entities:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Location**
- **Amenity**
- **Property_Amenity**

Each entity represents a key concept in the Airbnb model and connects via relationships such as:
- One-to-many between **User → Booking**
- One-to-many between **Property → Booking**
- Many-to-many between **Property ↔ Amenity**

---

## Step 2: Applying Normalization Rules

### **First Normal Form (1NF)**
- Each table has a **primary key** (e.g., `user_id`, `property_id`, `booking_id`).
- All attributes contain **atomic values** (e.g., `email`, `phone_number`, `city` are single values).
- No repeating groups or multi-valued fields.

**Result:** Database satisfies 1NF.

---

### **Second Normal Form (2NF)**
- Database is already in 1NF.
- Removed any **partial dependencies** — all non-key attributes depend on the entire primary key.
- Example:
  - In `Booking`, attributes like `check_in_date`, `check_out_date`, and `total_price` depend on `booking_id` (the full key), not just part of it.
  - In `Property_Amenity`, the composite key (`property_id`, `amenity_id`) ensures all attributes depend on both keys.

**Result:** Database satisfies 2NF.

---

### **Third Normal Form (3NF)**
- Database is already in 2NF.
- Eliminated **transitive dependencies** — non-key attributes depend only on the primary key.
- Example:
  - In `Property`, the `city` attribute depends only on `location_id`, not directly on `property_id`, so we moved location data into a separate `Location` table.
  - In `User`, attributes like `email` and `phone_number` depend only on `user_id`, not on any other non-key attribute.

**Result:** Database satisfies 3NF.

---

## Summary of Normalization
| Normal Form | Achieved? | Key Adjustment |
|--------------|------------|----------------|
| 1NF | Yes | Ensured atomic fields and primary keys |
| 2NF | Yes | Removed partial dependencies |
| 3NF | Yes | Removed transitive dependencies |

---

## Explanation
By applying normalization through to 3NF, we achieved:
- **Reduced data redundancy** (no repeated location or amenity data)
- **Improved data integrity** (updates affect only one table)
- **Simplified queries and maintenance**
- **Stronger relational structure** between entities

---

## File Information
**Repository:** `alx-airbnb-database`  
**File:** `normalization.md`  
**Author:** *Ntando Loliwe*  
**Date:** *(Insert today’s date)*  

