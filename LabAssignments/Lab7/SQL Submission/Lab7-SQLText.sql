/*
	Name: Zachary Eli Bedsole
    Auburn Username: zeb0007
    Class: ISMN-3830
    Assignment: Lab7
    Date: 7/16/19
*/

/*****   Create HSD Database   ******************************************************/
CREATE DATABASE HSD;

/*****   Create SEMINAR Table   ******************************************************/
CREATE TABLE SEMINAR
(
  SeminarTime INT NOT NULL,
  SeminarDate INT NOT NULL,
  Location INT NOT NULL,
  SeminarID INT NOT NULL,
  SeminarTitle INT NOT NULL,
  PRIMARY KEY (SeminarID)
);

/*****   Create CUSTOMER Table   ******************************************************/
CREATE TABLE CUSTOMER
(
  State INT NOT NULL,
  EncryptedPassword INT NOT NULL,
  City INT NOT NULL,
  EmailAddress INT NOT NULL,
  LastName INT NOT NULL,
  CustomerID INT NOT NULL,
  StreetAddress INT NOT NULL,
  ZIP INT NOT NULL,
  FirstName INT NOT NULL,
  Phone INT NOT NULL,
  PRIMARY KEY (CustomerID)
);

/*****   Create PRODUCT Table   ******************************************************/
CREATE TABLE PRODUCT
(
  ProductDescription INT NOT NULL,
  QuantityOnHand INT NOT NULL,
  ProductType INT NOT NULL,
  ProductNumber INT NOT NULL,
  UnitPrice INT NOT NULL,
  PRIMARY KEY (ProductNumber)
);

/*****   Create SEMINAR_CUSTOMER Table   ******************************************************/
CREATE TABLE SEMINAR_CUSTOMER
(
  SeminarID INT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (SeminarID, CustomerID),
  FOREIGN KEY (SeminarID) REFERENCES SEMINAR(SeminarID),
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

/*****   Create INVOICE Table   ******************************************************/
CREATE TABLE INVOICE
(
  Subtotal INT NOT NULL,
  InvoiceNumber INT NOT NULL,
  Shipping INT NOT NULL,
  PaymentType INT NOT NULL,
  InvoiceDate INT NOT NULL,
  Tax INT NOT NULL,
  Total INT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (InvoiceNumber),
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

/*****   Create LINE_ITEM Table   ******************************************************/
CREATE TABLE LINE_ITEM
(
  UnitPrice INT NOT NULL,
  LineNumber INT NOT NULL,
  Quantity INT NOT NULL,
  Total INT NOT NULL,
  InvoiceNumber INT NOT NULL,
  ProductNumber INT NOT NULL,
  PRIMARY KEY (LineNumber, InvoiceNumber),
  FOREIGN KEY (InvoiceNumber) REFERENCES INVOICE(InvoiceNumber),
  FOREIGN KEY (ProductNumber) REFERENCES PRODUCT(ProductNumber)
);

/*****   Create CONTACT Table   ******************************************************/
CREATE TABLE CONTACT
(
  ContactNumber INT NOT NULL,
  ContactDate INT NOT NULL,
  ContactType INT NOT NULL,
  SeminarID INT,
  CustomerID INT NOT NULL,
  PRIMARY KEY (ContactNumber, CustomerID),
  FOREIGN KEY (SeminarID) REFERENCES SEMINAR(SeminarID),
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);