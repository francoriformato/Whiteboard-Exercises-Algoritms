//Librerie utilizzate
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Macro utilizzate
#define MAX_RIVISTE 8
#define MAX_STRUMENTI 4

//Struct definite
struct musicalInstrument {
       char *nome;
       };

struct rivista {
       char *titolo;
       char *IDcode;
       char *genere;
       float prezzo;
       int pezziDisponibili;
       struct musicalInstrument strumento[5];
       };

typedef struct rivista Rivista;
typedef struct musicalInstrument strumentoMusicale;

//Prototipi delle functions
void creaScaffale(struct rivista scaffale[]);
void genreSearch(struct rivista scaffale[],struct rivista Search);
int checkPrezzo(struct rivista scaffale[], struct rivista nomeRicerca);
int checkRivista(struct rivista scaffale[], struct rivista nomeRicerca);
void instrumentSearch(struct rivista scaffale[], struct musicalInstrument Ricercato);
void clearScreen(void);
void pauseScreen(void);
