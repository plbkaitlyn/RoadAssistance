SET
	@userType = "customer",
	@name = "Phuong Linh Bui",
	@userName = "linh",
	@userPassword = "linh1",
	@regNo = "ABX1234",
	@make = "Lamborghini",
	@model = "Miura",
	@color = "black",
	@cardName = "Linh Bui",
	@cardNo = "1111222233334444",
	@expMonth = "10",
	@expYear = "25",
	@cvv = "123",
	
	@cost = 100.50,
	@contractor = "Jim Fixer",
	@review = "Good price!",
	@rating = 3.5,
	
	@issue = "Engine",
	@description = "Lose engine power and engine doesn't restart!";
	
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID(); 
INSERT INTO CUSTOMER VALUES (@userID, @name, @userName, @userPassword, "linh@gmail.com");
INSERT INTO VEHICLE VALUES (@regNo, @make, @model, @color, @userID);
INSERT INTO PAYMENT VALUES (@cardName, @cardNo, @expMonth, @expYear, @cvv, @userID);
INSERT INTO PAST_TRANSACTION(cost, contractor, review, rating, userID) VALUES (@cost, @contractor, @review, @rating, @userID);
INSERT INTO REQUEST(issueType, description, cusID) VALUES (@issue, @description, @userID);

SET
	@userType = "customer",
	@userName = "mike",
	@name = "Mike Rotch",
	@userPassword = "mike1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @name, @userName, @userPassword, "kaitlyn@gmail.com");

SET
	@userType = "customer",
	@name = "Stephanie Gilmore",
	@userName = "steph",
	@userPassword = "steph1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @name, @userName, @userPassword, "steph@yahoo.com");


SET
	@userType = "customer",
	@name = "Schai Armes",
	@userName = "schai",
	@userPassword = "schai1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @name, @userName, @userPassword, "schai@hotmail.com");


SET
	@userType = "customer",
	@name = "James Packer",
	@userName = "james",
	@userPassword = "james1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @name, @userName, @userPassword, "james@gmail.com");


SET
	@userType = "contractor",
	@name = "Victor Radley",
	@license = 1234,
	@userName = "victor",
	@userPassword = "victor1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @name, @license, @userName, @userPassword, "victor@gmail.com");


SET
	@userType = "contractor",
	@license = 4321,
	@name = "Henry Cavil",
	@userName = "henry",
	@userPassword = "henry1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @name, @license, @userName, @userPassword, "henry@hotmail.com");


SET
	@userType = "contractor",
	@license = 5678,
	@name = "Jim Fixer",
	@userName = "jim",
	@userPassword = "jim1",
	
	@distance = 10,
	@customerID = 1,
	@issue = "Engine";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @name, @license, @userName, @userPassword, "john@yahoo.com");
INSERT INTO WORK(distance, customerID, issue, userID) VALUES (@distance, @customerID, @issue, @userID);	


SET
	@userType = "contractor",
	@license = 8765,
	@name = "Sarah Green",
	@userName = "sarah",
	@userPassword = "sarah1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
	SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @name, @license, @userName, @userPassword, "sarah@gmail.com");

