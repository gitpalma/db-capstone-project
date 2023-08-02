CREATE VIEW `MenuOrderGreaterTwoView` AS
    SELECT 
        `Menus`.`Cuisine` AS `Cuisine`
    FROM
        (`Menus`
        JOIN `Orders` ON ((`Menus`.`MenuID` = `Orders`.`MenuID`)))
    WHERE
        `Orders`.`OrderID` = ANY (SELECT 
                `OrdersView`.`OrderID`
            FROM
                `OrdersView`)