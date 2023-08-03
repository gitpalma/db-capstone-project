CREATE PROCEDURE `UpdateBooking`(IN booking_id INT, IN booking_date DATE )
BEGIN
	UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
    
    SELECT concat("Booking " , booking_id, " updated") AS "Confirmation";
END