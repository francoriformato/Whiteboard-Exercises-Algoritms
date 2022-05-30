
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


