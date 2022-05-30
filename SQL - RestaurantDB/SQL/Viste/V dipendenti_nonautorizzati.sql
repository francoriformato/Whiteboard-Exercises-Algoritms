-- VISTA Dipendenti che non hanno seguito il turno a loro assegnato SENZA permesso, visualizzando anche il giorno lasciato scoperto e il ruolo lasciato scoperto --

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