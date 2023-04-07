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


