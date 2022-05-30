-- VISTA quanti permessi ha richiesto ogni dipendente --

CREATE OR REPLACE VIEW npermessi_dipendente AS
SELECT 		DIPENDENTE.CartellinoDipendente, COUNT(PERMESSO.CartellinoDipendente) AS NPermessiRichiesti
FROM 		DIPENDENTE join PERMESSO on DIPENDENTE.CartellinoDipendente=PERMESSO.CartellinoDipendente
GROUP BY 	DIPENDENTE.CartellinoDipendente;			