SELECT * FROM Song;

SELECT SongId, Title, SongLength, ReleaseDate
FROM Song;

SELECT * FROM Genre;

INSERT into Artist(ArtistName, YearEstablished)
VALUES ("Alice In Chains", "1987");

INSERT into Artist (ArtistName, YearEstablished)
VALUES ("Tool", "1990");

INSERT into Album 
(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
SELECT "Aenima", "09/17/1996", 7718, "Zoo", Artist.ArtistId, Genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Tool"
and Genre.Label = "Rock";

INSERT into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Stinkfist", 600, "09/17/1996", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Rock"
and 
Artist.ArtistName = "Tool"
and 
Album.Title = "Aenima";

INSERT into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "46 & 2", 500, "09/17/1996", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Rock"
and
Artist.ArtistName = "Tool"
and
Album.Title = "Aenima";

SELECT Count() as "Number of Songs", album.title
FROM Song
JOIN Album on song.AlbumId = album.AlbumId
GROUP BY song.AlbumId;

SELECT Count() as "Number of Songs Per Artist", artist.ArtistName
FROM Song
JOIN Artist on song.ArtistId = artist.ArtistId
GROUP BY song.ArtistId;

SELECT Count() as "Number of Song Per Genre", genre.Label
FROM Song
JOIN Genre on song.GenreId = genre.GenreId
GROUP BY song.GenreId;

SELECT album.Title, Max(AlbumLength) as "Duration"
FROM Album;

SELECT song.Title as "Song Title", album.Title as "Album Title", Max(SongLength) as "Duration"
From Song
JOIN Album ON song.AlbumId = album.AlbumId;

SELECT song.Title as "Song Title", album.Title as "Album Title", song.SongLength as "Duration"
From Song
JOIN Album ON song.AlbumId = album.AlbumId;

SELECT Count() as "Number of Artists"
FROM Artist;

SELECT ArtistName as "Band", YearEstablished as "Year Formed" FROM Artist;

SELECT Song.Title as "Song Title", Artist.ArtistName as "Artist", Album.Title as "Album", Song.ReleaseDate as "Year Released", Song.SongLength as "Duration"
FROM Song, Artist, Album
WHERE Song.ArtistId = Artist.ArtistId
AND
Song.AlbumId = Album.AlbumId;

SELECT ArtistName, YearEstablished
FROM Artist
WHERE YearEstablished > 1990;

SELECT ArtistName, YearEstablished
FROM Artist
WHERE YearEstablished < 1990;

SELECT Song.Title as "Song Title", Album.Title as "Album Title", Artist.ArtistName
FROM Song
JOIN Album
ON Song.AlbumId = Album.AlbumId
JOIN Artist
ON Album.ArtistId = Artist.ArtistId
WHERE Artist.ArtistName LIKE "%t%";

SELECT Count() as "Number of Artists" FROM Artist;

SELECT Count() as "Songs Per Genre", Genre.Label
FROM Song
JOIN Genre
ON Song.GenreId = Genre.GenreId
GROUP BY Genre.Label;

SELECT Count () as "Total Songs" FROM Song;