
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
