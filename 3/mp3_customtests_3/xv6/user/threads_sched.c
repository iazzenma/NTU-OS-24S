#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

int min(int a, int b){
    return (a < b)? a:b;
}

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    struct thread *thread_with_smallest_id = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
            thread_with_smallest_id = th;
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
        r.allocated_time = thread_with_smallest_id->remaining_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;
}

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{
    //* DONE: implement the weighted round-robin scheduling algorithm
    struct thread *thread_head = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_head == NULL){
            thread_head = th;
            break;
        }
    }

    int next_release = -1;
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
            next_release = cur->release_time - args.current_time;
        }
    }

    struct threads_sched_result r;
    if (thread_head != NULL) {
        r.scheduled_thread_list_member = &thread_head->thread_list;
        r.allocated_time = min(thread_head->remaining_time, thread_head->weight * 2);
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = next_release;
    }
    return r;
}

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{
    //* DONE: implement the shortest-job-first scheduling algorithm
    struct thread *thread_shortest = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_shortest == NULL || th->remaining_time < thread_shortest->remaining_time\
        || (th->remaining_time == thread_shortest->remaining_time && th->ID < thread_shortest->ID))
            thread_shortest = th;
    }

    struct release_queue_entry *cur, *nxt;
    int next_release = -1, a_time = thread_shortest->remaining_time;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
            next_release = cur->release_time - args.current_time;
        }

        if(cur->release_time < args.current_time + a_time\
            && (cur->release_time + cur->thrd->processing_time < args.current_time + thread_shortest->remaining_time\
                || (cur->release_time + cur->thrd->processing_time == args.current_time + thread_shortest->remaining_time\
                && cur->thrd->ID < thread_shortest->ID))){ 
            a_time = cur->release_time - args.current_time;
        }
    }

    struct threads_sched_result r;
    if (thread_shortest != NULL) {
        r.scheduled_thread_list_member = &thread_shortest->thread_list;
        r.allocated_time = a_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = next_release;
    }
    return r;
}


/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    int least_slack_time = -1;
    struct thread *thread_with_least_slack = NULL, *thread_miss = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        int slack_time = th->current_deadline - args.current_time - th->remaining_time;
        if (thread_with_least_slack == NULL || slack_time < least_slack_time || (slack_time == least_slack_time && th->ID < thread_with_least_slack->ID)) {
            least_slack_time = slack_time;
            thread_with_least_slack = th;
        }
        if (th->current_deadline <= args.current_time){
            if (thread_miss == NULL || th->ID < thread_miss->ID){
                thread_miss = th;
            }
        }
    }

    int next_release = -1,\
        a_time = min(thread_with_least_slack->current_deadline - args.current_time, thread_with_least_slack->remaining_time);
    th = NULL;
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
            next_release = cur->release_time - args.current_time;
        }
        int cur_slack = cur->thrd->period - cur->thrd->processing_time,\
            tmp_slack = thread_with_least_slack->current_deadline - cur->release_time - (thread_with_least_slack->remaining_time - (cur->release_time - args.current_time)); // twls's slack time @ cur's release
        if(cur->release_time < args.current_time + a_time\
        && (cur_slack < tmp_slack || (cur_slack == tmp_slack && cur->thrd->ID < thread_with_least_slack->ID))){ 
            a_time = cur->release_time - args.current_time;
        }
    }

    struct threads_sched_result r;
    if (thread_miss != NULL) {
        r.scheduled_thread_list_member = &thread_miss->thread_list;
        r.allocated_time = 0;
    } else if (thread_with_least_slack != NULL) {
        r.scheduled_thread_list_member = &thread_with_least_slack->thread_list;
        r.allocated_time = a_time;
        // printf("%d, %d\n", thread_with_least_slack->current_deadline - args.current_time, thread_with_least_slack->remaining_time);
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = next_release; 
    }
    return r;
}


/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    // TODO: implement the deadline-monotonic scheduling algorithm
    struct thread *thread_ddl = NULL, *thread_miss = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_ddl == NULL || th->deadline < thread_ddl->deadline || (th->deadline == thread_ddl->deadline && th->ID < thread_ddl->ID))
            thread_ddl = th;
        if (th->current_deadline <= args.current_time){
            if (thread_miss == NULL || th->ID < thread_miss->ID){
                thread_miss = th;
            }
        }
    }

    int next_release = -1,\
        a_time = min(thread_ddl->current_deadline - args.current_time, thread_ddl->remaining_time);
    th = NULL;
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
            next_release = cur->release_time - args.current_time;
        }
        // printf("cur   #%d ddl = %d\n", cur->thrd->ID, cur->thrd->deadline);
        // printf("thddl #%d ddl = %d\n\n\n", thread_ddl->ID, thread_ddl->deadline);
        if(cur->release_time < args.current_time + a_time\
        && (cur->thrd->deadline < thread_ddl->deadline || (cur->thrd->deadline == thread_ddl->deadline && cur->thrd->ID < thread_ddl->ID))){ 
            a_time = cur->release_time - args.current_time;
        }
    }

    struct threads_sched_result r;
    if (thread_miss != NULL) {
        r.scheduled_thread_list_member = &thread_miss->thread_list;
        r.allocated_time = 0;
    } else if (thread_ddl != NULL) {
        r.scheduled_thread_list_member = &thread_ddl->thread_list;
        r.allocated_time = a_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = next_release;
    }
    return r;
}
