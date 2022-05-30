-- VISTA ordini NON pagati --

CREATE OR REPLACE VIEW conti_nonpagati AS
SELECT ORDINE.DataOraOrdine, ORDINE.NumTavolo
FROM ORDINE
WHERE not exists ( SELECT Conto.NumTavolo, CONTO.DataOraOrdine
		   FROM CONTO); 