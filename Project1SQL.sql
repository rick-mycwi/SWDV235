-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2018 at 05:27 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

--SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
--SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
create Database shopshare;
go
--
create procedure InsertContact
@contactEmail nchar(45),
@contactCompany nchar(45),
@contactPerson nchar(45),
@contactNumber nchar(20),
@contactComment nchar(200)
as
INSERT INTO [shopshare].[dbo].[contact]
           ([contactEmail]
           ,[contactCompany]
           ,[contactPerson]
		   ,[contactNumber]
		   ,[contactComment])
     VALUES
           (@contactEmail
           ,@contactCompany
           ,@contactPerson
		   ,@contactNumber
		   ,@contactComment)
GO

create procedure InsertOwnerUpdates
@updatesEmail nchar(45),
@updatesFName nchar(45)
as
INSERT INTO [shopshare].[dbo].[owner_updates]
           ([updatesEmail]
           ,[updatesFName]
           )
     VALUES
           (@updatesEmail
           ,@updatesFName
           )
GO

create procedure InsertRenterUpdates
@updatesEmail nchar(45),
@updatesFName nchar(45)
as
INSERT INTO [shopshare].[dbo].[renter_updates]
           ([updatesEmail]
           ,[updatesFName]
           )
     VALUES
           (@updatesEmail
           ,@updatesFName
           )
GO

execute InsertContact "mickey@clubhouse.com", "Mouse Club", "Mickey Mouse", "123-456-7890", "Insert using SP from SSMS";

select * from contact;
select * from owner_updates;
select * from renter_updates;
-- ------------------------------------------------------
CREATE LOGIN [tester]
with password ='Pa$$w0rd', DEFAULT_DATABASE = [shopshare]
go
CREATE USER [tester]
FOR LOGIN [tester] with default_schema=[dbo]
go
grant execute on InsertContact to tester
grant execute on InsertOwnerUpdates to tester
grant execute on InsertRenterUpdates to tester
--
-- Table structure for table `contact`
--
--DROP Table contact;
CREATE TABLE contact (
  contactEmail varchar(45) NOT NULL,
  contactCompany varchar(45) NOT NULL,
  contactPerson varchar(45) NOT NULL,
  contactNumber varchar(20) NOT NULL,
  contactComment varchar(500) NOT NULL
); --ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO contact (contactID, contactEmail, contactCompany, contactPerson, contactNumber, contactComment, employeeID) VALUES
(1, 'theboss@SPECTRE', 'SPECTRE', 'Ernst Stavro Blofeld', '123-456-7890', 'SPecial Executive for Counterintelligence, Revenge, and Extortion', 1),
(2, 'number2@SPECTRE', 'SPECTRE', 'Emilio Largo', '123-456-7890', 'Pay me one billion cazillion dollars or I will blow up Earth', 1),
(3, 'scientist@SPECTRE', 'SPECTRE', 'Dr. Julius No', '123-456-7890', 'My Gamma Ray will destroy your rockets', 1),
(4, 'extortionist@SPECTRE', 'SPECTRE', 'Dominic Greene', '123-456-7890', 'I control the water supply', 1),
(5, 'assasin@SPECTRE', 'SPECTRE', 'Mr. White', '123-456-7890', 'I will keep all SPECTRE operators in line', 1),
(6, 'theboss@SanMartinique', 'drug dealer', 'Mr. Big', '123-456-7890', 'Free opium for all', 1),
(7, 'theboss@CMG', 'Carver Media Group', 'Elliot Carver', '123-456-7890', 'There is no news like bad news', 1),
(8, 'theboss@Isthmus', 'drug dealer', 'Franz Sanchez', '123-456-7890', '2 million dollars to spring me from prison', 1),
(9, 'general@Russianarmy', 'KGB', 'Georgi Koskov', '123-456-7890', 'I smuggle, deal in arms, and drugs', 1),
(10, 'moneylaundering@SPECTRE', 'SPECTRE', 'LeChiffre', '123-456-7890', 'Your billions are safe with me', 1),
(11, 'theboss@underwaterworld', 'Stromberg Shipping', 'Karl Stromberg', '123-456-7890', 'Under the sea, under the sea', 1),
(12, 'theboss@smuggler', 'Counterfitting and smuggling', 'Kamal Kahn', '123-456-7890', 'I can smuggle the fakes or the real thing', 1),
(13, 'theboss@zorinenterprises', 'Zorin Enterprises', 'Max Zorin', '123-456-7890', 'I will dominate the technology sector', 1),
(14, 'agent@KGB', 'KGB', 'Red Grant', '123-456-7890', 'KGB agent', 1),
(15, 'agent2@KGB', 'KGB', 'Rosa Klebb', '123-456-7890', 'KGB agent with a kick', 1),
(16, 'theboss@Draxindustries', 'Drax Industries', 'Hugo Drax', '123-456-7890', 'I want my space shuttles back', 1),
(17, 'henchwoman@SPECTRE', 'SPECTRE', 'Irma Bunt', '123-456-7890', 'The men follow my orders', 1),
(18, 'theboss@kingindustries', 'King Industries', 'Elektra King', '123-456-7890', 'Its my oil, my company', 1),
(19, 'kidnapper@kingindustries', 'King Industries', 'Renard', '123-456-7890', 'I feel no pain', 1),
(20, 'jaws@killer', 'assasin', 'Jaws', '123-456-7890', 'Wont you come over for a bite?', 1),
(47, 'anotheremail@email.com', 'a company', 'me', '098-765-4321', 'test', 1),
(48, 'email@email.com', 'some company', 'the dude', '098-765-4321', 'test', 1),
(49, 'anemail@email.net', 'a company', 'me', '123-456-7890', 'me', 1),
(50, 'anemail@email.com', 'this', 'me', '123-456-7890', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE employee (
  employeeID int NOT NULL PRIMARY KEY,
  employeeFName varchar(45) NOT NULL,
  employeeLName varchar(45) NOT NULL,
  employeeEmail varchar(45) NOT NULL
) --ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO employee (employeeID, employeeFName, employeeLName, employeeEmail) VALUES
(1, 'Felix', 'Lighter', 'theboss@cia'),
(2, 'Sharky', 'Fisherman', 'thehelp@jamaica'),
(3, 'Quarrel', 'Jr', 'thehelp@SanMartinique'),
(4, 'Vijay', 'Singh', 'tennispro@theclub'),
(5, 'Kamran', 'Shah', 'rebel@afghanistan'),
(6, 'Agent', 'Mathis', 'doubleagent@intelligence'),
(7, 'Luigi', 'Ferrara', 'italian@intelligence'),
(8, 'Colonel', 'Bothryoid', 'Q@MI6'),
(9, 'Gareth', 'Mallory', 'thenewboss@MI6'),
(10, 'JW', 'Pepper', 'sherrif@myparrish'),
(11, 'Milos', 'Columbo', 'smuggler@goodguy'),
(12, 'Mr.', 'Draco', 'future@fatherinlaw'),
(13, 'Valentin', 'Zukovsky', 'ex@KGB'),
(14, 'Jack', 'Wade', 'agent@cia'),
(15, 'Miss', 'Moneypenny', 'executiveassistant@MI6'),
(16, 'Natalya', 'Simonova', 'programmer@goldeneye'),
(17, 'Mary', 'Goodnight', 'fellowagent@MI6'),
(18, 'Lieutenant', 'Hip', 'agent@singaporeintelligence'),
(19, 'Tiger', 'Tanaka', 'theboss@japanintelligence'),
(20, 'Kissy', 'Suzuki', 'agent@japanintelligence');

-- --------------------------------------------------------

--
-- Table structure for table `owner_updates`
--

CREATE TABLE owner_updates (
  updatesEmail varchar(45) NOT NULL,
  updatesFName varchar(45) NOT NULL
)-- ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner_updates`
--

INSERT INTO owner_updates (updatesEmail, updatesFName) VALUES
('anemail@email.com', 'Rick'),
('anotheremail@email.com', 'Bob'),
('email@email.com', 'Bill');

-- --------------------------------------------------------

--
-- Table structure for table `renter_updates`
--

CREATE TABLE renter_updates (
  updatesEmail varchar(45) NOT NULL,
  updatesFName varchar(45) NOT NULL
) --ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `renter_updates`
--

INSERT INTO renter_updates (updatesEmail, updatesFName) VALUES
('agent2@KGB', 'Rosa'),
('agent@KGB', 'Red'),
('anemail@email.com', 'Rick'),
('anotheremail@email.com', 'Bob'),
('assasin@SPECTRE', 'Mr.'),
('email@email.com', 'Bill'),
('extortionist@SPECTRE', 'Dominic'),
('general@Russianarmy', 'Georgi'),
('henchwoman@SPECTRE', 'Irma'),
('jaws@killer', 'Jaws'),
('kidnapper@kingindustries', 'Ernst'),
('moneylaundering@SPECTRE', 'Le'),
('number2@SPECTRE', 'Emilio'),
('ron@hp.com', 'Ron'),
('scientist@SPECTRE', 'Dr'),
('theboss@CMG', 'Elliot'),
('theboss@Draxindustries', 'Hugo'),
('theboss@Isthmus', 'Franz'),
('theboss@kingindustries', 'Elektra'),
('theboss@SanMartinique', 'Mr.'),
('theboss@smuggler', 'Kamal'),
('theboss@SPECTRE', 'Ernst'),
('theboss@underwaterworld', 'Karl'),
('theboss@zorinenterprises', 'Max');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`

ALTER TABLE contact
  ADD PRIMARY KEY (contactID);
  ADD UNIQUE KEY contactEmail (contactEmail),
  ADD KEY employeeID (employeeID);

--
-- Indexes for table `employee`
--
ALTER TABLE employee
  ADD PRIMARY KEY (employeeID);

--
-- Indexes for table `owner_updates`
--
ALTER TABLE owner_updates
  ADD PRIMARY KEY (updatesEmail),
  ADD UNIQUE KEY updatesEmail (updatesEmail);

--
-- Indexes for table `renter_updates`
--
ALTER TABLE renter_updates
  ADD PRIMARY KEY (updatesEmail),
  ADD UNIQUE KEY updatesEmail (updatesEmail);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE contact
  MODIFY contactID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE employee
  MODIFY employeeID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE contact
  ADD CONSTRAINT contact_ibfk_1 FOREIGN KEY (employeeID) REFERENCES employee (employeeID);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
