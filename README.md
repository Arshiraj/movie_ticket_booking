
# 🎬 Movie Ticket Booking System

This project is a **Movie Ticket Booking System** designed with a relational database structure represented in the ER (Entity-Relationship) diagram provided below. The system manages users, movies, screens, shows, seats, and bookings, supporting an end-to-end flow for reserving seats for movie shows.

---

## 📌 ER Diagram

![ER_diagram](https://github.com/user-attachments/assets/43404e99-aadc-44f6-8ea0-d31babb06567)


---

## 📂 Database Entities & Relationships

### 1. **Users**
Represents system users who can book tickets.

| Column     | Type     | Description                 |
|------------|----------|-----------------------------|
| id         | INT      | Primary Key                 |
| name       | VARCHAR  | User's full name            |
| email      | VARCHAR  | User's email                |
| password   | VARCHAR  | Encrypted password          |
| role       | VARCHAR  | Role (e.g., admin, user)    |

---

### 2. **Movies**
Contains information about available movies.

| Column     | Type     | Description                |
|------------|----------|----------------------------|
| id         | INT      | Primary Key                |
| title      | VARCHAR  | Movie title                |
| description| TEXT     | Movie description          |
| duration   | TIME     | Duration of the movie      |
| image      | VARCHAR  | Poster/image URL           |

---

### 3. **Screens**
Defines the different cinema halls.

| Column | Type     | Description        |
|--------|----------|--------------------|
| id     | INT      | Primary Key        |
| name   | VARCHAR  | Name of the screen |

---

### 4. **Shows**
Defines the scheduling of movies on specific screens.

| Column     | Type     | Description                       |
|------------|----------|-----------------------------------|
| id         | INT      | Primary Key                       |
| movie_id   | INT      | Foreign Key referencing Movies    |
| show_date  | DATE     | Date of the show                  |
| show_time  | TIME     | Time of the show                  |
| screen_id  | INT      | Foreign Key referencing Screens   |

---

### 5. **Seats**
Seats for specific shows and their booking status.

| Column     | Type     | Description                          |
|------------|----------|--------------------------------------|
| id         | INT      | Primary Key                          |
| show_id    | INT      | Foreign Key referencing Shows        |
| seat_no    | VARCHAR  | Seat number (e.g., A1, B2)           |
| is_bookrd  | BOOLEAN  | Indicates if the seat is booked      |

---

### 6. **Bookings**
Tracks bookings made by users.

| Column         | Type     | Description                          |
|----------------|----------|--------------------------------------|
| id             | INT      | Primary Key                          |
| user_id        | INT      | Foreign Key referencing Users        |
| show_id        | INT      | Foreign Key referencing Shows        |
| booking_late   | DATETIME | Booking time                         |
| status         | VARCHAR  | Booking status (e.g., confirmed)     |

---

## 🔗 Relationships Summary

- **Users ↔ Bookings**: One user can have many bookings.
- **Movies ↔ Shows**: A movie can have multiple showtimes.
- **Screens ↔ Shows**: Each show takes place in one screen.
- **Shows ↔ Seats**: Each show has multiple seats.
- **Bookings ↔ Seats**: Each booking reserves specific seats.
- **Bookings ↔ Shows**: Each booking is for a particular show.

---

## 🚀 Future Improvements

- Implement API for managing bookings and availability.
- Add authentication and role-based access.
- Integrate payment processing.
- Add real-time seat availability checking.

---

