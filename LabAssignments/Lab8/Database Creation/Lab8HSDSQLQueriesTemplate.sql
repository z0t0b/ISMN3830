/*
	Auburn Username:

	Example: rjd0037																		
*/

/*****   Case Question D SQL Query ******************************************************/

SELECT * FROM CUSTOMER;

-- COMPLETE FOR REST OF HSD TABLES



/*****   Case Question E   ******************************************************/

SELECT		
FROM		
WHERE		

/*****   Case Question F   ******************************************************/

SELECT		
FROM		
WHERE		
	AND		

/*****   Case Question G   ******************************************************/

-- Two table solution -  starting with LINE_ITEM
-- COMPLETE THE SQL QUERY

SELECT	
FROM	
WHERE	 in
		(SELECT ProductNumber
		 FROM	PRODUCT
		 WHERE	PRODUCT.ProductDescription=
				'Heather Sweeney Seminar Live in Dallas on 25-OCT-15');



/*****   Case Question H   ******************************************************/

-- Two table solution 
-- COMPLETE THE SQL QUERY

SELECT		LI.InvoiceNumber
FROM		 AS LI 
	JOIN  AS P
		ON		LI.ProductNumber = P.ProductNumber
WHERE		P.ProductDescription = 'Heather Sweeney Seminar Live in Dallas on 25-OCT-15';



/*****   Case Question I   ******************************************************/

-- WRITE/COMPLETE THE FULL SQL QUERY

	
/*****   Case Question J   ******************************************************/
-- COMPLETE THE SQL QUERY

SELECT		DISTINCT FirstName, LastName, Phone,
			P.ProductNumber, P.ProductDescription
FROM		 AS C 
	JOIN  AS I
		ON		
	JOIN	 AS LI
		ON 	
	JOIN	 AS P
		ON		
WHERE		P.ProductNumber LIKE 'VK%'
ORDER BY	LastName DESC, FirstName DESC, ProductNumber DESC;



/*****   Case Question M   ******************************************************/
/* note: MySQL open parenethesis must come directly after SUM function */
-- COMPLETE THE SQL QUERY

SELECT		
FROM		

/*****   Case Question N   ******************************************************/
-- COMPLETE THE SQL QUERY

SELECT		
FROM		

/*****   Case Question O   ******************************************************/
-- COMPLETE THE SQL QUERY

SELECT		SUM() AS SumOfSubTotal,
			AVG() AS AverageOfSubTotal
FROM		

