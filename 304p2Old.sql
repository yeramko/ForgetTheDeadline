

drop table Branch;
drop table Employee;
drop table Distributor;
drop table Product;
drop table Stock;
drop table Customer;
drop table Membership;
drop table Sale;

CREATE TABLE Branch
	(BID	CHAR(8)			NOT NULL, 
	Phone	CHAR(10)		NOT NULL,
	Address	VARCHAR(30)		NOT NULL,
	PRIMARY KEY (BID));

CREATE TABLE Employee
	(EID	CHAR(8)			NOT NULL,
	Name	VARCHAR(20)		NOT NULL,
	Address	VARCHAR(30)		NOT NULL,
	Phone	CHAR(10)		NOT NULL,
	Wage	DECIMAL(2,2)	NOT NULL,
	pname	VARCHAR(10)		NOT NULL,
	BID		INTEGER(8)		NOT NULL,
	PRIMARY KEY (EID),
	FOREIGN KEY (BID)
		REFERENCES Branch
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Distributor
	(DID	CHAR(8)			NOT NULL,
	Name	VARCHAR(20)		NOT NULL,
	Address	VARCHAR(30)		NOT NULL,
	Phone	CHAR(10)		NOT NULL,
	PRIMARY KEY (DID));

CREATE TABLE Product
	(Name	VARCHAR(20)		NOT NULL,
	SKU		CHAR(8)			NOT NULL,
	Price	DECIMAL(4,2)	NOT NULL,
	DID		CHAR(8),
	PRIMARY KEY (SKU),
	FOREIGN KEY (DID)
		REFERENCES Distributor
		ON DELETE SET NULL				
		ON UPDATE CASCADE);

CREATE TABLE Stock
	(BID		CHAR(8)	NOT NULL,
	SKU			CHAR(8)	NOT NULL,
	Quantity	INTEGER	NOT NULL,
	maxQuantity INTEGER NOT NULL,		
	PRIMARY KEY (BID,SKU),
	FOREIGN KEY (BID)
		REFERENCES Branch
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (SKU)
		REFERENCES Product
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Customer
	(Name		VARCHAR(20)		NOT NULL,
	CID			CHAR(8)			NOT NULL,
	Phone		CHAR(10)		NOT NULL,
	Address		VARCHAR(30)		NOT NULL,
	PRIMARY KEY (CID),
	UNIQUE(Name, Phone));

CREATE TABLE Membership
	(Points		INTEGER(8)		NOT NULL,
	issueDate	DATE			NOT NULL,
	expireDate	DATE			NOT NULL,
	CID			CHAR(8)			NOT NULL,
	PRIMARY KEY (CID),
	FOREIGN KEY (CID)
		REFERENCES Customer
		ON DELETE CASCADE
		ON UPDATE CASCADE);

CREATE TABLE Sale
	(payment	VARCHAR(20)	NOT NULL,
	snum		CHAR(8)		NOT NULL,	
	SKU			CHAR(8)		NOT NULL,
	saleDate	DATE		NOT NULL,
	CID			CHAR(8)		NOT NULL,
	EID			CHAR(8)		NOT NULL,
	PRIMARY KEY (snum),
	FOREIGN KEY (SKU)
		REFERENCES Product
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (CID)
		REFERENCES Customer
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (EID)
		REFERENCES Employee
		ON DELETE NO ACTION
		ON UPDATE CASCADE);

INSERT INTO Branch
VALUES ('00000000','0818183306','UBC Village'),
('00000001','6044391705','4700 Kingsway'),
('00000002','6048741080','457 W 8th Ave'),
('00000003','6044739117','4567 Lougheed Hwy'),
('00000004','6042633745','650 W 41st Ave');

INSERT INTO Stock
VALUES ('00000000','10000000',10),
('00000001','10000001',25),
('00000002','10000002',30),
('00000003','10000003',15),
('00000004','10000004',5);

INSERT INTO Product
VALUES ('Nier:Automata','10000000',100.00,'20000000'),
('Dead by Daylight','10000001',60.00,'20000001'),
('The Witcher 3: Wild Hunt','10000002',56.99,'20000002'),
('The Sims 4','10000003',29.99,'20000003'),
('Fallout 4','10000004',69.99,'20000004');

INSERT INTO Distributor
VALUES ('20000000','Square Enix','8587907529','999 N Sepulveda Blvd'),
('20000001','Starbreeze','7807922681','Regeringsgatan 38, 111 56'),
('20000002','CD Projekt','225196900','Warsaw, Poland'),
('20000003','Electronic Arts','6506281393','209 Redwood Shores Parkway'),
('20000004','Bethesda','3019268300' ,'1370 Piccard Drive');

INSERT INTO Sale
VALUES ('CC4485159218538197','00000001','10000000',2016-12-12,77953447,'00000000'),
('CC5374982696209770','00000002','10000000',2017-01-09,80734315,'00000001'),
('MP5374982696209770','00000003','10000001',2017-02-01,80734315,'00000002'),
('CC4485185276107583','00000004','10000004',2017-01-10,30678308,'00000003'),
('MP5149176309521028','00000005','10000002',2017-01-25,25076509,'00000004');

INSERT INTO Membership
VALUES (0,2014-11-22,2018-12-15,'35553916'),
(100,2015-04-04,2017-05-04,'56989965'),
(1000,2015-03-12,2017-03-12,'62872157'),
(10,2016-07-20,2017-07-20,'51193940'),
(240,2017-01-01,2018-01-01,'20318109');

INSERT INTO Customer
VALUES('Richard Garza','35553916','6135550169','4213 Roger Street'),
('Alice Smith','56989965','6135550152','1887 Tolmie St'),
('Marcia Cook','62872157','6135550124','962 Township Rd'),
('Bethany Cobb','51193940','6135550150','4829 Victoria Park Ave'),
('Kenneth Harris','20318109','6135550144','4870 Vulcan Avenue');

INSERT INTO Employee
VALUES ('00000000','Khada Jhin','4411 Lockhart Drive','7053330413',15.00,'Manager','00000000'),
('00000001','Cody Newman','12345 Road St. ','7057618267',15.00,'Manager','00000001'),
('00000002','Clinton Densmore','2258 Blanshard','2503803948',10.75,'Clerk','00000000'),
('00000003','Jack Richardson','3394 Rose Street','3065014847',11.50,'Clerk','00000000'),
('00000004','Elwood Bunch','4955 Adelaide St','4166875639',11.25,'Clerk','00000001');


SELECT * FROM Branch;
SELECT * FROM Stock;
SELECT * FROM Product;
SELECT * FROM Rentable;
Select * FROM Distributor;
SELECT * FROM Rental;
SELECT * FROM Sale;
SELECT * FROM Membership;
SELECT * FROM Customer;
SELECT * FROM Employee;
