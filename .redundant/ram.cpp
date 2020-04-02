#include <string>
#include <stdlib.h>
#include <fstream>
#include <cstdio>

using namespace std;

// Thanks to http://stackoverflow.com/a/26930298/1876983
// For giving me a clue what to do about CLI inputs
int main(int argc, char *argv[]) {
    float TOT = atoi(argv[1]);
    float TOTm = TOT/(1024*1024);
    printf("%.1f", TOTm);
    return 0;
}
