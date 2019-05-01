DROP TABLE VEHICLE;
DROP TABLE PAYMENT;
DROP TABLE REQUEST;
DROP TABLE PAST_TRANSACTION;
DROP TABLE CUSTOMER;
DROP TABLE ACCOUNT;
DROP TABLE WORK;
DROP TABLE CONTRACTOR;
DROP TABLE USER;

CREATE TABLE USER (
	userID			INTEGER				AUTO_INCREMENT,
	userType		VARCHAR(100)		NOT NULL,
	userName		VARCHAR(100)		NOT NULL,
	userPassword	VARCHAR(200)		NOT NULL,
	CONSTRAINT user_pk PRIMARY KEY (userID),
	CONSTRAINT user_ck1 UNIQUE (userName)
);

CREATE TABLE CUSTOMER (
	userID			INTEGER				NOT NULL,
	name			VARCHAR(500)		NOT NULL,
	userName		VARCHAR(50)			NOT NULL,
    userPassword	VARCHAR(200)		NOT NULL,
	email			VARCHAR(200)		NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (userID),
	CONSTRAINT customer_ck1 UNIQUE (userName),
	CONSTRAINT customer_ck2 UNIQUE (email)
);

CREATE TABLE CONTRACTOR (
	userID			INTEGER				NOT NULL,
	name			VARCHAR(500)		NOT NULL,
	license			INTEGER				NOT NULL,
	userName		VARCHAR(50)			NOT NULL,
    userPassword	VARCHAR(200)		NOT NULL,
	email			VARCHAR(200)		NOT NULL,
    CONSTRAINT contrator_pk PRIMARY KEY (userID),
	CONSTRAINT contractor_ck1 UNIQUE (license),
	CONSTRAINT contractor_ck2 UNIQUE (userName),
	CONSTRAINT contractor_ck3 UNIQUE (email)
);

CREATE TABLE VEHICLE (
	regNo			VARCHAR(300)		NOT NULL,
	make			VARCHAR(300)		NOT NULL,
	model			VARCHAR(300)		NOT NULL,
	color			VARCHAR(100)		NOT NULL,
	userID			INTEGER				NOT NULL,
	CONSTRAINT vehicle_pk PRIMARY KEY (regNo),
	CONSTRAINT vehicle_fk FOREIGN KEY (userID) REFERENCES CUSTOMER (userID)
);

CREATE TABLE PAYMENT (
	cardHolder		VARCHAR(300)		NOT NULL,
	cardNo			DECIMAL(16)			NOT NULL,
	expMonth		INTEGER				NOT NULL,
	expYear			INTEGER				NOT NULL,
	cvv				INTEGER				NOT NULL,
	userID			INTEGER				NOT NULL,
	CONSTRAINT payment_pk PRIMARY KEY (cardNo),
	CONSTRAINT payment_fk FOREIGN KEY (userID) REFERENCES CUSTOMER (userID)
);

CREATE TABLE ACCOUNT (
	accID			INTEGER				AUTO_INCREMENT,
	accName			VARCHAR(300)		NOT NULL,
	accNo			INTEGER				NOT NULL,
	bsb				INTEGER				NOT NULL,
	userID			INTEGER				NOT NULL,
	CONSTRAINT account_pk	PRIMARY KEY (accID),
	CONSTRAINT account_fk	FOREIGN KEY (userID) REFERENCES CONTRACTOR (userID)
);

CREATE TABLE REQUEST (
	requestID		INTEGER				AUTO_INCREMENT,
	category		VARCHAR(100)		NOT NULL,
	description		VARCHAR(1000)		NOT NULL,
	userID			INTEGER				NOT NULL,
	CONSTRAINT request_pk PRIMARY KEY (requestID),
	CONSTRAINT request_fk FOREIGN KEY (userID) REFERENCES CUSTOMER (userID)
);

CREATE TABLE PAST_TRANSACTION (
	transID			INTEGER				AUTO_INCREMENT,
	cost			DECIMAL(10,2)		NOT NULL,
	contractor		VARCHAR(300)		NOT NULL,
	review			VARCHAR(1000)		NULL,
	rating 			DECIMAL(2,1)		NULL,
	userID			INTEGER				NOT NULL,
	CONSTRAINT transaction_pk PRIMARY KEY (transID),
	CONSTRAINT transaction_fk FOREIGN KEY (userID) REFERENCES CUSTOMER (userID)
);

CREATE TABLE WORK (
	workID			INTEGER				AUTO_INCREMENT,
	distance 		DECIMAL(10,1)		NOT NULL,
	customer		VARCHAR(300)		NOT NULL,
	issue			VARCHAR(200)		NOT NULL,
	userID			INTEGER				NOT NULL,
	CONSTRAINT work_pk PRIMARY KEY (workID),
	CONSTRAINT work_fk	FOREIGN KEY (userID) REFERENCES CONTRACTOR (userID)
);
/*
-Remove cardHolder in table Payment
Register:
Sign up as Customer: get the field id => insert into User table
with userType="customer"
=>also need to insert into customer table
Sign up as Contractor: similar, userType="contractor"
=>also need to insert into contractor table
*/