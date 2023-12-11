DROP DATABASE IF EXISTS mediashare;
CREATE DATABASE mediashare;
USE mediashare;


-- create tables

CREATE TABLE Users (
  user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  user_level_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL
);
CREATE TABLE MediaItems (
  media_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  filesize INT NOT NULL,
  media_type VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (media_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- add users
INSERT INTO Users 
    VALUES (260, 'VCHar', 'secret123', 'vchar@example.com', 1, null);
INSERT INTO Users 
    VALUES (305, 'Donatello', 'secret234', 'dona@example.com', 1, null);
INSERT INTO Users 
    VALUES (null, 'New User', 'secret1234', 'user@example.com', 1, null);

-- add media items
INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type, created_at) 
  VALUES ('ffd8.jpg', 887574, 'Favorite drink', null, 305, 'image/jpeg', null),
    ('ffd8.jpg', 887575, 'Favorite drink2', null, 305, 'image/jpeg', null);

INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type, created_at) 
  VALUES ('fffd8.jpg', 787574, 'Favorite drink', null, 305, 'image/jpeg',null),
         ('dbbd.jpg', 60703, 'Miika',null, 305, 'image/jpeg', null),
         ('2f9b.jpg', 30635, 'Aksux and Jane', null, 260, 'image/jpeg', null);

SELECT * FROM Users, MediaItems WHERE Users.user_id = MediaItems.user_id;

-- inner join
SELECT MediaItems.*, Users.username
  FROM MediaItems 
  JOIN Users ON Users.user_id = MediaItems.user_id;

-- right join
SELECT filename , title, username, MediaItems.created_at As Uploaded
  From MediaItems
  Right JOIN Users ON 