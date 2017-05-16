/*A shell program with a subtle synchronization error. If the child
  terminates before the parent is able to run, then addjob and deletejob will be called
  in the wrong order.*/

#include "csapp.h"

pid_t rFork(void);

void initjobs()
{
    printf("initjobs\n");
}

void addjob(int pid)
{
    printf("addjob\n");
}

void deletejob(int pid)
{
    printf("deletejob\n");
}

/* $begin procmask1 */
void handler(int sig)
{
    pid_t pid;
    while ((pid = waitpid(-1, NULL, 0)) > 0) /* Reap a zombie child */
    deletejob(pid); /* Delete the child from the job list */
    if (errno != ECHILD)
    unix_error("waitpid error");
}
    
int main(int argc, char **argv)
{
    int pid;

    Signal(SIGCHLD, handler);
    initjobs(); /* Initialize the job list */

    while (1) {
        /* Child process */
        if ((pid = rFork()) == 0) {
            Execve("/bin/date", argv, NULL);
            exit(0);
        }
        /* Parent process */
        addjob(pid);  /* Add the child to the job list */
        sleep (1);
    }
    exit(0);
}
/* $end procmask1 */
