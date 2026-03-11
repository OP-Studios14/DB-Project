--Average Ticket Price by District

SELECT V.district, AVG(S.price) AS AvgTicketPrice FROM SHOW_ S
JOIN VENUE V ON S.venueID = V.venueID
GROUP BY V.district;

--District with the Most Shows

SELECT V.district, COUNT(S.ShowID) AS TotalShows FROM SHOW_ S
JOIN VENUE V ON S.venueID = V.venueID
GROUP BY V.district
ORDER BY TotalShows DESC
LIMIT 1;

--Most Common Genre by District

SELECT DISTINCT ON (V.District)
V.District, A.Genre FROM SHOW_ S
JOIN VENUE V ON S.VenueID = V.VenueID
JOIN SHOW_ARTIST SA ON S.ShowID = SA.ShowID
JOIN ARTIST A ON SA.ArtistID = A.ArtistID
GROUP BY V.District, A.Genre
ORDER BY V.District, COUNT(*) DESC;

--Venue with the Highest Average Ticket Price

SELECT V.venueName, AVG(S.price) AS AvgPrice FROM SHOW_ S
JOIN VENUE V ON S.venueid = V.venueid
GROUP BY V.venueName
ORDER BY AvgPrice DESC
LIMIT 1;

--Month with the Most Shows

SELECT TO_CHAR(StartDate,'Month') AS month, COUNT(*) AS show_count FROM SHOW_
GROUP BY month
ORDER BY show_count DESC
LIMIT 1;

