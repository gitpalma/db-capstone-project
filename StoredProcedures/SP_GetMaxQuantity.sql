CREATE PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT Max(Quantity) AS 'Max Quantity in Order' FROM Orders;
END