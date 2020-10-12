CREATE TABLE t_uzivatel (
	ID INT NOT NULL,
	email VARCHAR(255) NOT NULL,
	meno VARCHAR(255),
	priezvisko VARCHAR(255),
	role_ID INT NOT NULL,

	PRIMARY KEY (ID)
);

CREATE TABLE t_rezervacia (
	ID NOT NULL,
	typ_ID INT NOT NULL,
	cena INT NOT NULL,
	stav_ID NOT NULL,
	majitel_ID INT NOT NULL,

	PRIMARY KEY (ID),
	FOREIGN KEY (majitel_ID) REFERENCES t_uzivatel(ID)
);

CREATE TABLE t_festival (
	nazov_a_rocnik VARCHAR(255) NOT NULL,
	zaciatok DATE NOT NULL,
	koniec DATE NOT NULL,
	miesto VARCHAR(255) NOT NULL,
	kapacita INT NOT NULL,

	PRIMARY KEY (nazov_a_rocnik)
);

CREATE TABLE t_stage (
	nazov VARCHAR(255) NOT NULL,
	plocha INT NOT NULL,
	festival_ID VARCHAR(255) NOT NULL,

	PRIMARY KEY (nazov),
	FOREIGN KEY (festival_ID) REFERENCES t_festival(nazov_a_rocnik)
);

CREATE TABLE t_interpret (
	ID INT NOT NULL,
	nazov VARCHAR(255) NOT NULL,
	datum_vzniku DATE NOT NULL,
	clenovia TEXT,
	ALBUMY TEXT,

	PRIMARY KEY (ID)
);

CREATE TABLE r_rezervacia_na (
	ID_rezervacie INT NOT NULL,
	ID_uzivatela INT NOT NULL,

	FOREIGN KEY (ID_rezervacie) REFERENCES t_rezervacia(ID),
	FOREIGN KEY (ID_uzivatela) REFERENCES t_uzivatel(ID)
);

CREATE TABLE r_vystupuje_na (
	ID_stage VARCHAR(255) NOT NULL,
	ID_interpreta INT NOT NULL,
	zaciatok DATETIME NOT NULL,
	koniec DATETIME NOT NULL,

	FOREIGN KEY (ID_stage) REFERENCES t_stage(nazov),
	FOREIGN KEY (ID_interpreta) REFERENCES t_interpret(ID)
);
