-- VISTA che restituisce le età dei dipendenti, il loro nome e cognome e il cartellino --

CREATE OR REPLACE VIEW eta_dipendenti AS
SELECT 	DIPENDENTE.CartellinoDipendente, DIPENDENTE.NomeDip, DIPENDENTE.CognomeDip, 
	ROUND(SUM(MONTHS_BETWEEN (SYSDATE, DIPENDENTE.DataNascita)/12), 0) AS EtaDip
FROM DIPENDENTE
GROUP BY DIPENDENTE.CartellinoDipendente, DIPENDENTE.NomeDip, DIPENDENTE.CognomeDip;