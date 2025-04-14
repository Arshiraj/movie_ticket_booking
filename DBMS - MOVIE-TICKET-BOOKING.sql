CREATE DATABASE movie_booking;
USE movie_booking;
-- users Table
   CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user'
);
-- insert into users Table
INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@example.com', MD5('admin123'), 'admin'),
('Alice', 'alice@example.com', MD5('alice123'), 'user'),
('Bob', 'bob@example.com', MD5('bob123'), 'user'),
('Charlie', 'charlie@example.com', MD5('charlie123'), 'user'),
('David', 'david@example.com', MD5('david123'), 'user'),
('Eva', 'eva@example.com', MD5('eva123'), 'user'),
('Frank', 'frank@example.com', MD5('frank123'), 'user'),
('Grace', 'grace@example.com', MD5('grace123'), 'user'),
('Hannah', 'hannah@example.com', MD5('hannah123'), 'user'),
('Ian', 'ian@example.com', MD5('ian123'), 'user'),
('Jack', 'jack@example.com', MD5('jack123'), 'user'),
('Karen', 'karen@example.com', MD5('karen123'), 'user'),
('Leo', 'leo@example.com', MD5('leo123'), 'user'),
('Mia', 'mia@example.com', MD5('mia123'), 'user'),
('Nina', 'nina@example.com', MD5('nina123'), 'user'),
('Oscar', 'oscar@example.com', MD5('oscar123'), 'user'),
('Paul', 'paul@example.com', MD5('paul123'), 'user'),
('Quincy', 'quincy@example.com', MD5('quincy123'), 'user'),
('Rose', 'rose@example.com', MD5('rose123'), 'user'),
('Steve', 'steve@example.com', MD5('steve123'), 'user');


-- Movies Table
CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    duration VARCHAR(50),
    image VARCHAR(255)
);
-- insert into movies Table
INSERT INTO movies (title, description, duration, image) VALUES
('Avengers: Endgame', 'Superhero action movie by Marvel', '3h 2m', 'endgame.jpg'),
('Inception', 'Sci-fi thriller by Christopher Nolan', '2h 28m', 'inception.jpg'),
('Titanic', 'Romantic drama directed by James Cameron', '3h 15m', 'titanic.jpg'),
('The Dark Knight', 'Batman battles the Joker in this epic', '2h 32m', 'dark_knight.jpg'),
('Interstellar', 'Space exploration to save humanity', '2h 49m', 'interstellar.jpg'),
('Joker', 'Origin story of DC villain Joker', '2h 2m', 'joker.jpg'),
('Spider-Man: No Way Home', 'Multiverse and Spider-Men unite', '2h 28m', 'spiderman.jpg'),
('Doctor Strange', 'Master of mystical arts', '1h 55m', 'doctor_strange.jpg'),
('Iron Man', 'The beginning of Marvel Cinematic Universe', '2h 6m', 'ironman.jpg'),
('The Matrix', 'Reality is not what it seems', '2h 16m', 'matrix.jpg'),
('Avatar', 'Epic sci-fi fantasy on Pandora', '2h 42m', 'avatar.jpg'),
('Shutter Island', 'A mystery unfolds in an isolated island asylum', '2h 18m', 'shutter_island.jpg'),
('The Lion King', 'Animated story of Simba', '1h 58m', 'lion_king.jpg'),
('Frozen', 'Disney princess with ice powers', '1h 42m', 'frozen.jpg'),
('Black Panther', 'Wakanda forever!', '2h 14m', 'black_panther.jpg'),
('The Avengers', 'Earth’s mightiest heroes unite', '2h 23m', 'avengers.jpg'),
('Guardians of the Galaxy', 'Space misfits save the galaxy', '2h 1m', 'guardians.jpg'),
('Finding Nemo', 'Adventure to find a lost fish', '1h 40m', 'nemo.jpg'),
('The Godfather', 'Legendary mafia movie', '2h 55m', 'godfather.jpg'),
('Harry Potter and the Sorcerer\'s Stone', 'The magical journey begins', '2h 32m', 'harry_potter1.jpg');




-- Screens Table
CREATE TABLE IF NOT EXISTS screens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
-- insert into screens Table
INSERT INTO screens (name) VALUES
('Screen 1'), ('Screen 2'), ('Screen 3'), ('Screen 4'), ('Screen 5'),
('Screen 6'), ('Screen 7'), ('Screen 8'), ('Screen 9'), ('Screen 10'),
('Screen 11'), ('Screen 12'), ('Screen 13'), ('Screen 14'), ('Screen 15'),
('Screen 16'), ('Screen 17'), ('Screen 18'), ('Screen 19'), ('Screen 20');

-- Shows Table
CREATE TABLE IF NOT EXISTS shows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    screen_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (screen_id) REFERENCES screens(id) ON DELETE CASCADE
);


-- insert into shows Table
INSERT INTO shows (movie_id, show_date, show_time, screen_id) VALUES
(1, '2025-04-15', '18:30:00', 1),
(2, '2025-04-15', '21:00:00', 2),
(3, '2025-04-16', '19:30:00', 3),
(4, '2025-04-16', '20:30:00', 4),
(5, '2025-04-17', '18:00:00', 5),
(6, '2025-04-17', '21:15:00', 6),
(7, '2025-04-18', '17:00:00', 7),
(8, '2025-04-18', '20:00:00', 8),
(9, '2025-04-19', '19:00:00', 9),
(10, '2025-04-19', '22:00:00', 10),
(11, '2025-04-20', '16:30:00', 11),
(12, '2025-04-20', '20:00:00', 12),
(13, '2025-04-21', '18:30:00', 13),
(14, '2025-04-21', '21:30:00', 14),
(15, '2025-04-22', '17:15:00', 15),
(16, '2025-04-22', '20:45:00', 16),
(17, '2025-04-23', '18:00:00', 17),
(18, '2025-04-23', '21:00:00', 18),
(19, '2025-04-24', '19:00:00', 19),
(20, '2025-04-24', '22:00:00', 20);


-- Seats Table
CREATE TABLE IF NOT EXISTS seats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    is_booked BOOLEAN DEFAULT 0,
    FOREIGN KEY (show_id) REFERENCES shows(id) ON DELETE CASCADE
);

-- For Shows 1 to 20
INSERT INTO seats (show_id, seat_no)
VALUES 
-- Show 1
(1, 'A1'), (1, 'A2'), (1, 'A3'), (1, 'A4'), (1, 'A5'),
(1, 'A6'), (1, 'A7'), (1, 'A8'), (1, 'A9'), (1, 'A10'),
(1, 'B1'), (1, 'B2'), (1, 'B3'), (1, 'B4'), (1, 'B5'),
(1, 'B6'), (1, 'B7'), (1, 'B8'), (1, 'B9'), (1, 'B10'),
(1, 'C1'), (1, 'C2'), (1, 'C3'), (1, 'C4'), (1, 'C5'),
(1, 'C6'), (1, 'C7'), (1, 'C8'), (1, 'C9'), (1, 'C10'),

-- Show 2
(2, 'A1'), (2, 'A2'), (2, 'A3'), (2, 'A4'), (2, 'A5'),
(2, 'A6'), (2, 'A7'), (2, 'A8'), (2, 'A9'), (2, 'A10'),
(2, 'B1'), (2, 'B2'), (2, 'B3'), (2, 'B4'), (2, 'B5'),
(2, 'B6'), (2, 'B7'), (2, 'B8'), (2, 'B9'), (2, 'B10'),
(2, 'C1'), (2, 'C2'), (2, 'C3'), (2, 'C4'), (2, 'C5'),
(2, 'C6'), (2, 'C7'), (2, 'C8'), (2, 'C9'), (2, 'C10');


-- Bookings Table
CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    seat_no VARCHAR(10) NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('booked', 'cancelled') DEFAULT 'booked',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES shows(id) ON DELETE CASCADE
);

-- Insert Sample Bookings
INSERT INTO bookings (user_id, show_id, seat_no, status) VALUES
(2, 1, 'A1', 'booked'), (3, 1, 'A2', 'booked'), (4, 2, 'A3', 'booked'), (5, 3, 'B1', 'booked'),
(6, 4, 'B2', 'booked'), (7, 5, 'A4', 'booked'), (8, 6, 'B3', 'booked'), (9, 7, 'A5', 'booked'),
(10, 8, 'B4', 'booked'), (11, 9, 'B5', 'booked'), (12, 10, 'A1', 'booked'), (13, 11, 'A2', 'booked'),
(14, 12, 'A3', 'booked'), (15, 13, 'A4', 'booked'), (16, 14, 'A5', 'booked'), (17, 15, 'B1', 'booked'),
(18, 16, 'B2', 'booked'), (19, 17, 'B3', 'booked'), (20, 18, 'B4', 'booked'), (2, 19, 'B5', 'booked');

SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    s.show_date,
    s.show_time
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN shows s ON b.show_id = s.id;



-- Join Query to Show Booking Details
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    m.title AS movie_title,
    s.show_date,
    s.show_time,
    scr.name AS screen,
    b.seat_no,
    b.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN shows s ON b.show_id = s.id
JOIN movies m ON s.movie_id = m.id
JOIN screens scr ON s.screen_id = scr.id
ORDER BY b.booking_date DESC;




SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    m.title AS movie_title,
    m.duration,
    s.show_date,
    s.show_time,
    scr.name AS screen,
    b.seat_no AS booked_seat,
    st.seat_no AS alloted_seat,
    st.is_booked,
    b.status,
    b.booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN shows s ON b.show_id = s.id
JOIN movies m ON s.movie_id = m.id
JOIN screens scr ON s.screen_id = scr.id
LEFT JOIN seats st ON b.show_id = st.show_id AND b.seat_no = st.seat_no
ORDER BY b.booking_date DESC;




SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email
FROM bookings b
JOIN users u ON b.user_id = u.id;

SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    m.title AS movie_title,
    s.show_date,
    s.show_time
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN shows s ON b.show_id = s.id
JOIN movies m ON s.movie_id = m.id;
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    m.title AS movie_title,
    s.show_date,
    s.show_time,
    scr.name AS screen_name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN shows s ON b.show_id = s.id
JOIN movies m ON s.movie_id = m.id
JOIN screens scr ON s.screen_id = scr.id;

SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    m.title AS movie_title,
    s.show_date,
    s.show_time,
    scr.name AS screen_name,
    b.seat_no,
    st.is_booked
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN shows s ON b.show_id = s.id
JOIN movies m ON s.movie_id = m.id
JOIN screens scr ON s.screen_id = scr.id
LEFT JOIN seats st ON st.show_id = s.id AND st.seat_no = b.seat_no;


