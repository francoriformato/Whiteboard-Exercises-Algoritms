#include "headerPuzzle.h"

int main()
{
    int n;
    char matrixIniziale[MAXRC][MAXRC];          //matrice che sarà immessa dall'utente
    int righe, colonne, contaMatrix;

    int genClassifica = 0;

    MatriceCasuali pool[totaleMatrici];         //array di matrici

    int countR = 0, countG = 0, countB = 0;     //contatori del numero di tessere utilizzate dall'utente (le tessere usate dall'utente devono essere le stesse
                                                //che utilizzerà il programma per generare le matrici casuali

    srand((unsigned int)time(0));               //seed per la generazione di numeri casuali

    printf("Inserisci il numero n di tessere, tale che n sia una potenza di 2 e minimo 32,\nin modo che sia possibile avere una matrice quadrata: \n");
    scanf("%d", &n);

    if (controlloN(n) == 1)                    //viene richiamata la function controlloN per verificare che il numero di tessere immesso sia possibile
    {
        printf("Controllo superato, continuo programma.. \n");

        righe = sqrt(n);                       //calcolo righe della matrice quadrata
        colonne = sqrt(n);                     //calcolo colonne della matrice quadrata

        inserimentoMatrixC(matrixIniziale, righe, colonne, &countR, &countG, &countB);      //permette l'inserimento manuale della matrice da parte dell'utente

        printf("Tessere utilizzate: \nTessere Rosse:%d \nTessere Gialle:%d \nTessere Blu:%d \n", countR, countG, countB);

        printf("Hai inserito la seguente matrice:\n");
        visualizzaMatrixC(matrixIniziale, righe, colonne);      //visualizza la matrice immessa dall'utente


        for (contaMatrix = 0; contaMatrix < totaleMatrici; contaMatrix++)       //generazione delle matrici casuali e attribuzione di un punteggio a ciascuna
        {
            pool[contaMatrix].punteggiomatrice = 0;

            inizializzaMatriceCasuali(pool[contaMatrix].pMatrice, righe, colonne, countR, countG, countB);

            matchingMatrix(matrixIniziale, pool[contaMatrix].pMatrice, righe, colonne, &pool[contaMatrix].punteggiomatrice);

        }

        qsort(pool, totaleMatrici, sizeof(struct matricecasuali), compareStruct);   //ordinamento utilizzato per la struct

        printf("\n LE 10 MATRICI PIU' SIMILI A QUELLA IMMESSA DALL'UTENTE SONO: \n");

        for (genClassifica = totaleMatrici-1; genClassifica > totaleMatrici-10; genClassifica--)    //stampa delle matrici più simili a quella immessa dall'utente
                                                                                                    //tra le matrici generate casualmente dal programma
        {
            visualizzaMatrixC(pool[genClassifica].pMatrice, righe, colonne);
            printf("Con punteggio di %d \n", pool[genClassifica].punteggiomatrice);
            printf("\n");
        }


    }

    else                                                                                            //errore in caso il controllo sul numero di tessere non                                                                                                   //andasse a buon fine
    {
        printf("n inserito non e' potenza di 2 maggiore di 32 OPPURE non permetterebbe di generare una matrice quadrata!");
    }

    return 0;
}
