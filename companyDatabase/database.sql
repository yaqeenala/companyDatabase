use Query1

CREATE TABLE Department (
    DNUM       INT PRIMARY KEY,
    DName      VARCHAR(100) NOT NULL,
    ManagerSSN INT NOT NULL,
    HireDate   DATE,
    FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN)
)

CREATE TABLE Employee (
    SSN         INT PRIMARY KEY,
    Fname       VARCHAR(50) NOT NULL,
    Lname       VARCHAR(50) NOT NULL,
    Gender      CHAR(1),
    Super_ID    INT,  
    BirthDate   DATE,
    DNUM        INT NOT NULL,  
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (Super_ID) REFERENCES Employee(SSN)
)

CREATE TABLE Department_Locations (
    DNUM     INT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    PRIMARY KEY (DNUM, Location),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
)

CREATE TABLE Project (
    PNUM     INT PRIMARY KEY,
    PName    VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    City     VARCHAR(100),
    DNUM     INT NOT NULL,  
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
)

CREATE TABLE Works_On (
    SSN        INT NOT NULL,
    PNUM       INT NOT NULL,
    Hours      DECIMAL(5,2),
    PRIMARY KEY (SSN, PNUM),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNUM) REFERENCES Project(PNUM)
)

CREATE TABLE Dependent (
    SSN            INT NOT NULL,
    DependentName  VARCHAR(100) NOT NULL,
    Gender         CHAR(1),
    BirthDate      DATE,
    PRIMARY KEY (SSN, DependentName),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
)
