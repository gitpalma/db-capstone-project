CREATE PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
	DECLARE result VARCHAR(45);    
    SELECT CONCAT("Order ", order_id, " is cancelled") INTO result;
    
    IF (EXISTS (SELECT OrderID FROM Orders WHERE OrderID = order_id)) THEN
		DELETE FROM Orders WHERE OrderID = order_id;
	ELSE
       SELECT CONCAT("Order ", order_id, " NOT FOUND") INTO result;
	END IF;
    
    SELECT result AS Confirmation;   
END