CREATE PROCEDURE GetFlights
AS
	SELECT 
		date, 
		airport_id, 
		departure_time, 
		arrival_time, 
		airline
	FROM
		Flights
	ORDER BY airline;    
GO

EXEC GetFlights

CREATE FUNCTION ExtraLuggage (
	@luggage INT
)
RETURNS INT AS
BEGIN
	DECLARE @extra_luggage INT;
	SET @extra_luggage=0;
    IF (@luggage> 20) SET @extra_luggage=@luggage-20;
   
    RETURN @extra_luggage
END;

select *,dbo.ExtraLuggage(Tickets.luggage_size) as Conclusion From Tickets;

CREATE TRIGGER after_insert_stewards
ON Stewards
FOR INSERT 
AS DECLARE @ID INT;
SELECT @ID = ins.steward_id FROM inserted ins;
UPDATE Stewards
SET salary = 3000 
WHERE steward_id = @ID;

INSERT INTO Stewards(steward_id,name,flying_hours,salary)
VALUES (51,'Maria Georgieva',200,5000);
SELECT * FROM Stewards

