-- VISTA TAVOLI con ORDINE PAGATO --

CREATE OR REPLACE VIEW tavoli_pagati AS
SELECT 	ORDINE.NumTavolo, ORDINE.DataOraOrdine, CONTO.NumFattura
FROM 	(ORDINE join CONTO on ORDINE.DataOraOrdine = CONTO.DataOraOrdine AND ORDINE.NumTavolo=CONTO.NumTavolo)
WHERE exists (SELECT CONTO.NumFattura FROM CONTO 
	      WHERE ORDINE.NumTavolo=CONTO.NumTavolo)
AND ORDINE.NumTavolo != 0;