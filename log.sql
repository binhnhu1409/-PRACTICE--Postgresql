-- create needed tables
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    contents VARCHAR(240),
    user_id INTEGER REFERENCES users(id),
    photo_id INTEGER REFERENCES photos(id)
);

-- import data from csv mock data files
COPY users(username)
FROM 'C:\Users\Public\users.csv'
DELIMITER ','
CSV HEADER;

COPY photos(url, user_id)
FROM 'C:\Users\Public\photos.csv'
DELIMITER ';'
CSV HEADER;

COPY comments(id, contents, user_id, photo_id)
FROM 'C:\Users\Public\comments.csv'
DELIMITER ';'
CSV HEADER;

