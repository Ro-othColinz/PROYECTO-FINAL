CREATE TABLE Songs_Ranking (
 	Track VARCHAR,
 	Album_Name VARCHAR,
 	Artist VARCHAR,
	Release_Date DATE,
  	ISRC VARCHAR,
  	All_Time_Rank INT,
  	Track_Score DECIMAL,
	Spotify_Streams FLOAT,
	Spotify_Playlist_Count FLOAT,
	Spotify_Playlist_Reach FLOAT,
	Spotify_Popularity FLOAT,
	YouTube_Views FLOAT,
	YouTube_Likes FLOAT,
	TikTok_Posts FLOAT,
	TikTok_Likes FLOAT,
	TikTok_Views FLOAT,
	YouTube_Playlist_Reach FLOAT,
	Apple_Music_Playlist_Count INT,
	AirPlay_Spins INT,
	SiriusXM_Spins INT,
	Deezer_Playlist_Count INT,
	Deezer_Playlist_Reach INT,
	Amazon_Playlist_Count INT,
	Pandora_Streams FLOAT,
	Pandora_Track_Stations FLOAT,
	Soundcloud_Streams FLOAT,
	Shazam_Counts INT,
	Explicit_Track INT
);

--DROP TABLE Songs_Ranking;

/*INSERT INTO songs_ranking (Track, Album_Name, Artist, Release_Date, ISRC,
  	All_Time_Rank, Track_Score, Spotify_Streams, Spotify_Playlist_Count,
	Spotify_Playlist_Reach, Spotify_Popularity, YouTube_Views, YouTube_Likes,
	TikTok_Posts, TikTok_Likes, TikTok_Views, YouTube_Playlist_Reach,
	Apple_Music_Playlist_Count, AirPlay_Spins, SiriusXM_Spins, Deezer_Playlist_Count,
	Deezer_Playlist_Reach, Amazon_Playlist_Count, Pandora_Streams, Pandora_Track_Stations,
	Soundcloud_Streams, Shazam_Counts, Explicit_Track)
	VALUES ('0.333333333','Million Dollar Baby - Single','Tommy Richman','2024-04-26','QM24S2402528',
	1,725.4,390470936,30716,196631588,92,84274754,1713126,5767700,651565900,5332281936,
	150597040,210,40975,684,62,17598718,114,18004655,22931,4818457,2669262,0
); */

SELECT * FROM SONGS_RANKING;

-- Realiza las siguientes consultas:

--1.- ¿Cuántas canciones se  han lanzado por año en los ultimos 10 años?

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2024-01-01' AND '2024-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2023-01-01' AND '2023-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2022-01-01' AND '2022-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2021-01-01' AND '2021-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2020-01-01' AND '2020-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2019-01-01' AND '2019-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2018-01-01' AND '2018-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2017-01-01' AND '2017-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2016-01-01' AND '2016-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2015-01-01' AND '2015-12-31';

SELECT COUNT(DISTINCT(Track))
	FROM Songs_Ranking
	WHERE Release_Date BETWEEN '2014-01-01' AND '2014-12-31';

-- Respuesta:

/*2024 = 19
2023 = 117
2022 = 104
2021 = 47
2020 = 44
2019 = 65
2018 = 39
2017 = 25
2016 = 20
2015 = 18
2014 = 14
*/


--2.- ¿Cuáles son las canciones más escuchadas en Spotify?

SELECT track, Artist, Spotify_Streams
FROM Songs_Ranking
ORDER BY Spotify_Streams DESC
LIMIT 15;

--3.- ¿Cuales son las canciones mas populares de Spotify? 

SELECT track, Artist, Spotify_Popularity
FROM Songs_Ranking
ORDER BY Spotify_Popularity DESC
LIMIT 15;

--4.- ¿Cuáles son los videos más vistos en YouTube? 

SELECT track, Artist, YouTube_Views
FROM Songs_Ranking
ORDER BY YouTube_Views DESC
LIMIT 15;

--5.- ¿Cuáles son los videos con más “like´s” de YouTube?

SELECT track, Artist, YouTube_Likes
FROM Songs_Ranking
ORDER BY YouTube_Likes DESC
LIMIT 15;

--6- ¿Cuáles son las canciones más vistas en TikTok?

SELECT track, Artist, TikTok_Views
FROM Songs_Ranking
ORDER BY TikTok_Views DESC
LIMIT 15;

--7.- ¿Cuáles son las canciones más utilizadas por TikTok?

SELECT track, Artist, TikTok_Posts
FROM Songs_Ranking
ORDER BY TikTok_Posts DESC
LIMIT 15;


--8.- ¿Cuáles son las canciones más buscadas por Shazam?

SELECT track, Artist, Shazam_Counts
FROM Songs_Ranking
ORDER BY Shazam_Counts DESC
LIMIT 15;


-- 9.- ¿Qué artistas tienen las canciones con calificación más alta?

SELECT Artist, SUM(Track_Score), COUNT(Track_Score)
FROM Songs_Ranking
GROUP BY Artist
ORDER BY SUM(Track_Score) DESC
LIMIT 15;

-- 10.- ¿Qué artistas tienen mayor participación en el Ranking? 

SELECT Artist, SUM(Track_Score), COUNT(Track_Score)
FROM Songs_Ranking
GROUP BY Artist
ORDER BY COUNT(Track_Score) DESC, SUM(Track_Score) desc
LIMIT 15;

--11.- ¿Qué álbum tiene más número de canciones?

SELECT Album_Name, COUNT(Track_Score)
FROM Songs_Ranking
GROUP BY Album_Name
ORDER BY COUNT(Track_Score) DESC
LIMIT 1;

--12.- ¿Cuántas canciones tienen contenido explicito?

SELECT COUNT(Explicit_Track)
FROM Songs_Ranking
WHERE Explicit_Track=1;

-- 13.-¿Cuántas canciones no contienen contenido explicito?

SELECT COUNT(Explicit_Track)
FROM Songs_Ranking
WHERE Explicit_Track=0;

-- 14.- Siendo YouTube, TikTok y Spotify las plataformas más utilizadas ¿Cuál es el promedio de uso?

SELECT AVG(Spotify_Streams) AS Spotify,
AVG(YouTube_Views) AS You_Tube,
AVG(TikTok_Views) AS TickTock
FROM Songs_Ranking;

--Respuesta: TickTock = 1,083,846,803,  Spotify =  704,357,483 y YouTube =  448,946,370.



