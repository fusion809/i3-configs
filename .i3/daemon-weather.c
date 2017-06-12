#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

int main()
{
    FILE *cpulog= NULL; FILE *downlog= NULL; FILE *uplog= NULL;
    system("pidof -s i3bar > /tmp/pid-of-i3bar");
    pid_t process_id = popen("/bin/cat /tmp/pid-of-i3bar", "r");

    pid_t sid = 0;
    // Create child process
    process_id = fork();
    // Indication of fork() failure
    if (process_id < 0)
    {
         printf("fork failed!\n");
         // Return failure in exit status
         exit(1);
    }

    // PARENT PROCESS. Need to kill it.
    if (process_id > 0)
    {
         printf("process_id of child process %d \n", process_id);
         // return success in exit status
         exit(0);
    }

    // unmask the file mode
    umask(0);
    // set new session
    sid = setsid();

    if(sid < 0)
    {
    // Return failure
         exit(1);
    }

    // Change the current working directory to root.
    chdir("/home/fusion809/.i3");
    // Close stdin. stdout and stderr
    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);

    while (1)
    {
         system("/bin/bash -c weath.sh");
         sleep(100);
    }

    return (0);
}

