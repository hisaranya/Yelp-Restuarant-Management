CREATE TABLE Cuisine
(
CuisineID INT,
CuisineName VARCHAR(40) NOT NULL,
PRIMARY KEY(CuisineID)
); 

CREATE TABLE City
(
CityID INT,
CityName VARCHAR(40) NOT NULL,
PRIMARY KEY(CityID)
); 


CREATE TABLE Restaurant
(
RID INT,
RName VARCHAR(50) NOT NULL,
URL VARCHAR(200),
Street VARCHAR(50) NOT NULL,
City INT NOT NULL,
Zipcode VARCHAR(6) NOT NULL,
Info VARCHAR(200),  
OpenHrs VARCHAR(5),
CloseHrs VARCHAR(5),
WiFi VARCHAR(1),
PRIMARY KEY(RID),
FOREIGN KEY(Zone) REFERENCES Zone(ZoneID),
FOREIGN KEY(City) REFERENCES City(CityID)
);


CREATE TABLE RestPhone
(
RID INT,
Phone INT,
FOREIGN KEY(RID) REFERENCES Restaurant(RID),
CONSTRAINT RestPhoneKey PRIMARY KEY(RID,Phone)
); 

CREATE TABLE RestType
(
RID INT,
Type INT,
CONSTRAINT RestTypeKey PRIMARY KEY(RID,Type),
FOREIGN KEY(RID) REFERENCES Restaurant(RID)
);  


CREATE TABLE UserAccount
(
UserID VARCHAR(40) NOT NULL,
Password VARCHAR(40) NOT NULL,
FName VARCHAR(40) NOT NULL,
LName VARCHAR(40) NOT NULL,
Street VARCHAR(50),
City INT,
Zipcode VARCHAR(6),
Email VARCHAR(40),
Gender VARCHAR(10),
DOB DATE,
UserLevel VARCHAR(20),
UserSince DATE NOT NULL,
PRIMARY KEY(UserID),
FOREIGN KEY(Zone) REFERENCES Zone(ZoneID),
FOREIGN KEY(City) REFERENCES City(CityID)
);  

CREATE TABLE UserPhone
(
UserID INT,
Phone VARCHAR(15),
FOREIGN KEY(UserID) REFERENCES UserAccount(UserID),
CONSTRAINT UserPhoneKey PRIMARY KEY(UserID,Phone)
);  

CREATE TABLE UserActivity
(
ActivityID INT,
UserID INT,
FOREIGN KEY(UserID) REFERENCES UserAccount(UserID),
PRIMARY KEY(ActivityID,UserID)
);  


CREATE TABLE UserActivityURL
(
UserID INT,
ActivityID INT,
URL VARCHAR(200),
FOREIGN KEY(UserID, ActivityID) REFERENCES UserActivity(UserID, ActivityID),
CONSTRAINT UserActivityURLKey PRIMARY KEY(URL,UserID, ActivityID)
);  

CREATE TABLE Dish
(
DishID INT,
CuisineID INT,
DishName VARCHAR(40) NOT NULL,
TotalRatings INT,
TotalRaters INT,
PRIMARY KEY(DishID),
FOREIGN KEY(CuisineID) REFERENCES Cuisine(CuisineID)
);

CREATE TABLE Review
(
ReviewID INT,
UserID INT,
RID INT,
Content VARCHAR(500),
ReviewDate DATE,
Upvotes INT,
Downvotes INT,
CONSTRAINT ReviewKey PRIMARY KEY(ReviewID,UserID,RID),
FOREIGN KEY(UserID) REFERENCES UserAccount(UserID),
FOREIGN KEY(RID) REFERENCES Restaurant(RID)
);  

CREATE TABLE Features
(
RID INT,
CuisineID INT,
FOREIGN KEY(RID) REFERENCES Restaurant(RID),
FOREIGN KEY(CuisineID) REFERENCES Cuisine(CuisineID),
CONSTRAINT FeatKey PRIMARY KEY(RID,CuisineID)
);  

CREATE TABLE FavC
(
UserID INT,
CuisineID INT,
FOREIGN KEY(UserID) REFERENCES UserAccount(UserID),
FOREIGN KEY(CuisineID) REFERENCES Cuisine(CuisineID),
CONSTRAINT FavCKey PRIMARY KEY(UserID,CuisineID)
);  


CREATE TABLE FavR
(
UserID INT,
RID INT,
FOREIGN KEY(UserID) REFERENCES UserAccount(UserID),
FOREIGN KEY(RID) REFERENCES Restaurant(RID),
CONSTRAINT FavRKey PRIMARY KEY(UserID,RID)
); 


CREATE TABLE Rates
(
RatingID INT ,
UserID INT,
RID INT,
Rating INT,
FOREIGN KEY(UserID) REFERENCES UserAccount(UserID),
FOREIGN KEY(RID) REFERENCES Restaurant(RID),
CONSTRAINT RatesKey PRIMARY KEY(RatingID,UserID,RID)
);  