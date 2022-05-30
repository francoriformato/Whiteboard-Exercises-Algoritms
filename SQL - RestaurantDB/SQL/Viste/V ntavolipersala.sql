
-- VISTA numero tavoli presenti in ogni sala, anche in caso di spostamenti --
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