drop table Sale;
drop table Stock;
drop table Product;
drop table Developer;
--drop table Membership;
drop table Employee;
drop table Branch;
drop table Customer;


CREATE TABLE Branch
(BID	CHAR(8)			NOT NULL,
 Phone	CHAR(10)		NOT NULL,
 Address	VARCHAR(30)		NOT NULL,
 PRIMARY KEY (BID));

CREATE TABLE Employee
(EID	CHAR(8)			NOT NULL,
 Name	VARCHAR(30)		NOT NULL,
 Address	VARCHAR(30)		NOT NULL,
 Phone	CHAR(10)		NOT NULL,
 Wage	  DECIMAL(4,2)	NOT NULL,
 pname	VARCHAR(10)		NOT NULL,
 BID		CHAR(8)		    NOT NULL,
 PRIMARY KEY (EID),
 FOREIGN KEY (BID)
 REFERENCES Branch(BID)
 ON DELETE CASCADE);

CREATE TABLE Developer
(DID	CHAR(8)			NOT NULL,
 Name	VARCHAR(20)		NOT NULL,
 Phone	CHAR(10)		NOT NULL,
 Address	VARCHAR(30)		NOT NULL,
 PRIMARY KEY (DID));

CREATE TABLE Product
(Name	VARCHAR(40)		NOT NULL,
 SKU		CHAR(8)			NOT NULL,
 Price	DECIMAL(4,2)	NOT NULL,
 DID		CHAR(8),
 PRIMARY KEY (SKU),
 FOREIGN KEY (DID)
 REFERENCES Developer(DID)
 ON DELETE SET NULL);

CREATE TABLE Stock
(BID		CHAR(8)	NOT NULL,
 SKU			CHAR(8)	NOT NULL,
 Quantity	INTEGER	NOT NULL,
 maxQuantity INTEGER NOT NULL,
 PRIMARY KEY (BID,SKU),
 FOREIGN KEY (BID)
 REFERENCES Branch(BID)
 ON DELETE CASCADE,
 FOREIGN KEY (SKU)
 REFERENCES Product(SKU)
 ON DELETE CASCADE);

CREATE TABLE Customer
(Name		VARCHAR(20)		NOT NULL,
 CID			CHAR(8)			NOT NULL,
 Phone		CHAR(10)		NOT NULL,
 Address		VARCHAR(30)		NOT NULL,
 PRIMARY KEY (CID),
 UNIQUE(Name, Phone));
/*
CREATE TABLE Membership
(Points		INTEGER(8)		NOT NULL,
 issueDate	DATE			  NOT NULL,
 expireDate	DATE			  NOT NULL,
 CID			CHAR(8)			  NOT NULL,
 PRIMARY KEY (CID),
 FOREIGN KEY (CID)
 REFERENCES Customer(CID)
 ON DELETE CASCADE);
*/
CREATE TABLE Sale
(payment	VARCHAR(20)	NOT NULL,
 snum		CHAR(8)		NOT NULL,
 SKU			CHAR(8)		NOT NULL,
 saleDate	DATE		NOT NULL,
 CID			CHAR(8)		NOT NULL,
 EID			CHAR(8)		NOT NULL,
 PRIMARY KEY (snum),
 FOREIGN KEY (SKU)
 REFERENCES Product(SKU),
 FOREIGN KEY (CID)
 REFERENCES Customer(CID),
 FOREIGN KEY (EID)
 REFERENCES Employee(EID));

INSERT INTO Branch
VALUES ('00000000','0818183306','UBC Village');
INSERT INTO Branch
VALUES ('00000001','6044391705','4700 Kingsway');
INSERT INTO Branch
VALUES ('00000002','6048741080','457 W 8th Ave');
INSERT INTO Branch
VALUES ('00000003','6044739117','4567 Lougheed Hwy');
INSERT INTO Branch
VALUES ('00000004','6042633745','650 W 41st Ave');

INSERT INTO Developer
VALUES ('20000000','Square Enix','8587907529','999 N Sepulveda Blvd');
INSERT INTO Developer
VALUES ('20000001','Starbreeze','7807922681','Regeringsgatan 38, 111 56');
INSERT INTO Developer
VALUES ('20000002','CD Projekt','225196900','Warsaw, Poland');
INSERT INTO Developer
VALUES ('20000003','Electronic Arts','6506281393','209 Redwood Shores Parkway');
INSERT INTO Developer
VALUES ('20000004','Bethesda','3019268300','1370 Piccard Drive');
INSERT INTO Developer
VALUES ('20000005','Volition','0875410487', 'Champaign, Illinois');

INSERT INTO Product
VALUES ('Nier:Automata','10000000',60.00,'20000000');
INSERT INTO Product
VALUES  ('Enclave','10000001',60.00,'20000001');
INSERT INTO Product
VALUES ('The Witcher 3: Wild Hunt','10000002',56.99,'20000002');
INSERT INTO Product
VALUES ('The Sims 4','10000003',29.99,'20000003');
INSERT INTO Product
VALUES ('Fallout 4','10000004',69.99,'20000004');
INSERT INTO Product
VALUES ('Mass Effect:Andromeda', '10000005', 69.99, '20000003');
INSERT INTO Product
VALUES ('Supreme Commander', '10000006', 39.99, '20000000');
INSERT INTO Product
VALUES ('Final Fantasy XV','10000007', 50.00, '20000000');
INSERT INTO Product
VALUES ('Nier:Automata Day One Edition', '10000008', 70.00, '20000000');
INSERT INTO Product
VALUES ('Battlefield 1', '10000009', 70.00, '20000003');
INSERT INTO Product
VALUES ('FIFA 17', '10000010', 60.00, '20000003');
INSERT INTO Product
VALUES ('Titanfall 2', '10000011', 60.00, '20000003');
INSERT INTO Product
VALUES ('Dragon Age', '10000012', 50.00, '20000003');
INSERT INTO Product
VALUES ('Saint Row: The Third', '10000013', 40.00, '20000005');
INSERT INTO Product
VALUES ('Red Faction: Armageddon ', '10000014', 40.00, '20000005');
INSERT INTO Product
VALUES ('Agents of Mayhem', '10000015', 60.00, '20000005');
INSERT INTO Product
VALUES ('The Elder Scrolls V: Skyrim', '10000016', 60.00, '20000004');
INSERT INTO Product
VALUES ('The Darkness', '10000017', 50.00, '20000001');
INSERT INTO Product
VALUES ('Syndicate', '10000018', 50.00, '20000001');
INSERT INTO Product
VALUES ('Payday', '10000019', 50.00, '20000001');

INSERT INTO Stock
VALUES ('00000000','10000000',30, 25);
INSERT INTO Stock
VALUES  ('00000000','10000001',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000002',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000003',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000004',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000005',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000006',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000007',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000008',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000009',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000010',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000011',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000012',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000013',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000014',30, 40);
INSERT INTO Stock
VALUES  ('00000001','10000015',25, 50);
INSERT INTO Stock
VALUES  ('00000000','10000016',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000017',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000018',30, 40);
INSERT INTO Stock
VALUES  ('00000000','10000019',30, 40);
INSERT INTO Stock
VALUES  ('00000001','10000000',30, 50);
INSERT INTO Stock
VALUES  ('00000001','10000001',25, 50);
INSERT INTO Stock
VALUES  ('00000001','10000002',25, 50);
INSERT INTO Stock
VALUES  ('00000001','10000003',25, 50);
INSERT INTO Stock
VALUES  ('00000001','10000004',25, 50);
INSERT INTO Stock
VALUES  ('00000002','10000005',30, 50);
INSERT INTO Stock
VALUES  ('00000002','10000006',30, 50);
INSERT INTO Stock
VALUES  ('00000002','10000007',30, 50);
INSERT INTO Stock
VALUES  ('00000002','10000008',30, 50);
INSERT INTO Stock
VALUES  ('00000002','10000009',30, 50);
INSERT INTO Stock
VALUES  ('00000003','10000000',15, 50);
INSERT INTO Stock
VALUES  ('00000003','10000003',15, 50);
INSERT INTO Stock
VALUES  ('00000004','10000004',15, 50);

INSERT INTO Customer
VALUES('Richard Garza','35553916','6135550169','4213 Roger Street');
INSERT INTO Customer
VALUES('Alice Smith','56989965','6135550152','1887 Tolmie St');
INSERT INTO Customer
VALUES('Marcia Cook','62872157','6135550124','962 Township Rd');
INSERT INTO Customer
VALUES('Bethany Cobb','51193940','6135550150','4829 Victoria Park Ave');
INSERT INTO Customer
VALUES('Kenneth Harris','20318109','6135550144','4870 Vulcan Avenue');

INSERT INTO Employee
VALUES ('30000000','Khada Jhin','4411 Lockhart Drive','7053330413',15.00,'Manager','00000000');
INSERT INTO Employee
VALUES('30000001','Donald J. Trump', 'Wall St.', '0754145463', 13.00, 'Clerk', '00000000');
INSERT INTO Employee
VALUES('30000002','Clinton Densmore','2258 Blanshard','2503803948',10.75,'Clerk','00000000');
INSERT INTO Employee
VALUES('30000003','Royah Taylor', 'Oxford St', '7784561083', 12.00, 'Clerk', '00000000');
INSERT INTO Employee
VALUES('30000004','Cody Newman','12345 Road St. ','7057618267',15.00,'Manager','00000001');
INSERT INTO Employee
VALUES('30000005','Elwood Bunch','4955 Adelaide St','4166875639',11.25,'Clerk','00000001');
INSERT INTO Employee
VALUES('30000006','Cato Fate','Alma 4th Ave', '6047293618', 12.00, 'Clerk', '00000002');
INSERT INTO Employee
VALUES('30000007','Sarah Fortune', 'Bilgewater St', '6059873156', 15.25, 'Manager', '00000002');
INSERT INTO Employee
VALUES('30000008','Jeri Littlefair', 'Kayle St', '7786387413', 12.50, 'Clerk','00000003');
INSERT INTO Employee
VALUES('30000009','Yuki Chalison', 'Abbotte Ave.', '9980086424', 15.60, 'Manager', '00000003');
INSERT INTO Employee
VALUES('30000010','Belle C Kanjone', 'Sricha Drive', '0986414178', 16.00, 'Manager', '00000004');
INSERT INTO Employee
VALUES('30000011','Nick Helcomb', 'Chelsea St', '0873516731', 16.75, 'Clerk', '00000004');

INSERT INTO Sale
VALUES ('CC4485159218538197','30000001','10000000',TO_DATE('20161212','YYYYMMDD'),'35553916','30000000');
INSERT INTO Sale
VALUES ('MP1957141541518947','40000001','10000000',TO_DATE('20161212','YYYYMMDD'),'35553916','30000000');
INSERT INTO Sale
VALUES ('CC5374982696209770','40000002','10000000',TO_DATE('20170109','YYYYMMDD'),'35553916','30000004');
INSERT INTO Sale
VALUES ('MP5374982696209770','40000003','10000001',TO_DATE('20170201','YYYYMMDD'),'56989965','30000006');
INSERT INTO Sale
VALUES ('CC4485185276107583','40000004','10000004',TO_DATE('20170110','YYYYMMDD'),'56989965','30000008');
INSERT INTO Sale
VALUES ('MP5149176309521028','40000005','10000002',TO_DATE('20170125','YYYYMMDD'),'62872157','30000010');
INSERT INTO Sale
VALUES ('CC7193681094324094','40000006','10000003',TO_DATE('20170126','YYYYMMDD'),'62872157','30000000');
INSERT INTO Sale
VALUES ('MP0865310945357144','40000007','10000003',TO_DATE('20170127','YYYYMMDD'),'56989965','30000001');
INSERT INTO Sale
VALUES ('CC8198610502928571','40000008','10000005',TO_DATE('20170127','YYYYMMDD'),'62872157','30000002');
INSERT INTO Sale
VALUES ('CC6719410713157145','40000009','10000006',TO_DATE('20170127','YYYYMMDD'),'56989965','30000003');
INSERT INTO Sale
VALUES ('MP9810749867275911','40000010','10000007',TO_DATE('20170127','YYYYMMDD'),'51193940','30000000');
INSERT INTO Sale
VALUES ('CC5125187584149088','40000011','10000005',TO_DATE('20170127','YYYYMMDD'),'51193940','30000005');
INSERT INTO Sale
VALUES ('MP4156585017561412','40000012','10000006',TO_DATE('20170127','YYYYMMDD'),'62872157','30000007');
INSERT INTO Sale
VALUES ('CC1556510157151141','40000012','10000003',TO_DATE('20170127','YYYYMMDD'),'62872157','30000009');

/*
INSERT INTO Membership
VALUES (0,2014-11-22,2018-12-15,'35553916');
INSERT INTO Membership
VALUES (100,2015-04-04,2017-05-04,'56989965');
INSERT INTO Membership
VALUES (1000,2015-03-12,2017-03-12,'62872157');
INSERT INTO Membership
VALUES (10,2016-07-20,2017-07-20,'51193940');
INSERT INTO Membership
VALUES (240,2017-01-01,2018-01-01,'20318109');
*/





SELECT * FROM Branch;
SELECT * FROM Stock;
SELECT * FROM Product;
Select * FROM Developer;
SELECT * FROM Sale;
--SELECT * FROM Membership;
SELECT * FROM Customer;
SELECT * FROM Employee;