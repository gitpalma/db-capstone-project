CREATE VIEW `OrdersView` AS
    SELECT 
        `Orders`.`OrderID` AS `OrderID`,
        `Orders`.`Quantity` AS `Quantity`,
        `Orders`.`TotalCost` AS `Cost`
    FROM
        `Orders`
    WHERE
        (`Orders`.`Quantity` > 2);