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

