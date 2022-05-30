#include "musicHeader.h"

//instrumentSearch: function utilizzata per la ricerca di riviste che riguardano un determinato strumento musicale scelto dall'utente.
//Prende in input il "database" delle riviste e lo strumento musicale ricercato dall'utente.

void instrumentSearch(struct rivista scaffale[], struct musicalInstrument Ricercato)
{
    int i, j;
    int found = 0;      //Variabile che indica se sono state trovate riviste per quel determinato strumento

    for (i=0; i <= MAX_RIVISTE; i++)
    {
        for (j=0; j <= MAX_STRUMENTI; j++)
        {
            if (strcmp(Ricercato.nome, scaffale[i].strumento[j].nome) == 0)     //comparazione tra il nome dello strumento ricercato e gli strumenti inclusi
                                                                                //nelle riviste sullo scaffale
            {
                found=1;            //Se la rivista con quello strumento viene trovata, allora found sarà portata ad 1 e non si eseguirà il secondo if
                printf("\n");
                printf("TITOLO: %10s \n",scaffale[i].titolo);
                printf("PREZZO: %4.2f EURO \n",scaffale[i].prezzo);
                printf("DISPONIBILI: %3d \n",scaffale[i].pezziDisponibili);
                printf("\n");
            }
        }
    }

    if(found == 0)
        {
            printf("Non ci sono riviste riguardanti questo strumento nel nostro scaffale. \n");     //da eseguire in caso found non sia incrementata ad 1                                                                                          //dall'if precedente

        }
}

//genreSearch: function utilizzata per la ricerca di riviste che trattano un genere specifico, scelto dall'utente.
//Prende in input lo scaffale che contiene tutte le riviste e il titolo della rivista ricercata dall'utente.

void genreSearch(struct rivista scaffale[],struct rivista Search)
{
     int i;
     int found = 0;     //Variabile che indica se sono state trovate riviste per quel genere

     for(i=0; i<=MAX_RIVISTE; i++)
     {
        if(strcmp(Search.genere, scaffale[i].genere) == 0)  //comparazione tra il genere ricercato e i generi delle
                                                            //riviste sullo scaffale
        {
           found=1;     //Se la rivista di quel genere viene trovata, allora found sarà portata ad 1 e non si eseguirà il secondo if
           printf("\n");
           printf("TITOLO: %10s \n",scaffale[i].titolo);
           printf("PREZZO: %4.2f EURO \n",scaffale[i].prezzo);
           printf("DISPONIBILI: %3d \n",scaffale[i].pezziDisponibili);
           printf("\n");

        }
    }

    if(found == 0)
        {
            printf("Il genere non e' presente nel nostro scaffale. \n");    //da eseguire in caso found non sia incrementata ad 1                                                                                          //dall'if precedente
        }
}

//checkPrezzo: function utilizzata per la stampa del prezzo di una rivista
//Ha in input lo scaffale contenente le riviste e la rivista da ricercare

int checkPrezzo(struct rivista scaffale[], struct rivista Search)
{
    int i;
    for (i=0; i<=MAX_RIVISTE; i++)
    {
       if(strcmp(Search.titolo, scaffale[i].titolo) == 0)   //comparo il titolo della rivista da cercare con tutti i titoli delle riviste sullo scaffale
       {
            if (scaffale[i].pezziDisponibili != 0)      //se la rivista è disponibile, allora ritorno il prezzo
                return scaffale[i].prezzo;
       }
    }
    return 0;

}

//checkRivista: function che controlla la disponibilità in termini di pezzi disponibili di una rivista sullo scaffale
//Prende in input lo scaffale delle riviste e la rivista da ricercare

int checkRivista(struct rivista scaffale[], struct rivista Search)
{
    int i;
    for (i=0; i<=MAX_RIVISTE; i++)
    {
       if(strcmp(Search.titolo, scaffale[i].titolo)== 0 )   //comparo il titolo della rivista da cercare con tutti i titoli delle riviste sullo scaffale
        if (scaffale[i].pezziDisponibili != 0)              //se ci sono pezzi disponibili per quella rivista
         return 1;                                          //la function ritorna 1
    }
    return 0;                                               //altrimenti 0
}

//clearScreen: function che permette di ripulire la visualizzazione.
//Alternativa di SYSTEM("CLS"), al fine di evitare una chiamata di sistema, oltre che disponibile solo su Windows.

void clearScreen()
{
    int n;
    for (n=0; n<10; n++)
    printf("\n\n\n\n\n\n\n\n\n\n");
}

//pauseScreen: function che permette di attendere un input dall'utente prima di permettere al programma di continuare.
//Alternativa di SYSTEM("PAUSE"), al fine di evitare una chiamata di sistema, oltre che disponibile solo su Windows.

void pauseScreen()
{
    fflush(stdin);
    printf("Premi invio per continuare!\n");
    getchar();
}

//creaScaffale: function che costruisce all'interno della variabile scaffale il "database" delle riviste disponibili, con tutte le loro caratteristiche.
//E' stato attualmente popolato di 9 riviste, con relativi titoli, IDcode, generi, disponibilità e strumenti trattati nella rivista.
//Prende in input la variabile scaffale

void creaScaffale(struct rivista scaffale[])
{
    scaffale[0].titolo = "JazzProgramming";
    scaffale[0].IDcode = "AK236451";
    scaffale[0].genere = "jazz";
    scaffale[0].prezzo = 20;
    scaffale[0].pezziDisponibili = 4;
    scaffale[0].strumento[0].nome = "Batteria";
    scaffale[0].strumento[1].nome = "Chitarra";
    scaffale[0].strumento[2].nome = "Tromba";
    scaffale[0].strumento[3].nome = "\0";
    scaffale[0].strumento[4].nome = "\0";

    scaffale[1].titolo = "PoProgramming";
    scaffale[1].IDcode = "AF556451";
    scaffale[1].genere = "pop";
    scaffale[1].prezzo = 27;
    scaffale[1].pezziDisponibili = 2;
    scaffale[1].strumento[0].nome = "Xilofono";
    scaffale[1].strumento[1].nome = "Sassofono";
    scaffale[1].strumento[2].nome = "Batteria";
    scaffale[1].strumento[3].nome = "Chitarra";
    scaffale[1].strumento[4].nome = "\0";

    scaffale[2].titolo = "RockRamming";
    scaffale[2].IDcode = "AL556721";
    scaffale[2].genere = "rock";
    scaffale[2].prezzo = 15;
    scaffale[2].pezziDisponibili = 6;
    scaffale[2].strumento[0].nome = "Batteria";
    scaffale[2].strumento[1].nome = "Chitarra";
    scaffale[2].strumento[2].nome = "\0";
    scaffale[2].strumento[3].nome = "\0";
    scaffale[2].strumento[4].nome = "\0";

    scaffale[3].titolo = "PunkCode";
    scaffale[3].IDcode = "PU555555";
    scaffale[3].genere = "punk";
    scaffale[3].prezzo = 11;
    scaffale[3].pezziDisponibili = 3;
    scaffale[3].strumento[0].nome = "Batteria";
    scaffale[3].strumento[1].nome = "Xilofono";
    scaffale[3].strumento[2].nome = "\0";
    scaffale[3].strumento[3].nome = "\0";
    scaffale[3].strumento[4].nome = "\0";

    scaffale[4].titolo = "RapOne";
    scaffale[4].IDcode = "RA553351";
    scaffale[4].genere = "rap";
    scaffale[4].prezzo = 30;
    scaffale[4].pezziDisponibili = 5;
    scaffale[4].strumento[0].nome = "Chitarra";
    scaffale[4].strumento[1].nome = "Tromba";
    scaffale[4].strumento[2].nome = "Sassofono";
    scaffale[4].strumento[3].nome = "\0";
    scaffale[4].strumento[4].nome = "\0";

    scaffale[5].titolo = "CPopPop";
    scaffale[5].IDcode = "CC554721";
    scaffale[5].genere = "pop";
    scaffale[5].prezzo = 17;
    scaffale[5].pezziDisponibili = 5;
    scaffale[5].strumento[0].nome = "Chitarra";
    scaffale[5].strumento[1].nome = "Tromba";
    scaffale[5].strumento[2].nome = "Sassofono";
    scaffale[5].strumento[3].nome = "Xilofono";
    scaffale[5].strumento[4].nome = "Batteria";
    
    scaffale[6].titolo = "Punkgramming";
    scaffale[6].IDcode = "PU777771";
    scaffale[6].genere = "punk";
    scaffale[6].prezzo = 20;
    scaffale[6].pezziDisponibili = 11;
    scaffale[6].strumento[0].nome = "Chitarra";
    scaffale[6].strumento[1].nome = "Tromba";
    scaffale[6].strumento[2].nome = "Sassofono";
    scaffale[6].strumento[3].nome = "Xilofono";
    scaffale[6].strumento[4].nome = "\0";
    
    scaffale[7].titolo = "Sxrrxwland";
    scaffale[7].IDcode = "SX554717";
    scaffale[7].genere = "rap";
    scaffale[7].prezzo = 35;
    scaffale[7].pezziDisponibili = 7;
    scaffale[7].strumento[0].nome = "Chitarra";
    scaffale[7].strumento[1].nome = "Tromba";
    scaffale[7].strumento[2].nome = "Sassofono";
    scaffale[7].strumento[3].nome = "Xilofono";
    scaffale[7].strumento[4].nome = "Batteria";
    
    scaffale[8].titolo = "ANIMAMUNDI";
    scaffale[8].IDcode = "AM666711";
    scaffale[8].genere = "rap";
    scaffale[8].prezzo = 50;
    scaffale[8].pezziDisponibili = 1;
    scaffale[8].strumento[0].nome = "Chitarra";
    scaffale[8].strumento[1].nome = "Batteria";
    scaffale[8].strumento[2].nome = "\0";
    scaffale[8].strumento[3].nome = "\0";
    scaffale[8].strumento[4].nome = "\0";
    
}

