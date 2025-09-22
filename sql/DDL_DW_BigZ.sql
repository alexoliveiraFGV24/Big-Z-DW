CREATE TABLE DateDimension
(
  DateComplete DATE NOT NULL,
  WeekDay INT NOT NULL,
  MonthDay INT NOT NULL,
  Month INT NOT NULL,
  Trimester INT NOT NULL,
  Year INT NOT NULL,
  CalendarKey INT NOT NULL,
  PRIMARY KEY (CalendarKey)
);

CREATE TABLE OrderClerkDimension
(
  ClerkSurrogateKey VARCHAR(300) NOT NULL,
  ClerkName VARCHAR(255) NOT NULL,
  ClerkTitle INT NOT NULL,
  ClerkEduLevel INT NOT NULL,
  ClerkHiringYear INT NOT NULL,
  ClerkID INT NOT NULL,
  PRIMARY KEY (ClerkSurrogateKey)
);

CREATE TABLE ClientDimension
(
  ClientSurrogateKey VARCHAR(300) NOT NULL,
  ClientName VARCHAR(255) NOT NULL,
  ClientType INT NOT NULL,
  ClientZIP VARCHAR(11) NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (ClientSurrogateKey)
);

CREATE TABLE DepotDimension
(
  DepotSurrogateKey VARCHAR(300) NOT NULL,
  DepotSize FLOAT NOT NULL,
  DepotZIP VARCHAR(14) NOT NULL,
  DepotID INT NOT NULL,
  PRIMARY KEY (DepotSurrogateKey)
);

CREATE TABLE ProductDimension
(
  ProductSurrogateKey VARCHAR(300) NOT NULL,
  ProductName VARCHAR(255) NOT NULL,
  ProductType INT(255) NOT NULL,
  SupplierName VARCHAR(255) NOT NULL,
  ProductPrice FLOAT NOT NULL,
  ProductID INT NOT NULL,
  DepotSurrogateKey VARCHAR(300) NOT NULL,
  PRIMARY KEY (ProductSurrogateKey),
  FOREIGN KEY (DepotSurrogateKey) REFERENCES DepotDimension(DepotSurrogateKey)
);

CREATE TABLE OrderFact
(
  OrderID INT NOT NULL,
  OrderQtd INT NOT NULL,
  OrderTotal INT NOT NULL,
  OrderHour DATE NOT NULL,
  CalendarKey INT NOT NULL,
  ClerkSurrogateKey INT NOT NULL,
  ClientSurrogateKey INT NOT NULL,
  ProductSurrogateKey INT NOT NULL,
  PRIMARY KEY (OrderID, CalendarKey, ClerkSurrogateKey, ClientSurrogateKey, ProductSurrogateKey),
  FOREIGN KEY (CalendarKey) REFERENCES DateDimension(CalendarKey),
  FOREIGN KEY (ClerkSurrogateKey) REFERENCES OrderClerkDimension(ClerkSurrogateKey),
  FOREIGN KEY (ClientSurrogateKey) REFERENCES ClientDimension(ClientSurrogateKey),
  FOREIGN KEY (ProductSurrogateKey) REFERENCES ProductDimension(ProductSurrogateKey)
);