CREATE PROCEDURE `CancelBooking`(IN booking_id INT)
BEGIN
	DECLARE result VARCHAR(45);    
    SELECT CONCAT("Booking ", booking_id, " cancelled") INTO result;
    
    IF (EXISTS (SELECT BookingID FROM Bookings WHERE BookingID = booking_id)) THEN
		DELETE FROM Bookings WHERE BookingID = booking_id;
	ELSE
       SELECT CONCAT("Booking ", booking_id, " NOT FOUND") INTO result;
	END IF;
    
    SELECT result AS 'Confirmation';  
END