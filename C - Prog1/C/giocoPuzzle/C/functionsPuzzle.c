//Implementazioni delle functions (prototipi nel file "headerPuzzle.h")
#include "headerPuzzle.h"

int controlloN(int n)   //funzione che permette di verificare se il numero di tessere inserito e' potenza di 2, se e' maggiore di 32 e se e' possibile creare con                     //esse una matrice quadrata
{
    double restoLog;
    double log2;
    double restoSqrt;

    log2 = log(n) / log(2.0);
    restoLog = log2 - (int)log2;
    restoSqrt = sqrt(n) - (int)sqrt(n);

    if (restoLog == 0 && restoSqrt == 0 && sqrt(n) < 1000) //aggiungere && n > 32
        return 1;
    else
        return 0;
}

void inserimentoMatrixC(char matrixIniziale[][MAXRC], int righe, int colonne, int *countR, int *countG, int *countB) //permette all'utente di inserire                                                                                                                             //manualmente la matrice
{
    int i, j;

    for (i=0; i<righe; i++)
    {
        for (j=0; j<colonne; j++)
        {
            printf("Inserimento elemento (%d,%d):", i, j);
            fflush(stdin);
            matrixIniziale[i][j] = getchar();

            if (matrixIniziale[i][j] != 'R' && matrixIniziale[i][j] != 'G' && matrixIniziale[i][j] != 'B')
            {
                printf("E' possibile inserire solo R, G o B!\n");
                exit(0);
            }

            if (matrixIniziale[i][j] == 'R')
                *countR = *countR + 1;
            if (matrixIniziale[i][j] == 'G')
                *countG = *countG + 1;
            if (matrixIniziale[i][j] == 'B')
                *countB = *countB + 1;
        }
    }
}

void visualizzaMatrixC(char matrixIniziale[][MAXRC], int righe, int colonne)  //visualizza eventuali matrici passate in input
{
   int i, j = 0;

    for (i=0; i<righe; i++)
    {
        for (j=0; j<colonne; j++)
        {
            printf(" ");
            putchar(matrixIniziale[i][j]);
        }
        printf("\n");
    }
}

void inizializzaMatriceCasuali(char matrixCasuale[][MAXRC], int righe, int colonne, int countR, int countG, int countB)  //inizializza ogni matrice casuale
                                                                                                                         //singolarmente.
{
    int ci, cj;
    int randNumber;
    int j = 0, k = 0, h = 0;                                //contatori: j per le tessere rosse usate, k per quelle gialle usate e h per quelle blu usate

    for (ci=0; ci<righe; ci++)
    {
        for (cj=0; cj<colonne; cj++)
        {

        randNumber = rand() %3;                             //genera un valore casuale
        matrixCasuale[ci][cj] = 'J';                        //attribuisce un valore improprio a matrice[ci][cj], da utilizzare per l'if finale

        if (randNumber == 0 && j < countR)                  //se il valore casuale e' 0 e non si sono finite le tessere rosse, allora si assegna alla posizione                                                   //una tessera rossa
        {
          matrixCasuale[ci][cj] = 'R';
          j++;                                              //incremento il contatore delle tessere rosse usate
        }

        if (randNumber == 1 && k < countG)                  //se il valore casuale e' 1 e non si sono finite le tessere gialle, allora si assegna alla posizione                                                  //una tessera gialla
        {
          matrixCasuale[ci][cj] = 'G';
          k++;                                              //incremento il contatore delle tessere gialle usate
        }

        if (randNumber == 2 && h < countB)                  //se il valore casuale e' 2 e non si sono finite le tessere blu, allora si assegna alla posizione                                                     //una tessera blu
        {
          matrixCasuale[ci][cj] = 'B';
          h++;                                              //incremento il contatore delle tessere blu
        }

        if (matrixCasuale[ci][cj] == 'J')                   //se non è stato possibile assegnare a matrice[ci][cj] alcun valore, ci si riprova ripartendo con la                                                  //generazione di un numero casuale
            cj--;

        }
    }


}



void matchingMatrix(char matrixIniziale[][MAXRC], char matrixCasuale[][MAXRC], int righe, int colonne, int *punteggio)  //semplice algoritmo di matching tra una                                                                                                                      //matrice e un'altra, permette di                                                                                                                             //calcolare il punteggio matching
{
    int cR, cC;
    *punteggio = 0;

    for (cR = 0; cR < righe; cR++)
    {
        for (cC = 0; cC < colonne; cC++)
        {
            if (matrixIniziale[cR][cC] == matrixCasuale[cR][cC])
                *punteggio = *punteggio+1;
        }
    }

}

int compareStruct(const void *s1, const void *s2)                                                             //function utilizzata per implementare qsort
{
    struct matricecasuali *e1 = (struct matricecasuali *)s1;
    struct matricecasuali *e2 = (struct matricecasuali *)s2;
    return e1->punteggiomatrice - e2->punteggiomatrice;
}

