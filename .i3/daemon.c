#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <math.h>

#define BUF_SIZE 4096

typedef struct {
    unsigned long int user;
    unsigned long int nice;
    unsigned long int system;
    unsigned long int idle;
    unsigned long int iowait;
    unsigned long int irq;
    unsigned long int softirq;
    unsigned long int steal;
} cpu_usage;

cpu_usage readStats() {
    FILE* fp = fopen("/proc/stat", "r");

    cpu_usage usage;

    if (fp != NULL) {
         char buf[BUF_SIZE];

         while (fgets(buf, BUF_SIZE, fp)) {
              if (sscanf(buf, "cpu %lu %lu %lu %lu %lu %lu %lu %lu",
                &usage.user, &usage.nice, &usage.system, &usage.idle, &usage.iowait, &usage.irq, &usage.softirq, &usage.steal))
              {
                   break;
              }

         }
    }

    fclose(fp);

    return usage;
}

// count from composite value until we reach the intr line
int countCores() {
    FILE* fp = fopen("/proc/stat" ,"r");
    int num = -1;
    if (fp != NULL) {
         char buf[BUF_SIZE];

         while (fgets(buf, BUF_SIZE, fp)) {
         // dont care about composite value
              if (strstr(buf, "cpu ") != NULL) {
                   continue;
              }
              num += 1;

              if (strstr(buf, "intr") != NULL) {
                   fclose(fp);
                   return num;
              }
         }
    }

    return num;
}

double calculateUsage(cpu_usage u1, cpu_usage u2, int numCores) {
    unsigned long int totalUsage1 = u1.user + u1.nice + u1.system + u1.irq + u1.softirq + u1.steal;
    unsigned long int totalUsage2 = u2.user + u2.nice + u2.system + u2.irq + u2.softirq + u2.steal;

    unsigned long int totalIdle1 = u1.idle + u1.iowait;
    unsigned long int totalIdle2 = u2.idle + u2.iowait;

    unsigned long int total1 = totalUsage1 + totalIdle1;
    unsigned long int total2 = totalUsage2 + totalIdle2;

    unsigned long int totald = total2 - total1;
    unsigned long int idled = totalIdle2 - totalIdle1;

    double result = (double) (totald - idled) / (double) totald;

    return result;
}

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
    // Open a log file in write mode.
    cpulog = fopen("cpu.log", "w");
    downlog = fopen("down.log", "w");
    uplog = fopen("up.log", "w");
    int numCores = countCores();

    while (1)
    {
         // Don't block context switches, let the process sleep for some time
         sleep(1);
         // take a reading
         cpu_usage usage1 = readStats();
         // Received bytes
         int rbytes1 = open("/sys/class/net/wlo1/statistics/rx_bytes");
         // Transmitted bytes
         int tbytes1 = open("/sys/class/net/wlo1/statistics/tx_bytes");

         // wait a second and take another
         sleep(1);
         cpu_usage usage2 = readStats();
         int rbytes2 = open("/sys/class/net/wlo1/statistics/rx_bytes");
         int tbytes2 = open("/sys/class/net/wlo1/statistics/tx_bytes");

         double usagePercent = calculateUsage(usage1, usage2, numCores) * 100 ;
         int downrate = rbytes2 - rbytes1;
         int uprate = tbytes2 - tbytes1;
         // Round to 2 decimal places
         double CPU = ((int)(usagePercent * 100 + .5) / 100.0);

         // Write CPU usage to cpu.log file
         fprintf(cpulog, "%.0f\n", CPU);
         // Write down rate to down.log file
         fprintf(downlog, "%.0d\n", downrate);
         // Write up rate to up.log file
         fprintf(uplog, "%.0d\n", uprate);
         fflush(cpulog);
         fflush(downlog);
         fflush(uplog);
    }

    fclose(cpulog);
    fclose(downlog);
    fclose(uplog);
    return (0);
}
