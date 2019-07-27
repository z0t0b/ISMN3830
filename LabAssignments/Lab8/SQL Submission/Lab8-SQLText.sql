/*
	Auburn Username: zeb0007																		
*/

/*****   Case Question D SQL Query ******************************************************/

SELECT * FROM CUSTOMER, SEMINAR, CONTACT, INVOICE, LINE_ITEM, PRODUCT;


/*****   Case Question E   ******************************************************/

SELECT	LastName, FirstName, Phone	
FROM	CUSTOMER
WHERE	City = "Dallas";


/*****   Case Question F   ******************************************************/

SELECT	LastName, FirstName, Phone	
FROM	CUSTOMER
WHERE	City = "Dallas" AND LastName LIKE 'T%';


/*****   Case Question G   ******************************************************/
use hsd;
-- Two table solution -  starting with LINE_ITEM

SELECT	InvoiceNumber
FROM	LINE_ITEM
WHERE	ProductNumber in
		(SELECT ProductNumber
		 FROM	PRODUCT
		 WHERE	PRODUCT.ProductDescription=
				'Heather Sweeney Seminar Live in Dallas on 25-OCT-15');


/*****   Case Question H   ******************************************************/
-- Two table solution 

SELECT		LI.InvoiceNumber
FROM		LINE_ITEM AS LI 
	JOIN PRODUCT AS P
		ON		LI.ProductNumber = P.ProductNumber
WHERE		P.ProductDescription = 'Heather Sweeney Seminar Live in Dallas on 25-OCT-15';


/*****   Case Question I   ******************************************************/

SELECT DISTINCT FirstName, LastName, Phone
FROM CUSTOMER AS C
	JOIN SEMINAR_CUSTOMER AS SC
		 ON C.CustomerID = SC.CustomerID
	JOIN SEMINAR AS S
         ON SC.SeminarID = S.SeminarID
WHERE S.SeminarTitle = "Kitchen on a Big D Budget";

	
/*****   Case Question J   ******************************************************/

SELECT 		DISTINCT FirstName, LastName, Phone,
			P.ProductNumber, P.ProductDescription
FROM 		CUSTOMER AS C 
	JOIN INVOICE AS I
		ON	C.CustomerID = I.CustomerID
	JOIN LINE_ITEM AS LI
		ON 	I.InvoiceNumber = LI.InvoiceNumber
	JOIN PRODUCT AS P
		ON	LI.ProductNumber = P.ProductNumber
WHERE		P.ProductNumber LIKE 'VK%'
ORDER BY	LastName DESC, FirstName DESC, ProductNumber DESC;


/*****   Case Question M   ******************************************************/
/* note: MySQL open parenethesis must come directly after SUM function */

SELECT		SUM(SubTotal) AS SumOfSubTotal
FROM		INVOICE;


/*****   Case Question N   ******************************************************/

SELECT		AVG(SubTotal) AS AvgOfSubTotal
FROM		INVOICE;


/*****   Case Question O   ******************************************************/

SELECT		SUM(SubTotal) AS SumOfSubTotal,
			AVG(SubTotal) AS AverageOfSubTotal
FROM		INVOICE;

