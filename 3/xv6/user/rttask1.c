#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define NULL 0

int k = 0;

void f(void *arg)
{
    while (1) {
        k++;
    }
}

int main(int argc, char **argv)
{
    struct thread *t1 = thread_create(f, NULL, 1, 3, 5, 3);
    thread_add_at(t1, 0);

    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
