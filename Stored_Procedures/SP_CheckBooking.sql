CREATE PROCEDURE `CheckBooking`(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE result VARCHAR(45);
    
    IF (EXISTS (SELECT BookingID FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_number)) THEN
		SELECT CONCAT("Table ", table_number, " is already booked") INTO result;
	ELSE
       SELECT CONCAT("Table ", table_number, " is available") INTO result;
	END IF;
    
    SELECT result AS 'Booking status';  

END