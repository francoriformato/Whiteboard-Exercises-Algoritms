#include "musicHeader.h"

int main()
{
    Rivista scaffale[10];           //Dichiarazione di un array di riviste: lo scaffale
    Rivista Search;                 //Variabile che sarà utilizzata per la ricerca in base al nome rivista o al genere
    strumentoMusicale Ricercato;    //Variabile utilizzata per la ricerca in base al nome dello strumento musicale

    char ricerca[35];               //Variabile utilizzata per memorizzare input dall'utente

    int selezione;                  //Variabile utilizzata per scegliere un'opzione dal menù principale

    creaScaffale(scaffale);         //richiamo alla function creaScaffale: il "database" delle riviste presenti sullo scaffale
 do{
    printf(" ****************************** \n");
    printf(" #                            # \n");
    printf(" #    SCAFFALE MUSICALE       # \n");
    printf(" #        0124 1968           # \n");
    printf(" #                            # \n");
    printf(" ****************************** \n");
    printf("\n");
    printf("SCEGLIERE L'OPERAZIONE DA ESEGUIRE:\n\n1   RICERCA & ACQUISTO RIVISTA;\n\n2   ESPLORA PER GENERE;\n\n3   RICERCA PER STRUMENTO\n\n4   ESCI\n\n");
     
    printf("Effettuare la selezione:\n");

    scanf("%d", &selezione);                //Scelta dell'azione da compiere dal menù

    if (selezione == 1)                     //Primo caso: si vuole fare una ricerca di una rivista e acquistarla in caso sia disponibile
    {
        printf("Nome rivista da acquistare: \n");
        scanf("%s", ricerca);
        Search.titolo = ricerca;                    //Viene assegnato il valore di ricerca a Search di tipo Rivista, nel campo titolo

        if (checkRivista(scaffale, Search) == 1)     //richiamo alla function checkRivista che controllerà se la rivista sarà disponibile, in base al titolo e                                          //ai pezzi disponibili
        {
            printf("Disponibile!\n");

            printf("Puo' procedere all'acquisto. \nil prezzo e' di: %d EURO \n", checkPrezzo(scaffale, Search));    //richiamo alla function checkPrezzo che                                                                                                       //mostrerà il prezzo della rivista il cui                                                                                                      //titolo è stato immesso in Search.titolo
            pauseScreen();      //richiamo alla function per permettere all'utente di visualizzare i dati ricevuti, sostituto di SYSTEM("PAUSE")
            clearScreen();      //richiamo alla function per ripulitura dello schermo, sostituto di SYSTEM("CLS")
        }

        if (checkRivista(scaffale, Search) == 0)    //sezione di codice da eseguire in caso la rivista non sia disponibile o il titolo non esista
        {
            printf("Non e' possibile trovare la rivista desiderata!\n");
            pauseScreen();
            clearScreen();
        }
    }

     if (selezione == 2)    //Secondo caso: si vuole fare una ricerca delle riviste di un genere noto
     {
         printf("Genere da ricercare: \n");
         scanf("%s", ricerca);
         Search.genere = ricerca;       //Viene assegnato il valore di ricerca a Search di tipo Rivista, nel campo genere

         printf("Ecco le riviste in catalogo di quel genere: \n");
         genreSearch(scaffale, Search);               //Stampa a schermo le riviste del genere selezionato. Potrebbe non stamparne nessuna e stampare un
                                                      //errore al loro posto
         pauseScreen();
         clearScreen();
     }

     if (selezione == 3)    //Terzo caso: si vuole fare una ricerca delle riviste in cui è presente uno strumento noto
     {
         printf("Strumento da ricercare: \n");
         scanf("%s", ricerca);
         Ricercato.nome = ricerca;      //Viene assegnato il valore di ricerca a Ricercato di tipo StrumentoMusicale, nel campo nome

         printf("Ecco le riviste in catalogo che trattano quello strumento: \n");
         instrumentSearch(scaffale, Ricercato);     //Vengono stampate a schermo le riviste che contengono lo strumento selezionato e le loro specifiche.                                             //Potrebbe non essercene nessuna e mostrare un messaggio di errore
         pauseScreen();
         clearScreen();

     }

	 if(selezione == 4)             //Quarto caso: richiesta di uscita dal programma
	  {
	      printf("Chiusura del servizio..\n");
	  }
     
     if(selezione != 1 && selezione != 2 && selezione != 3 && selezione != 4)   //Quinto caso: si immette un valore che non corrisponde ad alcun elemento
                                                                                //del menù principale.
     {
         printf("Selezione errata!\n");     //Viene stampato un messaggio di errore e successivamente si può ritentare
         pauseScreen();
         clearScreen();
     }

 }
	  while (selezione != 4);       //Quando selezione==4, allora si uscirà dal programma
}

