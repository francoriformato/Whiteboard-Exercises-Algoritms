-- PARTE 0: CREAZIONE UTENTI (Utenti LoSfizioDB.sql)

alter session set "_ORACLE_SCRIPT"=true;  

-- Creazione Utenti e Password --

create user db_LoSfizio identified by admin;

create user Proprietario identified by leader;

create user cassiere1 identified by acpi1;

create user cassiere2 identified by uefi;

create user cassiere3 identified by kexts;

create user cassiere4 identified by gpt;

grant all privileges to db_LoSfizio;

grant all privileges to Proprietario;

grant connect to db_LoSfizio;

grant connect to Proprietario;

grant connect to cassiere1;

grant connect to cassiere2;

grant connect to cassiere3;

grant connect to cassiere4;


-- Creazione ruolo: cashier --

create role cashier;

grant all on TAVOLO to cashier;

grant all on ORDINE to cashier;

grant all on CONTO to cashier;

grant all on CONTIENE to cashier;

grant all on CLIENTEPRENOTANTE to cashier;


-- Utilizzo ruolo cashier --

grant cashier to cassiere1;

grant cashier to cassiere2;

grant cashier to cassiere3;

grant cashier to cassiere4;



-- PARTE 1: RIPULITURA E CREAZIONE (Creazione LoSfizioDB.sql) --

drop table TAVOLO cascade constraints;
drop table ORDINE cascade constraints;
drop table CONTO cascade constraints;
drop table PRODOTTIINVENDITA cascade constraints;
drop table CONTIENE cascade constraints;
drop table CLIENTEPRENOTANTE cascade constraints;
drop table DIPENDENTE cascade constraints;
drop table TURNO cascade constraints;
drop table SALA cascade constraints;
drop table SERVE cascade constraints;
drop table PERMESSO cascade constraints;
drop table QUALIFICA cascade constraints;

ALTER SESSION SET nls_date_format='DD-MON-YYYY HH24:MI';

create table TAVOLO (
NumTavolo      		 NUMBER(2,0)   	PRIMARY KEY,
NumMaxPartecipanti  	 NUMBER(2,0)  	NOT NULL,
Luogo  			 VARCHAR(15)   	NOT NULL   	check (Luogo in ('Esterno','Interno'))
);


create table ORDINE (
NumTavolo		NUMBER(2,0),
DataOraOrdine		DATE   		DEFAULT SYSDATE,
Costo			NUMBER(3,0)	DEFAULT 0,
CONSTRAINT FKOrdine foreign key (NumTavolo) references TAVOLO(NumTavolo) ON DELETE CASCADE,
CONSTRAINT PKOrdine primary key (DataOraOrdine, NumTavolo)
);


create table CONTO (
NumFattura		VARCHAR(15)	PRIMARY KEY,
NumTavolo		NUMBER(2,0)   	NOT NULL,
DataOraOrdine   	DATE		NOT NULL,
MetodoPagamento		VARCHAR(15) 	NOT NULL   	check (MetodoPagamento in ('Contanti','Bancomat')),
CONSTRAINT FKConto1 foreign key (NumTavolo) references TAVOLO(NumTavolo) ON DELETE CASCADE,
CONSTRAINT FKConto2 foreign key (DataOraOrdine, NumTavolo) references ORDINE(DataOraOrdine, NumTavolo) ON DELETE CASCADE,
CONSTRAINT UniConto UNIQUE(NumTavolo,DataOraOrdine)
);


create table PRODOTTIINVENDITA (
IdentificativoProdotto	VARCHAR(15)	PRIMARY KEY,
NomeProd		VARCHAR(35)	NOT NULL,
CostoUnitario		NUMBER(3,0)	NOT NULL,
TipologiaProd		VARCHAR(20) 	NOT NULL 	check (TipologiaProd in ('Antipasto', 'Primo', 'Secondo', 'Dolce', 'Vino Bianco', 'Vino Rosso', 'Bevanda')),
ABaseDi			VARCHAR(15)
);


create table CONTIENE (
NumTavolo		NUMBER(2,0),
DataOraOrdine		DATE,
IdentificativoProdotto	VARCHAR(15),
Quantita		NUMBER(3,0)	DEFAULT 1,
CONSTRAINT FKContiene1 foreign key (NumTavolo) references TAVOLO(NumTavolo) ON DELETE CASCADE,
CONSTRAINT FKContiene2 foreign key (DataOraOrdine, NumTavolo) references ORDINE(DataOraOrdine, NumTavolo) ON DELETE CASCADE,
CONSTRAINT PKContiene primary key (NumTavolo, DataOraOrdine, IdentificativoProdotto)
);


create table CLIENTEPRENOTANTE (
Contatto		VARCHAR(30)	PRIMARY KEY,
SceltaLuogo		VARCHAR(15)	check (SceltaLuogo in ('Esterno', 'Interno')),
NumeroPartecipanti	NUMBER(2,0)	NOT NULL,
NumTavoloAssegnato	NUMBER(2,0),
DataOraAssegnati	DATE,
CONSTRAINT FKCliente1 foreign key (NumTavoloAssegnato) references TAVOLO(NumTavolo) ON DELETE SET NULL,
CONSTRAINT FKCliente2 foreign key (DataOraAssegnati, NumTavoloAssegnato) references ORDINE(DataOraOrdine, NumTavolo) ON DELETE CASCADE
);


create table DIPENDENTE (
CartellinoDipendente	VARCHAR(15)	PRIMARY KEY,
NomeDip			VARCHAR(15)	NOT NULL,
CognomeDip		VARCHAR(15)	NOT NULL,
ContattoDip		VARCHAR(30)	NOT NULL,
DataAssunzione		DATE		NOT NULL,
DataNascita		DATE		NOT NULL,
Ruolo			VARCHAR(15) 	NOT NULL 	check (Ruolo in ('Cameriere','Cuoco'))
);


create table TURNO (
CartellinoDipendente	VARCHAR(15),
DataOraTurno		DATE,
OreTurno		NUMBER(2,0)	NOT NULL,
Timbrato		VARCHAR(4)	NOT NULL  	check (Timbrato in ('Si','No')),
CONSTRAINT FKTurno1 foreign key (CartellinoDipendente) references DIPENDENTE(CartellinoDipendente) ON DELETE CASCADE,
CONSTRAINT PKTurno primary key (DataOraTurno, CartellinoDipendente)
);


create table SALA (
NumSala			NUMBER(1,0)	PRIMARY KEY 	check (NumSala BETWEEN 1 and 3),
NPrimoTav		NUMBER(2,0)	NOT NULL,
NUltimoTav		NUMBER(2,0)	NOT NULL,
Fumatori		VARCHAR(4)			check (Fumatori in ('Si','No'))
);


create table SERVE (
CartellinoDipendente	VARCHAR(15),
DataOraTurno		DATE,
NumSala			NUMBER(1,0),
CONSTRAINT FKServe1 foreign key (CartellinoDipendente) references DIPENDENTE(CartellinoDipendente) ON DELETE CASCADE,
CONSTRAINT FKServe2 foreign key (DataOraTurno, CartellinoDipendente) references TURNO(DataOraTurno, CartellinoDipendente) ON DELETE CASCADE,
CONSTRAINT FKServe3 foreign key (NumSala) references SALA(NumSala) ON DELETE CASCADE,
CONSTRAINT PKServe primary key (CartellinoDipendente, DataOraTurno, NumSala)
);


create table PERMESSO (
CartellinoDipendente 	VARCHAR(15),
DataOraPermesso 	DATE,
Motivazione 		VARCHAR(20)	NOT NULL 	check (Motivazione in ('Salute','Personale')),
CONSTRAINT FKPermesso1 foreign key (CartellinoDipendente) references DIPENDENTE(CartellinoDipendente) ON DELETE CASCADE,
CONSTRAINT PKPermesso primary key (CartellinoDipendente, DataOraPermesso)
);


create table QUALIFICA (
CodiceAttestato		VARCHAR(15)	PRIMARY KEY,
CartellinoDipendente	VARCHAR(15),
TitoloAttestato		VARCHAR(40)	NOT NULL,
CONSTRAINT FKQualifica1 foreign key (CartellinoDipendente) references DIPENDENTE(CartellinoDipendente) ON DELETE CASCADE
);




-- PARTE 2: POPOLAMENTO DI BASE (Popolamento LoSfizioDB.sql) --


ALTER SESSION SET nls_date_format='DD-MON-YYYY HH24:MI';

ALTER SESSION SET nls_date_language = ITALIAN;


--- Popolamento TAVOLO ---
insert into TAVOLO values (0, 99, 'Interno');

insert into TAVOLO values (1, 4, 'Esterno');

insert into TAVOLO values (2, 2, 'Esterno');

insert into TAVOLO values (3, 2, 'Esterno');

insert into TAVOLO values (4, 4, 'Esterno');

insert into TAVOLO values (5, 4, 'Interno');

insert into TAVOLO values (6, 10, 'Interno');

insert into TAVOLO values (7, 6, 'Interno');

insert into TAVOLO values (8, 4, 'Interno');

insert into TAVOLO values (9, 10, 'Esterno');

insert into TAVOLO values (10, 4, 'Esterno');



-- Popolamento ORDINE --
insert into ORDINE values (2, TO_DATE('01-SET-2020 19:00'), 100);

insert into ORDINE values (1, TO_DATE('01-SET-2020 19:30'), 50);

insert into ORDINE values (3, TO_DATE('01-SET-2020 19:45'), 80);

insert into ORDINE values (4, TO_DATE('01-SET-2020 20:10'), 90);

insert into ORDINE values (1, TO_DATE('01-SET-2020 20:30'), 30);

insert into ORDINE values (3, TO_DATE('01-SET-2020 21:00'), 20);

insert into ORDINE values (1, TO_DATE('01-SET-2020 21:25'), 60);

insert into ORDINE values (5, TO_DATE('01-SET-2020 21:33'), 70);

insert into ORDINE values (0, TO_DATE('01-SET-2020 19:05'), 30);

insert into ORDINE values (0, TO_DATE('01-SET-2020 19:07'), 40);

insert into ORDINE values (0, TO_DATE('01-SET-2020 19:37'), 60);

insert into ORDINE values (0, TO_DATE('01-SET-2020 19:46'), 70);

insert into ORDINE values (0, TO_DATE('01-SET-2020 20:30'), 20);

insert into ORDINE values (0, TO_DATE('01-SET-2020 21:00'), 60);

insert into ORDINE values (0, TO_DATE('01-SET-2020 21:09'), 40);

insert into ORDINE values (0, TO_DATE('01-SET-2020 22:13'), 50);

insert into ORDINE values (0, TO_DATE('01-SET-2020 23:10'), 120);

-- PRENOTAZIONI --
insert into ORDINE values (9, TO_DATE('03-SET-2020 20:15'), default);

insert into ORDINE values (2, TO_DATE('03-SET-2020 21:00'), default);

insert into ORDINE values (5, TO_DATE('03-SET-2020 19:15'), default);

-- Funzionamento Prenotazioni-- 
-- UPDATE ORDINE SET Costo = 30 WHERE Ordine.NumTavolo=2 AND Ordine.DataOraOrdine = '01-SET-2020 18:30'; --



-- Popolamento CONTO --
insert into CONTO values ('FTTR0001', 2, TO_DATE('01-SET-2020 19:00'), 'Contanti');

insert into CONTO values ('FTTR0002', 1, TO_DATE('01-SET-2020 19:30'), 'Contanti');

insert into CONTO values ('FTTR0003', 3, TO_DATE('01-SET-2020 19:45'), 'Bancomat');

insert into CONTO values ('FTTR0004', 0, TO_DATE('01-SET-2020 19:05'), 'Bancomat');

insert into CONTO values ('FTTR0005', 0, TO_DATE('01-SET-2020 19:07'), 'Bancomat');

insert into CONTO values ('FTTR0006', 0, TO_DATE('01-SET-2020 19:37'), 'Contanti');

insert into CONTO values ('FTTR0007', 0, TO_DATE('01-SET-2020 19:46'), 'Contanti');

insert into CONTO values ('FTTR0008', 4, TO_DATE('01-SET-2020 20:10'), 'Bancomat');

insert into CONTO values ('FTTR0009', 1, TO_DATE('01-SET-2020 20:30'), 'Contanti');

insert into CONTO values ('FTTR0010', 0, TO_DATE('01-SET-2020 20:30'), 'Contanti');

insert into CONTO values ('FTTR0011', 3, TO_DATE('01-SET-2020 21:00'), 'Contanti');

insert into CONTO values ('FTTR0012', 0, TO_DATE('01-SET-2020 21:00'), 'Bancomat');

insert into CONTO values ('FTTR0013', 1, TO_DATE('01-SET-2020 21:25'), 'Bancomat');

insert into CONTO values ('FTTR0014', 0, TO_DATE('01-SET-2020 21:09'), 'Contanti');

insert into CONTO values ('FTTR0015', 5, TO_DATE('01-SET-2020 21:33'), 'Bancomat');

insert into CONTO values ('FTTR0016', 0, TO_DATE('01-SET-2020 22:13'), 'Bancomat');

insert into CONTO values ('FTTR0017', 0, TO_DATE('01-SET-2020 23:10'), 'Contanti');


-- Popolamento PRODOTTIINVENDITA
insert into PRODOTTIINVENDITA values ('PRDT0000', 'Coca-Cola Zero Zuccheri', 5, 'Bevanda', null);

insert into PRODOTTIINVENDITA values ('PRDT0001', 'Acqua EVIAN Naturale', 5, 'Bevanda', null);

insert into PRODOTTIINVENDITA values ('PRDT0002', 'Acqua EVIAN Frizzante', 5, 'Bevanda', null);

insert into PRODOTTIINVENDITA values ('PRDT0003', 'Pasta Gourmet con Ragu di Cinghiale', 10, 'Primo', 'Carne');

insert into PRODOTTIINVENDITA values ('PRDT0004', 'Parmigiana di Pesce Fresco', 20, 'Primo', 'Pesce');

insert into PRODOTTIINVENDITA values ('PRDT0005', 'Risotto alla Pescatora', 10, 'Primo', 'Pesce');

insert into PRODOTTIINVENDITA values ('PRDT0006', 'Bistecca di Black Angus', 20, 'Secondo', 'Carne');

insert into PRODOTTIINVENDITA values ('PRDT0007', 'Tomahawk con patate', 30, 'Secondo', 'Carne');

insert into PRODOTTIINVENDITA values ('PRDT0008', 'Scaloppina Al Limone', 20, 'Secondo', 'Carne');

insert into PRODOTTIINVENDITA values ('PRDT0009', 'Bistecca di Black Angus', 20, 'Secondo', 'Carne');

insert into PRODOTTIINVENDITA values ('PRDT0010', 'Tris di Tartare', 20, 'Antipasto', 'Carne');

insert into PRODOTTIINVENDITA values ('PRDT0011', 'Tartare di Pesce', 20, 'Antipasto', 'Pesce');

insert into PRODOTTIINVENDITA values ('PRDT0012', 'Tagliere di Formaggi', 10, 'Antipasto', null);

insert into PRODOTTIINVENDITA values ('PRDT0013', 'Antipasto di Mare', 20, 'Antipasto', 'Pesce');

insert into PRODOTTIINVENDITA values ('PRDT0014', 'Tiramisu BIO', 10, 'Dolce', null);

insert into PRODOTTIINVENDITA values ('PRDT0015', 'Sorbetto Al Limone Artigianale', 20, 'Dolce', null);

insert into PRODOTTIINVENDITA values ('PRDT0016', 'Torta della Nonna', 10, 'Dolce', null);

insert into PRODOTTIINVENDITA values ('PRDT0017', 'Torta Gelato al Cioccolato', 10, 'Dolce', null);

insert into PRODOTTIINVENDITA values ('PRDT0018', 'Falanghina di Roccamonfina', 20, 'Vino Bianco', null);

insert into PRODOTTIINVENDITA values ('PRDT0019', 'Falanghina di Benevento', 10, 'Vino Bianco', null);

insert into PRODOTTIINVENDITA values ('PRDT0020', 'Muller Thurgau Praepositus', 30, 'Vino Bianco', null);

insert into PRODOTTIINVENDITA values ('PRDT0021', 'Gewurztraminer Abbazia di Novacella', 30, 'Vino Bianco', null);

insert into PRODOTTIINVENDITA values ('PRDT0022', 'Aglianico del Vulture', 20, 'Vino Rosso', null);

insert into PRODOTTIINVENDITA values ('PRDT0023', 'Montepulciano d Abruzzo', 20, 'Vino Rosso', null);

insert into PRODOTTIINVENDITA values ('PRDT0024', 'Lambrusco Dry', 30, 'Vino Rosso', null);



-- Popolamento CONTIENE --

-- Ordine delle 19:00 sul tavolo 2, 100€ --
insert into CONTIENE values (2, TO_DATE('01-SET-2020 19:00'), 'PRDT0001', default);

insert into CONTIENE values (2, TO_DATE('01-SET-2020 19:00'), 'PRDT0002', default);

insert into CONTIENE values (2, TO_DATE('01-SET-2020 19:00'), 'PRDT0006', 2);

insert into CONTIENE values (2, TO_DATE('01-SET-2020 19:00'), 'PRDT0020', default);

insert into CONTIENE values (2, TO_DATE('01-SET-2020 19:00'), 'PRDT0018', default);


-- Ordine delle 19:30 sul tavolo 1, 50€ --
insert into CONTIENE values (1, TO_DATE('01-SET-2020 19:30'), 'PRDT0019', default);

insert into CONTIENE values (1, TO_DATE('01-SET-2020 19:30'), 'PRDT0011', default);

insert into CONTIENE values (1, TO_DATE('01-SET-2020 19:30'), 'PRDT0004', default);


-- Ordine delle 19:45 sul tavolo 3, 80€ --
insert into CONTIENE values (3, TO_DATE('01-SET-2020 19:45'), 'PRDT0022', default);

insert into CONTIENE values (3, TO_DATE('01-SET-2020 19:45'), 'PRDT0007', default);

insert into CONTIENE values (3, TO_DATE('01-SET-2020 19:45'), 'PRDT0009', default);

insert into CONTIENE values (3, TO_DATE('01-SET-2020 19:45'), 'PRDT0014', default);


-- Ordine delle 20:10 sul tavolo 4, 90€ --
insert into CONTIENE values (4, TO_DATE('01-SET-2020 20:10'), 'PRDT0020', default);

insert into CONTIENE values (4, TO_DATE('01-SET-2020 20:10'), 'PRDT0007', default);

insert into CONTIENE values (4, TO_DATE('01-SET-2020 20:10'), 'PRDT0014', default);

insert into CONTIENE values (4, TO_DATE('01-SET-2020 20:10'), 'PRDT0015', default);


-- Ordine delle 20:30 sul tavolo 1, 30€ --
insert into CONTIENE values (1, TO_DATE('01-SET-2020 20:30'), 'PRDT0013', default);

insert into CONTIENE values (1, TO_DATE('01-SET-2020 20:30'), 'PRDT0014', default);


-- Ordine delle 21:00 sul tavolo 3, 20€ --
insert into CONTIENE values (3, TO_DATE('01-SET-2020 21:00'), 'PRDT0005', default);

insert into CONTIENE values (3, TO_DATE('01-SET-2020 21:00'), 'PRDT0001', default);


-- Ordine delle 21:25 sul tavolo 1, 60€ --
insert into CONTIENE values (1, TO_DATE('01-SET-2020 21:25'), 'PRDT0008', default);

insert into CONTIENE values (1, TO_DATE('01-SET-2020 21:25'), 'PRDT0010', default);

insert into CONTIENE values (1, TO_DATE('01-SET-2020 21:25'), 'PRDT0011', default);


-- Ordine delle 21:33 sul tavolo 5, 70€ --
insert into CONTIENE values (5, TO_DATE('01-SET-2020 21:33'), 'PRDT0007', default);

insert into CONTIENE values (5, TO_DATE('01-SET-2020 21:33'), 'PRDT0006', default);

insert into CONTIENE values (5, TO_DATE('01-SET-2020 21:33'), 'PRDT0022', default);


-- Ordine asporto delle 19:05, 30€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:05'), 'PRDT0004', default);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:05'), 'PRDT0005', default);


-- Ordine asporto delle 19:07, 40€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:07'), 'PRDT0008', 2);


-- Ordine asporto delle 19:37, 60€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:37'), 'PRDT0007', 3);


-- Ordine asporto delle 19:46, 70€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:46'), 'PRDT0007', default);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:46'), 'PRDT0005', default);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:46'), 'PRDT0011', default);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 19:46'), 'PRDT0012', default);


-- Ordine asporto delle 20:30, 20€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 20:30'), 'PRDT0014', 2);


-- Ordine asporto delle 21:00, 60€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 21:00'), 'PRDT0010', 2);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 21:00'), 'PRDT0005', 2);


-- Ordine asporto delle 21:09, 40€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 21:09'), 'PRDT0016', 2);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 21:09'), 'PRDT0018', 1);


-- Ordine asporto delle 22:13, 50€ --
insert into CONTIENE values (0, TO_DATE('01-SET-2020 22:13'), 'PRDT0014', 3);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 22:13'), 'PRDT0011', 1);


-- Ordine asporto delle 23:10, 120€
insert into CONTIENE values (0, TO_DATE('01-SET-2020 23:10'), 'PRDT0003', 2);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 23:10'), 'PRDT0007', 2);

insert into CONTIENE values (0, TO_DATE('01-SET-2020 23:10'), 'PRDT0010', 2);


-- Popolamento CLIENTEPRENOTANTE --
insert into CLIENTEPRENOTANTE values ('+39 3203882413', 'Esterno', 8, 9, TO_DATE('03-SET-2020 20:15'));

insert into CLIENTEPRENOTANTE values ('linkhyrule@gmail.com', 'Esterno', 2, 2, TO_DATE('03-SET-2020 21:00'));

insert into CLIENTEPRENOTANTE values ('oculusquestnoface@gmail.com', 'Interno', 3, 5, TO_DATE('03-SET-2020 19:15'));


-- Popolamento DIPENDENTE --
insert into DIPENDENTE values ('CRTCAM005', 'Mario', 'Dipendenti', '+39 3278997513', TO_DATE('25-SET-2019'), TO_DATE('25-DIC-1984'), 'Cameriere');

insert into DIPENDENTE values ('CRTCAM004', 'Marta', 'Martini', '+39 3278997513', TO_DATE('01-OTT-2018'), TO_DATE('01-GEN-1999'), 'Cameriere');

insert into DIPENDENTE values ('CRTCAM003', 'Lidia', 'Sette', 'lidiasett@icloud.com', TO_DATE('05-LUG-2018'), TO_DATE('13-FEB-1994'), 'Cameriere');

insert into DIPENDENTE values ('CRTCAM001', 'Marvin', 'Dini', 'marvindini@gmail.com', TO_DATE('13-GEN-2018'), TO_DATE('10-LUG-1992'), 'Cameriere');

insert into DIPENDENTE values ('CRTCAM002', 'Martino', 'Vinti', '+39 3456992134', TO_DATE('20-FEB-2018'), TO_DATE('09-SET-1995'), 'Cameriere');

insert into DIPENDENTE values ('CRTCUO001', 'Vincenzo', 'Tocchi', 'itocchivin@gmail.com', TO_DATE('10-GEN-2019'), TO_DATE('01-MAG-1980'), 'Cuoco');

insert into DIPENDENTE values ('CRTCUO002', 'Luigi', 'Pizzi', 'luigispiz@icloud.com', TO_DATE('14-FEB-2019'), TO_DATE('07-AGO-1984'), 'Cuoco');


-- Popolamento TURNO --
insert into TURNO values ('CRTCAM001', TO_DATE('01-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM002', TO_DATE('01-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM003', TO_DATE('01-SET-2020 18:00'), 8, 'No');

insert into TURNO values ('CRTCAM004', TO_DATE('01-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM005', TO_DATE('01-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCUO001', TO_DATE('01-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM001', TO_DATE('02-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM002', TO_DATE('02-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM003', TO_DATE('02-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM004', TO_DATE('02-SET-2020 18:00'), 8, 'Si');

insert into TURNO values ('CRTCAM005', TO_DATE('02-SET-2020 18:00'), 8, 'No');

insert into TURNO values ('CRTCUO002', TO_DATE('02-SET-2020 18:00'), 8, 'Si');


-- Popolamento SALA --
insert into SALA values (1, 1, 3, 'Si');

insert into SALA values (2, 4, 7, 'No');

insert into SALA values (3, 8, 10, 'Si');


-- Popolamento SERVE --
insert into SERVE values ('CRTCAM001', TO_DATE('01-SET-2020 18:00'), 1);

insert into SERVE values ('CRTCAM002', TO_DATE('01-SET-2020 18:00'), 2);

insert into SERVE values ('CRTCAM004', TO_DATE('01-SET-2020 18:00'), 2);

insert into SERVE values ('CRTCAM005', TO_DATE('01-SET-2020 18:00'), 3);


-- Popolamento PERMESSO --
insert into PERMESSO values ('CRTCAM003', TO_DATE('01-SET-2020 18:00'), 'Personale');

insert into PERMESSO values ('CRTCAM001', TO_DATE('04-SET-2020 18:00'), 'Personale');

insert into PERMESSO values ('CRTCAM004', TO_DATE('06-SET-2020 18:00'), 'Personale');


-- Popolamento QUALIFICA --
insert into QUALIFICA values ('QUAL001', 'CRTCUO002', 'Specializzazione Cuoco Professionista');

insert into QUALIFICA values ('QUAL002', 'CRTCUO002', 'Specializzazione Enogastronomia');

insert into QUALIFICA values ('QUAL003', 'CRTCUO001', 'Attestato TripAdvisor 2018');

insert into QUALIFICA values ('QUAL004', 'CRTCAM001', 'Formazione professionale Cameriere');

insert into QUALIFICA values ('QUAL005', 'CRTCUO001', 'Corso di Aggiornamento Carne');



-- PARTE 3: CREAZIONE DELLE VISTE --


-- V conti_nonpagati.sql --

CREATE OR REPLACE VIEW conti_nonpagati AS
SELECT ORDINE.DataOraOrdine, ORDINE.NumTavolo
FROM ORDINE
WHERE not exists ( SELECT Conto.NumTavolo, CONTO.DataOraOrdine
		   FROM CONTO); 

-- V dipendenti_nonautorizzati.sql --

CREATE OR REPLACE VIEW dipendenti_nonautorizzati AS
SELECT DIPENDENTE.CartellinoDipendente, DIPENDENTE.Ruolo, TURNO.DataOraTurno
FROM (DIPENDENTE join TURNO on DIPENDENTE.CartellinoDipendente=TURNO.CartellinoDipendente)
WHERE TURNO.Timbrato = 'No'
AND
not exists ( SELECT PERMESSO.CartellinoDipendente, PERMESSO.DataOraPermesso
	     FROM PERMESSO
             WHERE TURNO.CartellinoDipendente = PERMESSO.CartellinoDipendente
	     AND
	     PERMESSO.DataOraPermesso = TURNO.DataOraTurno);


-- V eta_dipendenti.sql --

CREATE OR REPLACE VIEW eta_dipendenti AS
SELECT 	DIPENDENTE.CartellinoDipendente, DIPENDENTE.NomeDip, DIPENDENTE.CognomeDip, 
	ROUND(SUM(MONTHS_BETWEEN (SYSDATE, DIPENDENTE.DataNascita)/12), 0) AS EtaDip
FROM DIPENDENTE
GROUP BY DIPENDENTE.CartellinoDipendente, DIPENDENTE.NomeDip, DIPENDENTE.CognomeDip;


-- V npermessi_dipendente.sql --

CREATE OR REPLACE VIEW npermessi_dipendente AS
SELECT 		DIPENDENTE.CartellinoDipendente, COUNT(PERMESSO.CartellinoDipendente) AS NPermessiRichiesti
FROM 		DIPENDENTE join PERMESSO on DIPENDENTE.CartellinoDipendente=PERMESSO.CartellinoDipendente
GROUP BY 	DIPENDENTE.CartellinoDipendente;			


-- V ntavolipersala.sql --

CREATE OR REPLACE VIEW ntavolipersala AS
SELECT SALA.NumSala AS SalaN, SALA.NPrimoTav AS PrimoTavolo, SALA.NUltimoTav AS UltimoTavolo, SUM(SALA.NUltimoTav - SALA.NPrimoTav + 1) AS NTavoliNellaSala
FROM SALA
WHERE 
     (	
	( SALA.NPrimoTav = (SELECT SALA.NPrimoTav FROM SALA WHERE SALA.NumSala=1) )
	OR
	( SALA.NPrimoTav = (SELECT SALA.NPrimoTav FROM SALA WHERE SALA.NumSala=2) )
	OR
	( SALA.NPrimoTav = (SELECT SALA.NPrimoTav FROM SALA WHERE SALA.NumSala=3) )
     )
GROUP BY NumSala, NPrimoTav, NUltimoTav
ORDER BY NumSala;


-- V tavoli_occupati.sql --

CREATE OR REPLACE VIEW tavoli_occupati AS
SELECT ORDINE.NumTavolo, ORDINE.DataOraOrdine
FROM ORDINE
WHERE ( ORDINE.DataOraOrdine < (SYSDATE)    									
AND
 ( (TRUNC(ORDINE.DataOraOrdine)) = (TRUNC (SYSDATE) ) ) )  							
AND
 (ORDINE.NumTavolo != 0)										
AND
ORDINE.DataOraOrdine != ALL (SELECT CONTO.DataOraOrdine FROM CONTO)       				    
ORDER BY ORDINE.DataOraOrdine;


-- V tavoli_pagati.sql --

CREATE OR REPLACE VIEW tavoli_pagati AS
SELECT 	ORDINE.NumTavolo, ORDINE.DataOraOrdine, CONTO.NumFattura
FROM 	(ORDINE join CONTO on ORDINE.DataOraOrdine = CONTO.DataOraOrdine AND ORDINE.NumTavolo=CONTO.NumTavolo)
WHERE exists (SELECT CONTO.NumFattura FROM CONTO 
	      WHERE ORDINE.NumTavolo=CONTO.NumTavolo)
AND ORDINE.NumTavolo != 0;


-- V tavoli_prenotati.sql --

CREATE OR REPLACE VIEW tavoli_prenotati AS
SELECT ORDINE.NumTavolo, ORDINE.DataOraOrdine
FROM ( ORDINE join CLIENTEPRENOTANTE on ORDINE.DataOraOrdine = CLIENTEPRENOTANTE.DataOraAssegnati )
WHERE exists (SELECT CLIENTEPRENOTANTE.NumTavoloAssegnato, CLIENTEPRENOTANTE.DataOraAssegnati
	      FROM CLIENTEPRENOTANTE
	      WHERE ORDINE.DataOraOrdine = CLIENTEPRENOTANTE.DataOraAssegnati)	
ORDER BY ORDINE.DataOraOrdine;




