DROP DATABASE IF EXISTS MusicDB;
CREATE DATABASE MusicDB;
USE MusicDB;


/* entity sets */

CREATE TABLE Musician (
id CHAR(5), 
name VARCHAR(20),
Bdate DATE , 
oCountry VARCHAR(20),
PRIMARY KEY(id) 
);

CREATE TABLE  Track (
tid CHAR(5),
name VARCHAR(20),
Tdate DATE,
songwriter VARCHAR(20),
PRIMARY KEY (tid)
);

CREATE TABLE genre(
tid CHAR(5),
genre VARCHAR(20),
PRIMARY KEY (tid, genre),
FOREIGN KEY (tid) REFERENCES Track (tid)
);

CREATE TABLE Albums (
title VARCHAR (20),
name VARCHAR(20),
Rdate DATE,
genre VARCHAR(20),
PRIMARY KEY (title)
);

CREATE TABLE Songwriter(
Sname VARCHAR(20),
Dateborn DATE,
DateDied DATE,
genre VARCHAR(20),
PRIMARY KEY (Sname)
);

CREATE TABLE StreamingPlatforms (
name VARCHAR(20),
live CHAR(1),
recorded CHAR(1),
PRIMARY KEY (name)
);

CREATE TABLE Listeners(
id CHAR(7),
username VARCHAR(20),
Bdate DATE,
oCountry VARCHAR(20),
PRIMARY KEY (id)
);

CREATE TABLE Playlists(
title VARCHAR(20),
creator VARCHAR(20),
minutes  TINYINT,
seconds TINYINT,
genre VARCHAR (20),
PRIMARY KEY (title)
);


/* relationship sets */

CREATE TABLE RecordLabelSigns (
Cname VARCHAR(20),
duration DATE,
contract VARCHAR(20),
signedDate DATE,
mid CHAR(5),
PRIMARY KEY (Cname),
FOREIGN KEY (mid) REFERENCES Musician (id)
);

CREATE TABLE Creates(
mid CHAR(5),
tid VARCHAR(20),
PRIMARY KEY (mid, tid),
FOREIGN KEY (mid) REFERENCES Musician (id),
FOREIGN KEY (tid) REFERENCES Track (tid)
);

CREATE TABLE Appear (
tid VARCHAR(20),
Atitle VARCHAR(20),
PRIMARY KEY (tid, Atitle),
FOREIGN KEY (tid) REFERENCES Track (tid),
FOREIGN KEY (Atitle) REFERENCES Albums (title)
);

CREATE TABLE Composed(
Sname VARCHAR(20),
tid VARCHAR(20),
PRIMARY KEY (Sname, tid),
FOREIGN KEY (Sname) REFERENCES Songwriter(Sname),
FOREIGN KEY (tid) REFERENCES Track(tid)
);

CREATE TABLE PlayedIn(
tid VARCHAR(20),
SPname VARCHAR(20),
PRIMARY KEY (tid, SPname),
FOREIGN KEY (tid) REFERENCES Track (tid),
FOREIGN KEY (SPname) REFERENCES StreamingPlatforms (name)
);

CREATE TABLE PlayedBy(
Atitle VARCHAR(20),
lid CHAR(7),
PRIMARY KEY (Atitle, lid),
FOREIGN KEY (Atitle) REFERENCES Albums (title),
FOREIGN KEY (lid)  REFERENCES Listeners (id)
);

CREATE TABLE Curates(
SPname VARCHAR(20),
Ptitle VARCHAR(20),
PRIMARY KEY (SPname, Ptitle),
FOREIGN KEY (SPname) REFERENCES StreamingPlatforms (name),
FOREIGN KEY (Ptitle) REFERENCES Playlists (title)
);

/* Album Data */

INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('All Eyes on Me', 'Tupac', '1996-02-13', 'Rap');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('All I Want Is You', 'Miguel', '2010-11-30', 'R&B/Soul');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Dale', 'Pitbull', '2015-07-17', 'Pop');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Damn', 'Kendrick Lamar', '2017-04-14', 'Hip-Hop/Rap');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Doggystyle', 'Snoop Dog', '1993-11-23', 'Rap');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('DS2', 'Future', '2015-07-17', 'Rap');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Kamikaze', 'Eminem', '2018-08-31', 'Rap');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Laundry Service', 'Shakira', '2001-11-13', 'Pop');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Lemonade', 'Beyonce', '2016-04-23', 'R&B');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Savage mode', '21 Savage', '2016-07-15', 'Rap');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Take Care', 'Drake', '2011-11-15', 'Hip-Hop');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Talk That Talk', 'Rihanna', '2011-11-18', 'Pop');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Thank u, next', 'Ariana Grande', '2019-02-08', 'Pop');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('The Blueprint 3', 'Jay-Z', '2009-09-08', 'Hip-Hop');
INSERT INTO `MusicDB`.`Albums` (`title`, `name`, `Rdate`, `genre`) VALUES ('Too Hard', 'Lil Baby', '2017-12-01', 'Hip-Hop/Rap');

/* Track Data */

INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('1', 'One Dance', '2016-04-16', 'Aubrey Graham');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('10', 'Waka Waka', '2010-05-07', 'John Hill');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('11', 'Close Friends', '2019-02-02', 'Dominique Jones');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('12', 'Dear Mama', '1995-02-21', 'Tupac Shakur');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('13', 'Sexual Eruption', '2007-11-20', 'Calvin Broadus');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('14', 'Humble', '2017-03-30', 'Kendrick Duckworth');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('15', 'Gasolina', '2004-10-16', 'Ramon Ayala');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('2', 'Mask Off', '2017-04-18', 'Nayvadius Wilburn');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('3', 'Just like Magic', '2020-10-30', 'Robert Taylor');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('4', 'Run the world', '2011-04-21', 'Beyonce Knowles');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('5', 'A lot', '2019-01-08', 'DJ Dahi');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('6', 'Umbrella', '2007-05-26', 'Christopher Stewart');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('7', 'River', '2017-06-25', 'Ed Sheeran');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('8', 'Empire State of mind', '2016-10-20', 'Angela Hunte');
INSERT INTO `MusicDB`.`Track` (`tid`, `name`, `Tdate`, `songwriter`) VALUES ('9', 'Sky Walker', '2017-08-25', 'Miguel Pimentel');

/* Musician Data */

INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('01', 'Drake', '1978-01-22', 'Canada');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('010', 'Shakira', '1977-02-02', 'Columbia');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('011', 'Lil Baby', '1995-11-25', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('012', 'Tupac', '1971-06-16', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('013', 'Snoop Dog', '1971-10-20', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('014', 'Kendrick Lamar', '1987-06-17', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('015', 'Pitbull', '1981-01-15', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('02', 'Future', '1980-04-15', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('03', 'Ariana Grande', '1986-04-16', 'Europe');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('04', 'Beyonce', '1973-07-30', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('05', '21 Savage', '1988-07-28', 'United Kingdom');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('06', 'Rihanna', '1988-09-14', 'Barbados');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('07', 'Eminem', '1968-09-12', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('08', 'Jay-Z', '1969-03-21', 'USA');
INSERT INTO `MusicDB`.`Musician` (`id`, `name`, `Bdate`, `oCountry`) VALUES ('09', 'Miguel', '1972-10-31', 'USA');

/* Listeners Data */

INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000001', 'Asusan', '1974-04-03', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000002', 'Icaraway', '1999-01-03', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000003', 'JPayne', '1992-08-17', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000004', 'Brandon', '1995-11-27', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000005', 'DFairley', '1996-10-17', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000006', 'JBullock', '1997-08-13', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000007', 'NMontalban', '1994-07-09', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000008', 'TStevens', '1996-09-13', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000009', 'SMickey', '1991-07-14', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000010', 'Asusan', '1974-04-03', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000011', 'Headen', '1993-09-23', 'USA');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000012', 'Ajohnson', '1974-04-03', 'Europe');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000013', 'TBryant', '1983-08-28', 'Jamaica');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000014', 'WSanders', '1999-12-27', 'Brazil');
INSERT INTO `MusicDB`.`Listeners` (`id`, `username`, `Bdate`, `oCountry`) VALUES ('1000015', 'MAntonio', '1982-06-15', 'Mexico');

/* Playlists Data */

INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Aesthetic', 'Headen', '91', '48', 'Hip-Hop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Airplane mode', 'Asusan', '60', '27', 'Pop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Calm before storm', 'JPayne', '80', '15', 'Pop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Chill', 'NMontalban', '92', '1', 'R&B');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Christmas', 'Ajohnson', '82', '58', 'Pop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Country', 'Asusan', '79', '22', 'Country');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Driving', 'Icaraway', '120', '52', 'Rap');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Funny', 'TBryant', '40', '42', 'Country');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Indie', 'TStevens', '95', '52', 'Pop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Party', 'WSanders', '104', '31', 'Hip-Hop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Pregame', 'Brandon', '30', '21', 'R&B');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Rap', 'MAntonio', '72', '40', 'Pop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Sad', 'JBullock', '100', '38', 'Pop');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Sleep', 'SMickey', '69', '37', 'R&B');
INSERT INTO `MusicDB`.`Playlists` (`title`, `creator`, `minutes`, `seconds`, `genre`) VALUES ('Smell like grass', 'DFairley', '90', '39', 'Hip-Hop');

/* Songwriter Data */

INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Angela Hunte', '1975-01-22', 'Hip-Hop');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Aubrey Graham', '1986-10-24', 'Pop');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Beyonce Knowles', '1981-09-04', 'R&B');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Calvin Broadus', '1971-10-20', 'Rap');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Christopher Stewart', '1974-01-04', 'Pop');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('DJ Dahi', '1983-03-10', 'Rap');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Dominique Jones', '1994-12-03', 'Hip-Hop/Rap');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Ed Sheeran', '1991-02-17', 'Rap');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('John Hill', '1972-10-24', 'Pop');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Kendrick Duckworth', '1987-06-17', 'Hip-Hop/Rap');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Miguel Pimentel', '1985-10-23', 'R&B/Soul');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Nayvadius Wilburn', '1983-11-20', 'Rap');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Ramon Ayala', '1945-12-08', 'Pop');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `DateDied`, `genre`) VALUES ('Robert Taylor', '1978-10-24', '2019-07-28', 'Pop');
INSERT INTO `MusicDB`.`Songwriter` (`Sname`, `Dateborn`, `genre`) VALUES ('Tupac Shakur', '1971-06-16', 'Rap');

/* StreamingPlatforms Data */

INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('AccuRadio', 'N', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Amazon Music', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Apple', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Google Play', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Jango', 'Y', 'N');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('LineMusic', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Livestrem', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Mixcloud', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Pandora', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Primephonic', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('SiriusXM', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Soundcloud', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Spotify', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Twitch', 'Y', 'Y');
INSERT INTO `MusicDB`.`StreamingPlatforms` (`name`, `live`, `recorded`) VALUES ('Youtube', 'Y', 'Y');

/* RecordLabelSigns Data */

insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Capitol Music', '3', '2 Albums', '2013-03-27', '01');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Freebandz', '5', '4 Albums', '2011-03-22', '02');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Republic Records', '5', '4 Albums', '2011-07-22', '03');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Sony Music', '6', '5 Albums', '2015-02-15', '04');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Epic Records', '4', '3 Albums', '2015-05-19', '05');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Def Jam', '4', '3 Albums', '2003-02-14', '06');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Warner music', '6', '5 Albums', '2004-11-18', '07');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Roc Nation', '5', '4 Albums', '2008-04-24', '08');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('RCA Records', '4', '3 Albums', '2005-07-13', '09');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Sony', '2', '2 Albums', '2014-06-03', '010');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Young Stoner Life', '7', '4 Albums', '2016-01-25', '011');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Universal', '6', '2 Albums', '1999-03-27', '012');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('Death Row', '5', '3 Albums', '1983-03-27', '013');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('PGLang', '6', '3 Albums', '2012-06-18', '014');
insert into RecordLabelSigns (Cname, duration, contract, signedDate, mid) values ('RCA ', '5', '4 Albums', '2003-04-16', '015');

/* Appear Data */

INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('1', 'Take Care');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('10', 'Laundry Service');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('11', 'Too Hard');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('12', 'All Eyes on Me');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('13', 'Doggystyle');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('14', 'Damn');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('15', 'Dale');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('2', 'DS2');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('3', 'Thank u, next');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('4', 'Lemonade');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('5', 'Savage mode');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('6', 'Talk That Talk');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('7', 'Kamikaze');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('8', 'The Blueprint 3');
INSERT INTO `MusicDB`.`Appear` (`tid`, `Atitle`) VALUES ('9', 'All I Want Is You');

/* Composed Data */

INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Aubrey Graham', '1');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('John Hill', '10');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Dominique Jones', '11');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Tupac Shakur', '12');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Calvin Broadus', '13');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Kendrick Duckworth', '14');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Ramon Ayala', '15');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Nayvadius Wilburn', '2');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Robert Taylor', '3');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Beyonce Knowles', '4');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('DJ Dahi', '5');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Christopher Stewart', '6');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Ed Sheeran', '7');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Angela Hunte', '8');
INSERT INTO `MusicDB`.`Composed` (`Sname`, `tid`) VALUES ('Miguel Pimentel', '9');

/* Creates Data */

INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('01', '1');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('010', '10');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('011', '11');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('012', '12');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('013', '13');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('014', '14');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('015', '15');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('02', '2');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('03', '3');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('04', '4');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('05', '5');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('06', '6');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('07', '7');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('08', '8');
INSERT INTO `MusicDB`.`Creates` (`mid`, `tid`) VALUES ('09', '9');

/* Curates Data */

INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('AccuRadio', 'Aesthetic');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Amazon Music', 'Airplane mode');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Apple', 'Calm before storm');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Google Play', 'Chill');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Jango', 'Christmas');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('LineMusic', 'Country');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Livestrem', 'Driving');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Mixcloud', 'Funny');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Pandora', 'Indie');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Primephonic', 'Party');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('SiriusXM', 'Pregame');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Soundcloud', 'Rap');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Spotify', 'Sad');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Twitch', 'Sleep');
INSERT INTO `MusicDB`.`Curates` (`SPname`, `Ptitle`) VALUES ('Youtube', 'Smell like grass');

/* genre Data */

INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('1', 'Hip-Hop');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('10', 'Pop');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('11', 'Hip-Hop/Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('12', 'Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('13', 'Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('14', 'Hip-Hop/Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('15', 'Pop');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('2', 'Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('3', 'Pop');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('4', 'R&B');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('5', 'Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('6', 'Pop');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('7', 'Rap');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('8', 'Hip-Hop');
INSERT INTO `MusicDB`.`genre` (`tid`, `genre`) VALUES ('9', 'R&B/Soul');

/* PlayedBy Data */

INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('All Eyes on Me', '1000001');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('All I Want Is You', '1000002');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Dale', '1000003');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Damn', '1000004');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Doggystyle', '1000005');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('DS2', '1000006');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Kamikaze', '1000007');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Laundry Service', '1000008');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Lemonade', '1000009');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Savage mode', '1000010');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Take Care', '1000011');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Talk That Talk', '1000012');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Thank u, next', '1000013');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('The Blueprint 3', '1000014');
INSERT INTO `MusicDB`.`PlayedBy` (`Atitle`, `lid`) VALUES ('Too Hard', '1000015');

/* PlayedIn Data */

INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('1', 'AccuRadio');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('10', 'Amazon Music');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('11', 'Apple');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('12', 'Google Play');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('13', 'Jango');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('14', 'LineMusic');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('15', 'Livestrem');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('2', 'Mixcloud');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('3', 'Pandora');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('4', 'Primephonic');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('5', 'SiriusXM');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('6', 'Soundcloud');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('7', 'Spotify');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('8', 'Twitch');
INSERT INTO `MusicDB`.`PlayedIn` (`tid`, `SPname`) VALUES ('9', 'Youtube');




