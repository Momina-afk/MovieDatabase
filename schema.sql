CREATE DATABASE MovieDB;
USE MovieDB;
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    join_date DATE,
    subscription_type VARCHAR(50)
);
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 10),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    release_date DATE,
    duration INT, -- in minutes
    rating DECIMAL(3,1),
    language VARCHAR(50),
    script_id INT,
    director_id INT,
    box_office_id INT,
    production_id INT,
    FOREIGN KEY (script_id) REFERENCES Script(script_id),
    FOREIGN KEY (director_id) REFERENCES Director(director_id),
    FOREIGN KEY (box_office_id) REFERENCES BoxOfficeReport(box_office_id),
    FOREIGN KEY (production_id) REFERENCES Production(production_id)
);
CREATE TABLE Director (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    nationality VARCHAR(50),
    contact_no VARCHAR(20)
);
CREATE TABLE Script (
    script_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    language VARCHAR(50),
    writer_id INT,
    FOREIGN KEY (writer_id) REFERENCES Writer(writer_id)
);
CREATE TABLE Writer (
    writer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    nationality VARCHAR(50),
    contact_no VARCHAR(20)
);
CREATE TABLE Actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    nationality VARCHAR(50),
    biography TEXT
);
CREATE TABLE Cast (
    movie_id INT,
    actor_id INT,
    character_name VARCHAR(100),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id)
);
CREATE TABLE Award (
    award_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    year INT
);
CREATE TABLE ActorAward (
    award_id INT,
    actor_id INT,
    PRIMARY KEY (award_id, actor_id),
    FOREIGN KEY (award_id) REFERENCES Award(award_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id)
);
CREATE TABLE MovieAward (
    award_id INT,
    movie_id INT,
    PRIMARY KEY (award_id, movie_id),
    FOREIGN KEY (award_id) REFERENCES Award(award_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE DirectorAward (
    award_id INT,
    director_id INT,
    PRIMARY KEY (award_id, director_id),
    FOREIGN KEY (award_id) REFERENCES Award(award_id),
    FOREIGN KEY (director_id) REFERENCES Director(director_id)
);
CREATE TABLE Production (
    production_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100),
    founded_year YEAR,
    city VARCHAR(100),
    country VARCHAR(50)
);
CREATE TABLE BoxOfficeReport (
    box_office_id INT AUTO_INCREMENT PRIMARY KEY,
    opening_weekend BIGINT,
    budget BIGINT,
    total_revenue BIGINT
);
CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);
CREATE TABLE Platform (
    platform_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    url VARCHAR(200),
    subscription_type VARCHAR(50)
);

CREATE TABLE ContentDistribution (
    movie_id INT,
    platform_id INT,
    streams INT,
    available_from DATE,
    PRIMARY KEY (movie_id, platform_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (platform_id) REFERENCES Platform(platform_id)
);