//Librerie utilizzate
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

//Macro utilizzate
#define MAXRC 17                //massimo numero di righe o colonne delle matrici
#define totaleMatrici 1000      //numero di matrici da generare

//Struct definite
struct matricecasuali {
        char pMatrice[17][17];
        int punteggiomatrice;
        };

typedef struct matricecasuali MatriceCasuali;

//Prototipi delle functions
int controlloN(int n);
void inserimentoMatrixC(char matrixIniziale[][MAXRC], int, int, int *, int *, int *);
void visualizzaMatrixC(char matrixIniziale[][MAXRC], int, int);
void inizializzaMatriceCasuali(char matrixCasuale[][MAXRC], int, int , int , int, int );
void matchingMatrix(char matrixIniziale[][MAXRC], char matrixCasuale[][MAXRC], int, int , int *);
int compareStruct(const void *s1, const void *s2);

