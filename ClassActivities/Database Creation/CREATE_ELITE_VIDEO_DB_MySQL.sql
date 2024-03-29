Create Database EliteVideo;

Use EliteVideo;


CREATE TABLE PRICE (
PRICE_CODE			NUMERIC(2,0) PRIMARY KEY,
PRICE_DESCRIPTION	VARCHAR(20)  NOT NULL  ,
PRICE_RENTFEE		NUMERIC(5,2) CHECK (PRICE_RENTFEE >= 0),
PRICE_DAILYLATEFEE	NUMERIC(5,2) CHECK (PRICE_DAILYLATEFEE >= 0)
);

CREATE TABLE MOVIE (
MOVIE_NUM	NUMERIC(8,0) PRIMARY KEY,
MOVIE_TITLE	VARCHAR(75) NOT NULL,
MOVIE_YEAR	NUMERIC(4,0)  CHECK (MOVIE_YEAR > 1900),
MOVIE_COST	NUMERIC(5,2),
MOVIE_GENRE	VARCHAR(50),
PRICE_CODE	NUMERIC(2,0) REFERENCES PRICE(PRICE_CODE)
);

CREATE TABLE VIDEO (
VID_NUM		NUMERIC(8,0) PRIMARY KEY,
VID_INDATE	DATE,
MOVIE_NUM	NUMERIC(8,0) REFERENCES MOVIE(MOVIE_NUM)
);

CREATE TABLE MEMBERSHIP (
MEM_NUM		NUMERIC(8,0) PRIMARY KEY,
MEM_FNAME	VARCHAR(30) NOT NULL,
MEM_LNAME	VARCHAR(30) NOT NULL,
MEM_STREET	VARCHAR(120),
MEM_CITY	VARCHAR(50),
MEM_STATE	CHAR(2),
MEM_ZIP		CHAR(5),
MEM_BALANCE	NUMERIC(10,2)
);

CREATE TABLE RENTAL (
RENT_NUM	NUMERIC(8,0) PRIMARY KEY,
RENT_DATE	timestamp DEFAULT current_timestamp,
MEM_NUM		NUMERIC(8,0) REFERENCES MEMBERSHIP(MEM_NUM)
);

CREATE TABLE DETAILRENTAL (
RENT_NUM			NUMERIC(8,0),
VID_NUM				NUMERIC(8,0),
DETAIL_FEE			NUMERIC(5,2),
DETAIL_DUEDATE		DATE,
DETAIL_RETURNDATE	DATE,
DETAIL_DAILYLATEFEE	NUMERIC(5,2),
CONSTRAINT PK_DetailRental PRIMARY KEY(RENT_NUM, VID_NUM),
CONSTRAINT FK_DetailRental_Rental FOREIGN KEY(RENT_NUM) REFERENCES RENTAL(RENT_NUM),
CONSTRAINT FK_DetailRental_Video FOREIGN KEY(vid_num) REFERENCES VIDEO(vid_num)
);



INSERT INTO PRICE VALUES (1, 'Standard', 2, 1);
INSERT INTO PRICE VALUES (2, 'New Release', 3.5, 3);
INSERT INTO PRICE VALUES (3, 'Discount', 1.5, 1);
INSERT INTO PRICE VALUES (4, 'Weekly Special', 1, .5);


INSERT INTO MOVIE VALUES (1234, 'The Cesar Family Christmas', 2011, 39.95, 'FAMILY', 2);
INSERT INTO MOVIE VALUES (1235, 'Smokey Mountain Wildlife', 2008, 59.95, 'ACTION', 1);
INSERT INTO MOVIE VALUES (1236, 'Richard Goodhope', 2012, 59.95, 'DRAMA', 2);
INSERT INTO MOVIE VALUES (1237, 'Beatnik Fever', 2011, 29.95, 'COMEDY', 2);
INSERT INTO MOVIE VALUES (1238, 'Constant Companion', 2012, 89.95, 'DRAMA', NULL);
INSERT INTO MOVIE VALUES (1239, 'Where Hope Dies', 2002, 25.49, 'DRAMA', 3);
INSERT INTO MOVIE VALUES (1245, 'Time to Burn', 2009, 45.49, 'ACTION', 1);
INSERT INTO MOVIE VALUES (1246, 'What He Doesnt Know', 2010, 58.29, 'COMEDY', 1);

INSERT INTO VIDEO VALUES (34341,  '2011-01-22', 1235);
INSERT INTO VIDEO VALUES (34342,  '2011-01-22', 1235);
INSERT INTO VIDEO VALUES (34366,  '2013-03-02', 1236);
INSERT INTO VIDEO VALUES (34367,  '2013-03-02', 1236);
INSERT INTO VIDEO VALUES (34368,  '2013-03-02', 1236);
INSERT INTO VIDEO VALUES (34369,  '2013-03-02', 1236);
INSERT INTO VIDEO VALUES (44392,  '2012-11-21', 1237);
INSERT INTO VIDEO VALUES (44397,  '2012-11-21', 1237);
INSERT INTO VIDEO VALUES (54321,  '2012-06-18', 1234);
INSERT INTO VIDEO VALUES (54324,  '2012-06-18', 1234);
INSERT INTO VIDEO VALUES (54325,  '2012-06-18', 1234);
INSERT INTO VIDEO VALUES (59237,  '2013-02-14', 1237);
INSERT INTO VIDEO VALUES (61353,  '2010-01-28', 1245);
INSERT INTO VIDEO VALUES (61354,  '2010-01-28', 1245);
INSERT INTO VIDEO VALUES (61367,  '2012-07-30', 1246);
INSERT INTO VIDEO VALUES (61369,  '2012-07-30', 1246);
INSERT INTO VIDEO VALUES (61388,  '2011-01-25', 1239);


INSERT INTO MEMBERSHIP VALUES (102, 'TAMI', 'DAWSON', '2632 TAKLI CIRCLE', 'NORENE', 'TN', '37136', 11);
INSERT INTO MEMBERSHIP VALUES (103, 'CURT', 'KNIGHT', '4025 CORNELL COURT', 'FLATGAP', 'KY', '41219', 6);
INSERT INTO MEMBERSHIP VALUES (104, 'JAMAL', 'MELENDEZ', '788 EAST 145TH AVENUE', 'QUEBECK', 'TN', '38579', 0);
INSERT INTO MEMBERSHIP VALUES (105, 'IVA', 'MCCLAIN', '6045 MUSKET BALL CIRCLE', 'SUMMIT', 'KY', '42783', 15);
INSERT INTO MEMBERSHIP VALUES (106, 'MIRANDA', 'PARKS', '4469 MAXWELL PLACE', 'GERMANTOWN', 'TN', '38183', 0);
INSERT INTO MEMBERSHIP VALUES (107, 'ROSARIO', 'ELLIOTT', '7578 DANNER AVENUE', 'COLUMBIA', 'TN', '38402', 5);
INSERT INTO MEMBERSHIP VALUES (108, 'MATTIE', 'GUY', '4390 EVERGREEN STREET', 'LILY', 'KY', '40740', 0);
INSERT INTO MEMBERSHIP VALUES (109, 'CLINT', 'OCHOA', '1711 ELM STREET', 'GREENEVILLE', 'TN', '37745', 10);
INSERT INTO MEMBERSHIP VALUES (110, 'LEWIS', 'ROSALES', '4524 SOUTHWIND CIRCLE', 'COUNCE', 'TN', '38326', 0);
INSERT INTO MEMBERSHIP VALUES (111, 'STACY', 'MANN', '2789 EAST COOK AVENUE', 'MURFREESBORO', 'TN', '37132', 8);
INSERT INTO MEMBERSHIP VALUES (112, 'LUIS', 'TRUJILLO', '7267 MELVIN AVENUE', 'HEISKELL', 'TN', '37754', 3);
INSERT INTO MEMBERSHIP VALUES (113, 'MINNIE', 'GONZALES', '6430 VASILI DRIVE', 'WILLISTON', 'TN', '38076', 0);


INSERT INTO RENTAL VALUES (1001, '2013-03-01', 103);
INSERT INTO RENTAL VALUES (1002, '2013-03-01', 105);
INSERT INTO RENTAL VALUES (1003, '2013-03-02', 102);
INSERT INTO RENTAL VALUES (1004, '2013-03-02', 110);
INSERT INTO RENTAL VALUES (1005, '2013-03-02', 111);
INSERT INTO RENTAL VALUES (1006, '2013-03-02', 107);
INSERT INTO RENTAL VALUES (1007, '2013-03-02', 104);
INSERT INTO RENTAL VALUES (1008, '2013-03-03', 105);
INSERT INTO RENTAL VALUES (1009, '2013-03-03', 111);


INSERT INTO DETAILRENTAL VALUES (1001, 34342, 2, '2013-03-04', '2013-03-02', NULL);
INSERT INTO DETAILRENTAL VALUES (1001, 34366, 3.5, '2013-03-04', '2013-03-02', 3);
INSERT INTO DETAILRENTAL VALUES (1001, 61353, 2, '2013-03-04', '2013-03-03', 1);
INSERT INTO DETAILRENTAL VALUES (1002, 59237, 3.5, '2013-03-04', '2013-03-04', 3);
INSERT INTO DETAILRENTAL VALUES (1003, 54325, 3.5, '2013-03-04', '2013-03-09', 3);
INSERT INTO DETAILRENTAL VALUES (1003, 61369, 2, '2013-03-06', '2013-03-09', 1);
INSERT INTO DETAILRENTAL VALUES (1003, 61388, 0, '2013-03-06', '2013-03-09', 1);
INSERT INTO DETAILRENTAL VALUES (1004, 34341, 2, '2013-03-07', '2013-03-07', 1);
INSERT INTO DETAILRENTAL VALUES (1004, 34367, 3.5, '2013-03-05', '2013-03-07', 3);
INSERT INTO DETAILRENTAL VALUES (1004, 44392, 3.5, '2013-03-05', '2013-03-07', 3);
INSERT INTO DETAILRENTAL VALUES (1005, 34342, 2, '2013-03-07', '2013-03-05', 1);
INSERT INTO DETAILRENTAL VALUES (1005, 44397, 3.5, '2013-03-05', '2013-03-05', 3);
INSERT INTO DETAILRENTAL VALUES (1006, 34366, 3.5, '2013-03-05', '2013-03-04', 3);
INSERT INTO DETAILRENTAL VALUES (1006, 61367, 2, '2013-03-07', NULL, 1);
INSERT INTO DETAILRENTAL VALUES (1007, 34368, 3.5, '2013-03-05', NULL, 3);
INSERT INTO DETAILRENTAL VALUES (1008, 34369, 3.5, '2013-03-05', '2013-03-05', 3);
INSERT INTO DETAILRENTAL VALUES (1009, 54324, 3.5, '2013-03-05', NULL, 3);
