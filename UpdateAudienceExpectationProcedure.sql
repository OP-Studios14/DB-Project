CREATE OR REPLACE PROCEDURE UpdateAudienceExpectation(
    p_show_name VARCHAR(100),
    p_new_audience INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE SHOW_
    SET ExpectedAudience = p_new_audience
    WHERE ShowID = (
        SELECT ShowID
        FROM SHOW_
        WHERE ShowName = p_show_name
    );
END;
$$;

CALL UpdateAudienceExpectation('Belize City Music Fest', 5000);

SELECT ShowName, ExpectedAudience
FROM SHOW_
WHERE ShowName = 'Belize City Music Fest';