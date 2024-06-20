#include "fifo.h"

#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

void q_init(queue_t *q){
	q->size = 0;
}

int q_push(queue_t *q, uint64 e){
	if(q_find(q, e) > -1) return 1; // already in fifo
	else if(q_full(q)){
		for(int i = 0; i < q->size; i++){
			if(((*(pte_t *)q->bucket[i]) & PTE_P) == 0){
				q_pop_idx(q, i);
				q->bucket[q->size++] = e;
				break;
			}
		}
	}
	else q->bucket[q->size++] = e;
	return 1;
}

uint64 q_pop_idx(queue_t *q, int idx){
	uint64 tmp = q->bucket[idx];
	for(int i = idx; i < q->size - 1; i++){
		q->bucket[i] = q->bucket[i+1];
	}
	q->size--;
	return tmp;
}

int q_empty(queue_t *q){
	return (q->size == 0);
}

int q_full(queue_t *q){
	return (q->size == PG_BUF_SIZE);
}

int q_clear(queue_t *q){
	q->size = 0;
	return 0;
}

int q_find(queue_t *q, uint64 e){
	int ret = -1;
	for(int i = 0; i < q->size; i++){
		if(q->bucket[i] == e){
			ret = i;
			break;
		}
	}
	return ret;
}
