CREATE OR REPLACE PROCEDURE BulkPriceAdjustment(
    IN district_name VARCHAR(100),
    IN percentage_increase DECIMAL(5,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Show_
    SET Price = Price * (1 + percentage_increase / 100)
    WHERE VenueID IN (
        SELECT VenueID 
        FROM Venue 
        WHERE District = district_name);
END;
$$;

SELECT * FROM show_
ORDER BY showid;

CALL BulkPriceAdjustment('Belize',10);