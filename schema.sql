DROP TABLE IF EXISTS Payment           CASCADE;
DROP TABLE IF EXISTS PrivateSession    CASCADE;
DROP TABLE IF EXISTS ClassRegistration CASCADE;
DROP TABLE IF EXISTS ClassSchedule     CASCADE;
DROP TABLE IF EXISTS HealthMetric      CASCADE;
DROP TABLE IF EXISTS Equipment         CASCADE;
DROP TABLE IF EXISTS Room              CASCADE;
DROP TABLE IF EXISTS AdministrativeStaff CASCADE;
DROP TABLE IF EXISTS Trainer           CASCADE;
DROP TABLE IF EXISTS Member            CASCADE;

----------
-- MEMBER
----------
CREATE TABLE Member (
    MemberID      SERIAL PRIMARY KEY,
    FirstName     VARCHAR(255) NOT NULL,
    LastName      VARCHAR(255) NOT NULL,
    Email         VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber   VARCHAR(20) UNIQUE,
    DateOfBirth   DATE,
    Gender        VARCHAR(20)
);

-----------
-- TRAINER
-----------
CREATE TABLE Trainer (
    TrainerID       SERIAL PRIMARY KEY,
    FirstName       VARCHAR(255) NOT NULL,
    LastName        VARCHAR(255) NOT NULL,
    Email           VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber     VARCHAR(20),
    Specialization  VARCHAR(255),
    IsActive        BOOLEAN NOT NULL DEFAULT TRUE
);

------------------------
-- ADMINISTRATIVE STAFF
------------------------
CREATE TABLE AdministrativeStaff (
    StaffID     SERIAL PRIMARY KEY,
    FirstName   VARCHAR(255) NOT NULL,
    LastName    VARCHAR(255) NOT NULL,
    Email       VARCHAR(255) NOT NULL UNIQUE,
    Password    VARCHAR(255) NOT NULL
);

--------
-- ROOM
--------
CREATE TABLE Room (
    RoomID      SERIAL PRIMARY KEY,
    RoomName    VARCHAR(255) NOT NULL,
    Capacity    INT NOT NULL
);

-------------
-- EQUIPMENT
-------------
CREATE TABLE Equipment (
    EquipmentID      SERIAL PRIMARY KEY,
    RoomID           INT REFERENCES Room(RoomID),
    Name             VARCHAR(255) NOT NULL,
    Status           VARCHAR(50) NOT NULL,   -- e.g. 'OK', 'UnderMaintenance'
    LastServicedDate DATE
);

------------------
-- HEALTH METRICS
------------------
CREATE TABLE HealthMetric (
    MetricID      SERIAL PRIMARY KEY,
    MemberID      INT NOT NULL REFERENCES Member(MemberID) ON DELETE CASCADE,
    RecordedAt    TIMESTAMP NOT NULL DEFAULT NOW(),
    Weight        NUMERIC(5,2),
    Height        NUMERIC(5,2),
    TargetWeight  NUMERIC(5,2),
    HeartRate     INT
);

----------------------------------
-- CLASS SCHEDULE (GROUP CLASSES)
----------------------------------
CREATE TABLE ClassSchedule (
    ClassID      SERIAL PRIMARY KEY,
    ClassName    VARCHAR(255) NOT NULL,
    TrainerID    INT NOT NULL REFERENCES Trainer(TrainerID),
    RoomID       INT NOT NULL REFERENCES Room(RoomID),
    DayOfWeek    VARCHAR(20) NOT NULL,
    StartTime    TIME NOT NULL,
    Duration     INT NOT NULL,      
    MaxCapacity  INT                
);

---------------------------------------
-- CLASS REGISTRATION (MEMBER ↔ CLASS)
----------------------------------------
CREATE TABLE ClassRegistration (
    RegistrationID   SERIAL PRIMARY KEY,
    MemberID         INT NOT NULL REFERENCES Member(MemberID) ON DELETE CASCADE,
    ClassID          INT NOT NULL REFERENCES ClassSchedule(ClassID) ON DELETE CASCADE,
    DateRegistration DATE NOT NULL DEFAULT CURRENT_DATE
);

-------------------------------------------
-- PRIVATE SESSION (1-ON-1 MEMBER–TRAINER)
-------------------------------------------
CREATE TABLE PrivateSession (
    SessionID    SERIAL PRIMARY KEY,
    MemberID     INT NOT NULL REFERENCES Member(MemberID) ON DELETE CASCADE,
    TrainerID    INT NOT NULL REFERENCES Trainer(TrainerID) ON DELETE CASCADE,
    RoomID       INT NOT NULL REFERENCES Room(RoomID),
    SessionDate  DATE NOT NULL,
    SessionTime  TIME NOT NULL,
    ActivityType VARCHAR(255) NOT NULL,
    IsConflict   BOOLEAN NOT NULL DEFAULT FALSE
);

--------------------------------
-- PAYMENT (FOR BILLING / FEES)
---------------------------------
CREATE TABLE Payment (
    PaymentID   SERIAL PRIMARY KEY,
    MemberID    INT NOT NULL REFERENCES Member(MemberID) ON DELETE CASCADE,
    StaffID     INT REFERENCES AdministrativeStaff(StaffID),
    Amount      NUMERIC(10,2) NOT NULL,
    PaymentDate DATE NOT NULL DEFAULT CURRENT_DATE,
    PaymentType VARCHAR(50),    
    Notes       TEXT
);
