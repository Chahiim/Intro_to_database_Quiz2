DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;

CREATE TABLE albums(
    album_id serial PRIMARY KEY,
    album_name text NOT NULL,
    rating integer NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE tracks(
    track_id serial PRIMARY KEY,
    track_name text NOT NULL,
    artist text NOT NULL,
    length TIME NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE albums_tracks(
    id serial PRIMARY KEY,
    album_id integer REFERENCES albums(album_id),
    track_id integer REFERENCES tracks(track_id),
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

INSERT INTO albums(album_name,rating)
VALUES('Aces',5),
('Mavrick', 3),
('Real', 4),
('Homelander', 2),
('Unity', 4),
('Reloader', 3),
('The final ride', 5),
('Melo nelo', 3),
('Unbroken', 4),
('123', 1),
('k and J', 5);

INSERT INTO tracks(track_name, artist, length)
VALUES ('Star','Frank Sinatra','03:40'),
('Lean on me','Michael Jackson','03:30'),
('Wishin list','Gorge Mason', '03:10'),
('Jamin','Nicolas Nik','02:45'),
('Help me','Hanna mona','03:20'),
('Yellow','123','04:20'),
('Neon', 'Realic','03:15'),
('Falling star','Madona','03:30'),
('Burn out','Midland','03:45'),
('My way','Frank Sinatra','04:20'),
('Epic','Goodies','03:45'),
('Jamie Billy','Austin moore','04:10');

INSERT INTO albums_tracks(album_id,track_id)
VALUES(1,2),
(1,4),
(1,5),
(2,1),
(2,3),
(2,6),
(3,8),
(4,7),
(5,9),
(6,10),
(7,11),
(8,2),
(8,5),
(8,6),
(9,10),
(9,9),
(9,11),
(10,1),
(10,3),
(10,7),
(10,8),
(10,5);

SELECT A.album_name, T.track_name
FROM albums AS A
INNER JOIN albums_tracks AS AT 
ON A.album_id = AT.album_id
INNER JOIN tracks AS T 
ON T.track_id = AT.track_id;

SELECT T.track_name, A.album_name
FROM tracks AS T 
INNER JOIN albums_tracks AS AT 
ON T.track_id = AT.track_id
INNER JOIN albums AS A 
ON A.album_id = AT.album_id;

SELECT A.album_name, COUNT(T.track_id) AS Number_of_tracks
From albums AS A
INNER JOIN albums_tracks AS AT 
ON A.album_id = AT.album_id
INNER JOIN tracks AS T 
ON T.track_id = AT.track_id
GROUP BY A.album_name;

SELECT T.track_name,COUNT(A.album_id) AS Number_of_albums
FROM tracks AS T 
INNER JOIN albums_tracks AS AT 
ON T.track_id = AT.track_id
INNER JOIN albums AS A 
ON A.album_id = AT.album_id
GROUP BY T.track_name;