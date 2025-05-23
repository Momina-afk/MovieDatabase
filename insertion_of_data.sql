INSERT INTO Movie (title, rating, release_date, duration, language)
VALUES 
  ('Inception', '5', '2010-07-16', 148, 'English'),
  ('Parasite', '4.5', '2019-05-30', 132, 'Korean'),
  ('Interstellar', '5', '2014-11-07', 169, 'English'),
  ('The Dark Knight', '3', '2008-07-18', 152, 'English'),
  ('Spiritemoviemovied Away', '2.5', '2001-07-20', 125, 'Japanese'),
  ('3 Idiots', '5', '2009-12-25', 170, 'Hindi'),
  ('Your Name', '5', '2016-08-26', 112, 'Japanese'),
  ('The Godfather', '5', '1972-03-24', 175, 'English'),
  ('Amélie', '4.5', '2001-04-25', 122, 'French'),
  ('The Matrix', '5', '1999-03-31', 136, 'English'),
  ('Pulp Fiction', '4.5', '1994-10-14', 154, 'English'),
  ('The Grand Budapest Hotel', '4', '2014-02-06', 99, 'English');
INSERT INTO Actor (name, dob, nationality, biography) VALUES
  ('Keanu Reeves',    '1964-09-02', 'Canadian', 'Star of The Matrix trilogy.'),
  ('Carrie-Anne Moss','1967-08-21', 'Canadian', 'Played Trinity in The Matrix.'),
  ('Toshiro Mifune',  '1920-04-01', 'Japanese', 'Legendary actor in Kurosawa films.'),
  ('Marlon Brando',   '1924-04-03', 'American', 'Iconic method actor.'),
  ('Leonardo DiCaprio', '1974-11-11', 'American', 'Known for Titanic and Inception.'),
  ('Natalie Portman', '1981-06-09', 'Israeli-American', 'Star of Black Swan and V for Vendetta.'),
  ('John Travolta', '1954-02-18', 'American', 'Pulp Fiction and Grease actor.'),
  ('Uma Thurman', '1970-04-29', 'American', 'Famous for Kill Bill series.'),
  ('Ralph Fiennes', '1962-12-22', 'British', 'Played Voldemort in Harry Potter.');
  INSERT INTO Genre (name) VALUES
  ('Action'),
  ('Sci-Fi'),
  ('Drama'),
  ('Animation'),
  ('Crime'),
  ('Romance'),
  ('Thriller'),
  ('Fantasy');
INSERT INTO Movie_Genre (movie_id, genre_id) VALUES
-- Inception
(1, 1), (1, 2), (1, 3),
-- Parasite
(2, 3), (2, 5), (2, 7),
-- Interstellar
(3, 2), (3, 3),
-- The Dark Knight
(4, 1), (4, 5),
-- Spirited Away
(5, 4), (5, 8),
-- 3 Idiots
(6, 3), (6, 7),
-- Your Name
(7, 4), (7, 6), (7, 8),
-- The Godfather
(8, 3), (8, 5),
-- Amélie
(9, 3), (9, 6),
-- The Matrix
(10, 1), (10, 2),
-- Pulp Fiction
(11, 3), (11, 5),
-- Grand Budapest Hotel
(12, 3), (12, 6);
INSERT INTO Cast (movie_id, actor_id, character_name) VALUES
-- Inception
(1, 5, 'Cobb'),
-- The Matrix
(10, 1, 'Neo'),
(10, 2, 'Trinity'),
-- Spirited Away
(5, 3, 'No-Face'),
-- The Godfather
(8, 4, 'Don Vito Corleone'),
-- Grand Budapest Hotel
(12, 9, 'M. Gustave'),
-- Pulp Fiction
(11, 7, 'Vincent Vega'),
(11, 8, 'Mia Wallace'),
-- Your Name
(7, 3, 'Taki Tachibana'),
-- Amélie
(9, 2, 'Amélie Poulain'),
-- 3 Idiots
(6, 6, 'Rancho');
INSERT INTO Director (name, dob, nationality, contact_no) VALUES
('Christopher Nolan', '1970-07-30', 'British-American', '123-456-7890'),
('Bong Joon-ho', '1969-09-14', 'South Korean', '123-555-7890'),
('Makoto Shinkai', '1973-02-09', 'Japanese', '987-654-3210'),
('Hayao Miyazaki', '1941-01-05', 'Japanese', '456-789-1230'),
('Rajkumar Hirani', '1962-11-20', 'Indian', '321-654-0987'),
('Francis Ford Coppola', '1939-04-07', 'American', '741-852-9630'),
('Quentin Tarantino', '1963-03-27', 'American', '951-753-1590'),
('Wes Anderson', '1969-05-01', 'American', '654-852-1470');
INSERT INTO Writer (name, dob, nationality, contact_no) VALUES
('Christopher Nolan', '1970-07-30', 'British-American', '123-456-7890'),
('Bong Joon-ho', '1969-09-14', 'South Korean', '123-555-7890'),
('Makoto Shinkai', '1973-02-09', 'Japanese', '987-654-3210'),
('Hayao Miyazaki', '1941-01-05', 'Japanese', '456-789-1230'),
('Rajkumar Hirani', '1962-11-20', 'Indian', '321-654-0987'),
('Francis Ford Coppola', '1939-04-07', 'American', '741-852-9630'),
('Quentin Tarantino', '1963-03-27', 'American', '951-753-1590'),
('Wes Anderson', '1969-05-01', 'American', '654-852-1470');
INSERT INTO Script (title, language, writer_id) VALUES
('Inception Script', 'English', 1),
('Parasite Script', 'Korean', 2),
('Interstellar Script', 'English', 1),
('Spirited Away Script', 'Japanese', 4),
('3 Idiots Script', 'Hindi', 5),
('The Godfather Script', 'English', 6),
('Pulp Fiction Script', 'English', 7),
('The Grand Budapest Hotel Script', 'English', 8),
('Your Name Script', 'Japanese', 3),
('The Dark Knight Script', 'English', 1),
('Amélie Script', 'French', 8);
INSERT INTO Production (company_name, founded_year, city, country) VALUES
('Warner Bros.', 1923, 'Burbank', 'USA'),
('CJ Entertainment', 1995, 'Seoul', 'South Korea'),
('Studio Ghibli', 1985, 'Tokyo', 'Japan'),
('Vidhu Vinod Chopra Films', 1985, 'Mumbai', 'India'),
('Paramount Pictures', 1912, 'Hollywood', 'USA'),
('Miramax Films', 1979, 'New York', 'USA'),
('Fox Searchlight Pictures', 1994, 'Los Angeles', 'USA');
INSERT INTO BoxOfficeReport (opening_weekend, budget, total_revenue) VALUES
(62785337, 160000000, 829895144),  -- Inception
(25800000, 11400000, 258000000),   -- Parasite
(47300000, 165000000, 677000000),  -- Interstellar
(2400000, 19000000, 395000000),    -- Spirited Away
(12000000, 5000000, 61000000),     -- 3 Idiots
(30200000, 6000000, 246000000),    -- The Godfather
(9290000, 8000000, 213000000),     -- Pulp Fiction
(817000, 25000000, 172000000),     -- The Grand Budapest Hotel
(519000, 2200000, 380000000),      -- Your Name
(158411483, 185000000, 1005000000); -- The Dark Knight
INSERT INTO Platform (name, url, subscription_type) VALUES
('Netflix', 'https://www.netflix.com', 'Subscription'),
('Amazon Prime Video', 'https://www.primevideo.com', 'Subscription'),
('HBO Max', 'https://www.hbomax.com', 'Subscription'),
('Disney+', 'https://www.disneyplus.com', 'Subscription'),
('Hulu', 'https://www.hulu.com', 'Subscription');
INSERT INTO ContentDistribution (movie_id, platform_id, streams, available_from) VALUES
(1, 1, 1000000, '2020-01-01'),  -- Inception on Netflix
(2, 1, 800000, '2020-03-01'),   -- Parasite on Netflix
(3, 2, 900000, '2020-06-15'),   -- Interstellar on Amazon
(4, 3, 700000, '2020-09-20'),   -- The Dark Knight on HBO
(5, 4, 500000, '2021-02-10'),   -- Spirited Away on Disney+
(6, 2, 600000, '2020-12-01'),   -- 3 Idiots on Amazon
(7, 1, 450000, '2021-01-20'),   -- Your Name on Netflix
(8, 2, 550000, '2020-05-05'),   -- The Godfather on Amazon
(9, 1, 400000, '2021-03-15'),   -- Amélie on Netflix
(10, 3, 1000000, '2021-04-10'); -- The Matrix on HBO
INSERT INTO Award (name, year) VALUES
('Academy Award for Best Picture', 2020),
('Academy Award for Best Director', 2020),
('Cannes Film Festival - Palme d\'Or', 2019),
('Golden Globe for Best Motion Picture', 2020),
('Oscar for Best Animated Feature', 2003),
('Academy Award for Best Original Screenplay', 1995),
('BAFTA Best Film', 2015)
(8, 'Academy Award for Best Actor', 1973), -- Marlon Brando for The Godfather
(9, 'Academy Award for Best Actor', 2016), -- Leonardo DiCaprio for The Revenant
(10, 'Golden Globe for Best Actor – Motion Picture Drama', 2016), -- Leonardo DiCaprio for The Revenant
(11, 'BAFTA Best Actor in a Leading Role', 1973), -- Marlon Brando for The Godfather
(12, 'Saturn Award for Best Actor', 2005), -- Keanu Reeves for Constantine
(13, 'Empire Award for Best Actor', 2000), -- Keanu Reeves for The Matrix
(14, 'Academy Award for Best Actress', 2011), -- Natalie Portman for Black Swan
(15, 'Golden Globe for Best Actress – Motion Picture Drama', 2011), -- Natalie Portman for Black Swan
(16, 'BAFTA Rising Star Award', 2010); -- Kristen Stewart (example award not in DB, just for show)
-- Marlon Brando (actor_id = 4)
INSERT INTO ActorAward (award_id, actor_id) VALUES
(8, 4),
(11, 4);

-- Leonardo DiCaprio (actor_id = 5)
INSERT INTO ActorAward (award_id, actor_id) VALUES
(9, 5),
(10, 5);

-- Keanu Reeves (actor_id = 1)
INSERT INTO ActorAward (award_id, actor_id) VALUES
(12, 1),
(13, 1);

-- Natalie Portman (actor_id = 6)
INSERT INTO ActorAward (award_id, actor_id) VALUES
(14, 6),
(15, 6);

INSERT INTO MovieAward (movie_id, award_id)
VALUES
    (2, 1),  -- Parasite won Best Picture
    (2, 3),  -- Parasite won Palme d'Or
    (2, 4),  -- Parasite won Golden Globe Best Motion Picture
    (5, 5);  -- Spirited Away won Best Animated Feature
    
    INSERT INTO DirectorAward (director_id, award_id)
VALUES
    (1, 2); -- Bong Joon-ho won Best Director
-- User table insertions
INSERT INTO User (name, email, join_date, subscription_type) VALUES
('Alice Johnson', 'alice.johnson@example.com', '2022-01-15', 'Premium'),
('Bob Smith', 'bob.smith@example.com', '2023-03-10', 'Basic'),
('Charlie Lee', 'charlie.lee@example.com', '2021-11-02', 'Standard'),
('Diana Patel', 'diana.patel@example.com', '2022-06-28', 'Premium'),
('Ethan Brown', 'ethan.brown@example.com', '2023-07-05', 'Basic');

-- Review table insertions (foreign keys are respected)
INSERT INTO Review (user_id, movie_id, rating, comment, review_date) VALUES
(1, 1, 9, 'Inception blew my mind! Nolan is a genius.', '2023-01-18'),
(2, 3, 10, 'Interstellar was a cinematic masterpiece.', '2023-03-11'),
(3, 2, 9, 'Parasite is a brilliant social commentary.', '2022-11-03'),
(4, 6, 10, '3 Idiots was both emotional and inspiring.', '2023-06-30'),
(5, 10, 8, 'The Matrix was ahead of its time.', '2023-07-10'),
(1, 4, 9, 'The Dark Knight redefined superhero movies.', '2023-02-12'),
(2, 7, 7, 'Your Name was beautiful but a bit confusing.', '2023-05-20'),
(3, 5, 8, 'Spirited Away is magical and deep.', '2022-12-10'),
(4, 8, 9, 'The Godfather is a timeless classic.', '2023-07-01'),
(5, 12, 7, 'The Grand Budapest Hotel was quirky and fun.', '2023-07-15'),
(1, 11, 8, 'Pulp Fiction is iconic Tarantino brilliance.', '2023-03-01'),
(2, 9, 8, 'Amélie is pure visual and emotional joy.', '2023-04-10');

-- Inception (movie_id = 1)
UPDATE Movie SET script_id = 1, director_id = 1, box_office_id = 1, production_id = 1 WHERE movie_id = 1;

-- Parasite
UPDATE Movie SET script_id = 2, director_id = 2, box_office_id = 2, production_id = 2 WHERE movie_id = 2;

-- Interstellar
UPDATE Movie SET script_id = 3, director_id = 1, box_office_id = 3, production_id = 1 WHERE movie_id = 3;

-- The Dark Knight
UPDATE Movie SET script_id = 10, director_id = 1, box_office_id = 10, production_id = 1 WHERE movie_id = 4;

-- Spirited Away
UPDATE Movie SET script_id = 4, director_id = 4, box_office_id = 4, production_id = 3 WHERE movie_id = 5;

-- 3 Idiots
UPDATE Movie SET script_id = 5, director_id = 5, box_office_id = 5, production_id = 4 WHERE movie_id = 6;

-- Your Name
UPDATE Movie SET script_id = 9, director_id = 3, box_office_id = 9, production_id = 3 WHERE movie_id = 7;

-- The Godfather
UPDATE Movie SET script_id = 6, director_id = 6, box_office_id = 6, production_id = 5 WHERE movie_id = 8;

-- Amélie
UPDATE Movie SET script_id = 11, director_id = 8, production_id = 7 WHERE movie_id = 9;

-- The Matrix
UPDATE Movie SET director_id = 1, box_office_id = 11, production_id = 1 WHERE movie_id = 10;

-- Pulp Fiction
UPDATE Movie SET script_id = 7, director_id = 7, box_office_id = 7, production_id = 6 WHERE movie_id = 11;

-- The Grand Budapest Hotel
UPDATE Movie SET script_id = 8, director_id = 8, box_office_id = 8, production_id = 7 WHERE movie_id = 12;
DELETE FROM Cast WHERE movie_id = 6 AND actor_id = 6;
INSERT INTO Actor (name, dob, nationality, biography)
VALUES ('Aamir Khan', '1965-03-14', 'Indian', 'Famous Bollywood actor known for 3 Idiots and Dangal.');

-- Assume Aamir Khan gets actor_id = 10
INSERT INTO Cast (movie_id, actor_id, character_name)
VALUES (6, 10, 'Rancho');
INSERT INTO Genre (name) VALUES ('Comedy');
DELETE FROM Movie_Genre WHERE movie_id = 6 AND genre_id = 7;  -- Remove Thriller
INSERT INTO Movie_Genre (movie_id, genre_id) VALUES (6, 9);   -- Add Comedy


















  
  
