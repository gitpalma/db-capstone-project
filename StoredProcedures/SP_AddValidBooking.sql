CREATE PROCEDURE `AddValidBooking`(IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
	DECLARE result VARCHAR(100);
    DECLARE booking_exists BOOL DEFAULT FALSE;
    
    START TRANSACTION;  
 				
		IF (EXISTS (SELECT BookingID FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_number)) THEN
			SELECT CONCAT("Table ", table_number, " is already booked - booking cancelled") INTO result;
            SET booking_exists = TRUE;
		ELSE
		   SELECT CONCAT("Table ", table_number, " was booked successfully") INTO result;
		END IF;
        
		INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
		VALUES (booking_date, table_number, customer_id);         
        
      IF (booking_exists IS TRUE) THEN
		ROLLBACK;
      ELSE
        COMMIT;
	  END IF;
      
	  SELECT result AS 'Booking status';  
END