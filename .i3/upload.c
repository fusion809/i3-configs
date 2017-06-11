#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

int main(void) {
    chdir("/home/fusion809/.i3");
    system("./download.sh");
    system("./upload.sh");
    int fp=fopen("/tmp/download-rate-i3", "r");
    printf("%.0f", fp);
}
