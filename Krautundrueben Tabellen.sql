


CREATE TABLE KUNDE (
    KUNDENNR        INTEGER NOT NULL,
    NACHNAME        VARCHAR(50),
    VORNAME         VARCHAR(50),
    GEBURTSDATUM	  DATE,
	 STRASSE         VARCHAR(50),
	 HAUSNR			  VARCHAR(6),			
    PLZ             VARCHAR(5),
    ORT             VARCHAR(50),
    TELEFON         VARCHAR(25),
    EMAIL           VARCHAR(50)
    );

CREATE TABLE ZUTAT(
    ZUTATENNR			INTEGER NOT NULL,
    BEZEICHNUNG      VARCHAR(50),
    EINHEIT        	VARCHAR (25),
    NETTOPREIS       DECIMAL(10,2),
    BESTAND          INTEGER,
    LIEFERANT			INTEGER,
	 KALORIEN			INTEGER,
	 KOHLENHYDRATE		DECIMAL (10,2),
	 PROTEIN				DECIMAL(10,2)
);


CREATE TABLE BESTELLUNG (
    BESTELLNR        serial NOT NULL,
    KUNDENNR         INTEGER,
    BESTELLDATUM     DATE,
    RECHNUNGSBETRAG  DECIMAL(10,2),
	rezept_id	integer,
    PRIMARY KEY (BESTELLNR)
);

CREATE TABLE BESTELLUNGZUTAT (
    BESTELLNR       INTEGER NOT NULL,
    ZUTATENNR       INTEGER,
    MENGE     		  INTEGER
);

CREATE TABLE LIEFERANT (
    LIEFERANTENNR   INTEGER NOT NULL,
    LIEFERANTENNAME VARCHAR(50),
    STRASSE         VARCHAR(50),
    HAUSNR			  VARCHAR(6),
    PLZ             VARCHAR(5),
    ORT             VARCHAR(50),
    TELEFON			  VARCHAR(25),
    EMAIL           VARCHAR(50)
);

create table rezepte(
rezept_id int not null,
rezeptname varchar not null,
zutaten_anzahl int not null,
zutaten varchar not null,
constraint rezepte_pk primary key (rezept_id)
);

create table ernaehrungskategorien(
id int not null,
kategorie_name varchar not null,
beschreibung varchar not null,
rezept_id int not null,
constraint ernaehrungskategorien_pk primary key (id)
);

create table  beschraenkungen (
	beschraenkungsnr		integer not null,
	beschraenkung			VARCHAR(50),
	beschreibung			VARCHAR(50),
	rezept_id               int,
	CONSTRAINT beschraenkungen_pk PRIMARY KEY(beschraenkungsnr)
);

create table rezeptzutat(
rezept_id int not null,
zutatennr int not null,
primary key (rezept_id, zutatennr));

/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/


ALTER TABLE ZUTAT ADD PRIMARY KEY (ZUTATENNR);
ALTER TABLE KUNDE ADD PRIMARY KEY (KUNDENNR);
ALTER TABLE LIEFERANT ADD PRIMARY KEY (LIEFERANTENNR);
ALTER TABLE BESTELLUNGZUTAT ADD PRIMARY KEY (BESTELLNR,ZUTATENNR);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE ZUTAT ADD FOREIGN KEY (LIEFERANT) REFERENCES LIEFERANT (LIEFERANTENNR);
ALTER TABLE BESTELLUNGZUTAT ADD FOREIGN KEY (BESTELLNR) REFERENCES BESTELLUNG (BESTELLNR);
ALTER TABLE BESTELLUNG ADD FOREIGN KEY (KUNDENNR) REFERENCES KUNDE (KUNDENNR);
ALTER TABLE BESTELLUNGZUTAT ADD FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR);





























