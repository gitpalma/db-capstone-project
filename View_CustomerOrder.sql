CREATE VIEW `CustomerOrderView` AS
    SELECT 
        `Customers`.`CustomerID` AS `CustomerID`,
        `Customers`.`FullName` AS `FullName`,
        `Orders`.`OrderID` AS `OrderID`,
        `Orders`.`TotalCost` AS `Cost`,
        `Menus`.`Cuisine` AS `MenuName`,
        `MenuItems`.`CourseName` AS `CourseName`
    FROM
        (((`Customers`
        JOIN `Orders` ON ((`Customers`.`CustomerID` = `Orders`.`CustomerID`)))
        JOIN `Menus` ON ((`Orders`.`MenuID` = `Menus`.`MenuID`)))
        JOIN `MenuItems` ON ((`Menus`.`ItemID` = `MenuItems`.`ItemID`)))
    WHERE
        (`Orders`.`TotalCost` > 150);