CREATE TABLE VENUE (
    VenueID SERIAL PRIMARY KEY,
    VenueName VARCHAR(100) NOT NULL,
    Address VARCHAR(150),
    Phone VARCHAR(20),
    District VARCHAR(50) NOT NULL,
    VenueType VARCHAR(50)
);

CREATE TABLE ARTIST (
    ArtistID SERIAL PRIMARY KEY,
    ArtistName VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    District VARCHAR(50)
);

CREATE TABLE SHOW_ (
    ShowID SERIAL PRIMARY KEY,
    ShowName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Price DECIMAL(8,2),
    Description TEXT,
    ExpectedAudience INT,
    VenueID INT NOT NULL,
    FOREIGN KEY (VenueID) REFERENCES VENUE(VenueID)
);

CREATE TABLE SHOW_ARTIST (
    ShowID INT NOT NULL,
    ArtistID INT NOT NULL,
    PRIMARY KEY (ShowID, ArtistID),
    FOREIGN KEY (ShowID) REFERENCES SHOW_(ShowID),
    FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID)
);


INSERT INTO VENUE(VenueName, Address, Phone, District, VenueType)
VALUES
('Santa Elena Complex', 'Santa Elena', '501-2000001', 'Cayo', 'Outdoor'),
('Belize Civic Center', 'Belize City', '501-2000002', 'Belize', 'Arena'),
('Dangriga Cultural Center', 'Dangriga', '501-2000003', 'Stann Creek', 'Cultural Hall'),
('Saca Chispas Field', 'San Pedro','501-2000004', 'Belize', 'Outdoor');

INSERT INTO ARTIST(ArtistName, Genre, District)
VALUES
('The Garifuna Collective', 'Paranda', 'Stann Creek'),
('Gilharry 7', 'Belizean Brukdown', 'Orange Walk'),
('Stig Da Artist', 'Hip Hop', 'Belmopan'),
('Andy Palacio', 'Punta Rock', 'Toledo');

INSERT INTO SHOW_(ShowName, StartDate, EndDate, Price, Description, ExpectedAudience, VenueID)
VALUES
('Cayo Summer Jam', '2026-06-20', '2026-06-20', 59.99, 'Outdoor Summer Music Festival in Cayo', 650, 1),
('Belize City Music Fest', '2026-08-17', '2026-08-17', 79.99, 'Arena Concert feuturing multiple Belizean Artist', 4000, 2),
('Garifuna Cultural Night','2026-11-19', '2026-11-19', 49.99, 'Celebration of Garifuna music and culture', 1000, 3),
('Island Vibes Concert', '2026-06-27', '2026-06-27', 99.00, 'Island Foam Bash', 1200, 4);

INSERT INTO SHOW_ARTIST(ShowID, ArtistID)
VALUES
(1,1),
(1,2),
(2,1),
(2,2),
(2,3),
(2,4),
(3,1),
(3,4),
(4,1),
(4,2);
