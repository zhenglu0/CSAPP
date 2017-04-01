/* $begin waitpid2 */
/* shows a simple change that eliminates this nondeterminism in the
output order by reaping the children in the same order that they were created by
the parent. In line 11, the parent stores the PIDs of its children in order, and then
waits for each child in this same order by calling waitpid with the appropriate
PID in the first argument.
*/
#include "csapp.h"
#define N 2

int main() 
{
    int status, i;
    pid_t pid[N], retpid;

    /* Parent creates N children */
    for (i = 0; i < N; i++) 
	if ((pid[i] = Fork()) == 0)  /* Child */          //line:ecf:waitpid2:fork
	    exit(100+i);

    /* Parent reaps N children in order */
    i = 0;
    while ((retpid = waitpid(pid[i++], &status, 0)) > 0) { //line:ecf:waitpid2:waitpid
	if (WIFEXITED(status))  
	    printf("child %d terminated normally with exit status=%d\n",
		   retpid, WEXITSTATUS(status));
	else
	    printf("child %d terminated abnormally\n", retpid);
    }
    
    /* The only normal termination is if there are no more children */
    if (errno != ECHILD) 
	unix_error("waitpid error");

    exit(0);
}
/* $end waitpid2 */
