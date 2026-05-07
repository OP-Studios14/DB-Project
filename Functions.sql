CREATE OR REPLACE FUNCTION AveragePriceByDistrict(p_district VARCHAR)
RETURNS NUMERIC(8,2) AS
$$
DECLARE
    avg_price NUMERIC(8,2);
BEGIN
    SELECT AVG(s.price)
    INTO avg_price
    FROM show_ s
    WHERE s.venueid IN (
        SELECT v.venueid
        FROM venue v
        WHERE v.district = p_district
    );

    RETURN avg_price;
END;
$$ LANGUAGE plpgsql;


SELECT AveragePriceByDistrict('Belize');


CREATE OR REPLACE FUNCTION GenrePopularityScore(
    p_genre VARCHAR,
    p_district VARCHAR
)
RETURNS INTEGER AS
$$
DECLARE
    total_shows INTEGER;
BEGIN
    SELECT COUNT(DISTINCT s.showid)
    INTO total_shows
    FROM show_ s
    WHERE s.venueid IN (
        SELECT v.venueid
        FROM venue v
        WHERE v.district = p_district
    )
    AND s.showid IN (
        SELECT sa.showid
        FROM show_artist sa
        WHERE sa.artistid IN (
            SELECT a.artistid
            FROM artist a
            WHERE a.genre = p_genre
        )
    );

    RETURN total_shows;
END;
$$ LANGUAGE plpgsql;


SELECT AveragePriceByDistrict('Belize');

