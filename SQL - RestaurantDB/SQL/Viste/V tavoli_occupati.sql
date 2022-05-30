-- VISTA TAVOLI occupati, assumendo che un tavolo sia ancora occupato se non è stato pagato --
ALTER SESSION SET nls_date_format='DD-MON-YYYY HH24:MI';

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