# AirBnB-Clone-Database

This project is an **SQL schema and dataset** simulating an AirBnB-like platform.  
It includes **Users, Listings, Bookings, Reviews, and Experiences** with sample data to demonstrate relationships, constraints, and queries.

---

## 📂 Database Details
- **Database Name**: `AirBnB_Clone`
- **SQL Engine**: MySQL 8.0+
- **Generated Using**: [Antares SQL Client](https://antares-sql.app/)

---



## 📂 ER-Diagram

<img width="1200" height="820" alt="ER_Diagram" src="https://github.com/user-attachments/assets/e89d987b-f776-4bc1-ad57-c1c424d64672" />



---
## 📑 Schema Overview

### 1. USERS
- Stores information about **hosts** and **guests**.
- Columns: `userId`, `emailID`, `name`, `phno`, `bio`, `userType (host/guest)`, `language`, `password`.

### 2. LISTINGS
- Contains details of available properties.
- Columns: `listingId`, `hostId`, `title`, `description`, `location`, `accomodation`, `amenities`, `availability`, `max_no_guest`, `images`, `price`, `currency`, `city`, `country`.
- **Foreign Key**: `hostId → USERS(userId)`.

### 3. BOOKINGS
- Stores booking details made by guests.
- Columns: `bookingId`, `guestId`, `listingId`, `checkInDate`, `checkOutDate`, `no_of_guest`, `total_price`, `status`.
- **Constraints**:
  - Guests must be > 0.
  - Status must be one of: `pending`, `confirmed`, `completed`, `cancelled`.

### 4. REVIEWS
- Reviews given by guests for their bookings.
- Columns: `reviewId`, `bookingId`, `userId`, `listingId`, `ratings (1–5)`, `comments`, `reviewDate`.
- **Foreign Keys**:
  - `bookingId → BOOKINGS(bookingId)`
  - `userId → USERS(userId)`
  - `listingId → LISTINGS(listingId)`

### 5. EXPERIENCE
- Experiences/activities hosted by users.
- Columns: `experienceId`, `hostId`, `title`, `description`, `city`, `country`, `language`, `max_group_size`, `price`, `images`, `categories`.
- **Foreign Key**: `hostId → USERS(userId)`.

---

## 📊 Sample Data
The dataset includes:
- **Users**: 10 entries (hosts & guests).
- **Listings**: 10 entries (rooms, villas, huts, apartments).
- **Bookings**: 10 entries with different statuses.
- **Reviews**: 10 entries (1–5 star ratings).
- **Experiences**: 10 entries (tours, cooking, adventure, etc.).

---

## 🚀 How to Use
1. Clone/download this repository.
2. Import the SQL dump into MySQL:
   ```bash
   mysql -u your_username -p AirBnB_Clone < AirBnB_Clone.sql
   ```
3. Run queries on tables to explore data.

---

## 🛠 Example Queries

- **Average rating per city**:
  ```sql
  SELECT l.city, AVG(r.ratings) AS avg_rating
  FROM REVIEWS r
  JOIN LISTINGS l ON l.listingId = r.listingId
  GROUP BY l.city
  ORDER BY avg_rating DESC;
  ```

- **Top earning listings**:
  ```sql
  SELECT l.title, SUM(b.total_price) AS total_earnings
  FROM BOOKINGS b
  JOIN LISTINGS l ON l.listingId = b.listingId
  GROUP BY l.title
  ORDER BY total_earnings DESC;
  ```

---

## 📌 Notes
- Data is **dummy** and for educational/demo purposes only.
- Demonstrates **constraints, relationships, normalization, and sample queries**.

---

## 👨‍💻 Author
- Abhishek Shukla  
- [LinkedIn](https://www.linkedin.com/in/abhishek-shukla-052897292/)  
