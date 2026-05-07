SELECT * FROM show_ 
ORDER BY venueid;

SELECT * FROM venue;

CREATE OR REPLACE FUNCTION CheckAudienceLimit()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE 
	maxCap INT;
BEGIN
	SELECT maxcapacity INTO maxCap FROM venue v
	INNER JOIN show_ s
	ON v.venueid = NEW.venueid;

	IF(NEW.expectedaudience > maxCap) THEN
		RAISE EXCEPTION 'Expected Audience(%) Exceeds Venue Capacity(%)',NEW.expectedaudience,maxCap;
	ELSE	
		RETURN NEW;
	END IF;
END;
$$;

CREATE OR REPLACE TRIGGER AudienceLimitTrigger
BEFORE UPDATE OR INSERT ON show_
FOR EACH ROW
EXECUTE FUNCTION CheckAudienceLimit();

UPDATE show_
SET expectedaudience = 27000
WHERE venueid = 4;

