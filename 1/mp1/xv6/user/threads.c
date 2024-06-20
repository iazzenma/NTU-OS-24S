#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0

static struct thread* current_thread = NULL;
static struct task* current_task = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
    t->arg = arg;
    t->ID  = id;
    t->buf_set = 0;
    t->stack = (void*) new_stack;
    t->stack_p = (void*) new_stack_p;
    id++;
    
    //TODO add something for p2
    t->task_tail = NULL;
    return t;
}
void thread_add_runqueue(struct thread *t){
    //* circular ll
    if(current_thread == NULL){
        current_thread = t;
        current_thread->previous = t;
        current_thread->next = t;
    }
    else{
        t->previous = current_thread->previous;
        t->next = current_thread;
        current_thread->previous->next = t;
        current_thread->previous = t;
    }
}
void thread_yield(void){
    if(current_task != NULL){
        if(setjmp(current_task->task_env) == 0){
            current_thread->stack_p = (void *) current_task->task_env->sp;
            schedule();
            dispatch();
        }
        else return;
    }
    else if(setjmp(current_thread->env) == 0){
        current_thread->stack_p = (void *) current_thread->env->sp;
        schedule();
        dispatch();
    }
    else return;
}

void dispatch(void){
    //* task first
    while(latest_task != NULL){
        // fprintf(2, "Now TASK\n");
        current_task = latest_task;
        if(current_task->task_buf_set == 0){
            if(setjmp(current_task->task_env) == 0){
                current_task->task_env->sp = (unsigned long) current_thread->stack_p;
                current_task->task_buf_set = 1;
                longjmp(current_task->task_env, 1);
            }
            else{
                current_task->fp(current_task->arg);
                //* task_exit
                if(current_task->previous != NULL){
                    current_task->previous->next = current_task->next;
                }
                if(current_task->next != NULL){
                    current_task->next->previous = current_task->previous;
                }
                if(latest_task == current_task) latest_task = current_task->previous;
                free(current_task);
                if(setjmp(env_tmp) == 0){
                    current_thread->stack_p = (void *) env_tmp->sp;
                }
            }
        }
        else longjmp(latest_task->task_env, 1);
    }
    current_task = NULL;

    // fprintf(2, "Now THREAD\n");
    if(current_thread->buf_set == 0){
        if(setjmp(current_thread->env) == 0){
            // move the stack pointer
            current_thread->env->sp = (unsigned long) current_thread->stack_p;
            current_thread->buf_set = 1;
            longjmp(current_thread->env, 1);
        }
        else{
            current_thread->fp(current_thread->arg);
            // In case the thread function just returns
            thread_exit();
        }
    }
    else longjmp(current_thread->env, 1);
}
void schedule(void){
    current_thread = current_thread->next;
}
void thread_exit(void){
    //* remove all tasks
    while(latest_task != NULL){
        struct task *tail = latest_task;
        latest_task = latest_task->previous;
        free(tail);
    }

    if(current_thread->next != current_thread){
        current_thread->previous->next = current_thread->next;
        current_thread->next->previous = current_thread->previous;
        struct thread *tmp = current_thread;
        schedule();

        free(tmp->stack);
        free(tmp);

        dispatch();
    }
    else{
        // Hint: No more thread to execute
        free(current_thread->stack);
        free(current_thread);
        current_thread = NULL;

        longjmp(env_st, 1);
    }
}
void thread_start_threading(void){
    if(setjmp(env_st) == 0)
        dispatch();
    else return;
}
// part 2
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
    // TODO
    struct task *new = (struct task*) malloc(sizeof(struct task));
    new->fp = f;
    new->arg = arg;
    new->task_buf_set = 0;
    new->previous = t->task_tail;
    new->next = NULL;

    if(t->task_tail != NULL){
        t->task_tail->next = new;
    }
    t->task_tail = new;
}
