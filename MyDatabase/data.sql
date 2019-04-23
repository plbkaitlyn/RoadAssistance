SET
	@userType = "customer",
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
	@rating = 4;
	
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID(); 
INSERT INTO CUSTOMER VALUES (@userID, @userName, @userPassword, "linh@gmail.com");
INSERT INTO VEHICLE VALUES (@regNo, @make, @model, @color, @userID);
INSERT INTO PAYMENT VALUES (@cardName, @cardNo, @expMonth, @expYear, @cvv, @userID);
INSERT INTO PAST_TRANSACTION(cost, contractor, review, rating, userID) VALUES (@cost, @contractor, @review, @rating, @userID);


SET
	@userType = "customer",
	@userName = "kaitlyn",
	@userPassword = "kaitlyn1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @userName, @userPassword, "kaitlyn@gmail.com");

SET
	@userType = "customer",
	@userName = "steph",
	@userPassword = "steph1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @userName, @userPassword, "steph@yahoo.com");


SET
	@userType = "customer",
	@userName = "schai",
	@userPassword = "schai1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @userName, @userPassword, "schai@hotmail.com");


SET
	@userType = "customer",
	@userName = "james",
	@userPassword = "james1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CUSTOMER VALUES (@userID, @userName, @userPassword, "james@gmail.com");


SET
	@userType = "contractor",
	@license = 1234,
	@userName = "victor",
	@userPassword = "victor1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @license, @userName, @userPassword, "victor@gmail.com");


SET
	@userType = "contractor",
	@license = 4321,
	@userName = "henry",
	@userPassword = "henry1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @license, @userName, @userPassword, "henry@hotmail.com");


SET
	@userType = "contractor",
	@license = 5678,
	@userName = "john",
	@userPassword = "john1";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @license, @userName, @userPassword, "john@yahoo.com");


SET
	@userType = "contractor",
	@license = 8765,
	@userName = "sarah",
	@userPassword = "sarah";
INSERT INTO USER(userType, userName, userPassword) VALUES (@userType, @userName, @userPassword);
	SET @userID = LAST_INSERT_ID();
INSERT INTO CONTRACTOR VALUES (@userID, @license, @userName, @userPassword, "sarah@gmail.com");

