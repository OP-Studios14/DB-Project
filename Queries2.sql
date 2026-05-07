--Find the most common music genre in each district 
SELECT v.VenueName, AVG(s.Price) AS AvgPrice
FROM SHOW s
JOIN VENUE v ON s.VenueID = v.VenueID
GROUP BY v.VenueID, v.VenueName
HAVING AVG(s.Price) = (
    SELECT MAX(AvgPrice)
    FROM (
        SELECT VenueID, AVG(Price) AS AvgPrice
        FROM SHOW
        GROUP BY VenueID
    ) AS VenueAverages
);

--Find a Venue that has the highest average ticket price 
SELECT District, Genre, COUNT(*) AS GenreCount
FROM ARTIST
GROUP BY District, Genre
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM ARTIST a2
        WHERE a2.District = ARTIST.District
        GROUP BY a2.Genre
    ) AS GenreCounts
);