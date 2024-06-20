#include "lru.h"

#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

void lru_init(lru_t *lru){
	lru->size = 0;
}

int lru_push(lru_t *lru, uint64 e){
	int idx = 0;
	if((idx = lru_find(lru, e)) > -1){ // already in stack
		lru_pop(lru, idx);
		lru->bucket[lru->size++] = e;
	}
	else if(lru_full(lru)){
		for(int i = 0; i < lru->size; i++){
			if(((*(pte_t *)lru->bucket[i]) & PTE_P) == 0){
				lru_pop(lru, i);
				lru->bucket[lru->size++] = e;
				break;
			}
		}
	}
	else lru->bucket[lru->size++] = e;
	return 1;
}

uint64 lru_pop(lru_t *lru, int idx){
	uint64 tmp = lru->bucket[idx];
	for(int i = idx; i < lru->size - 1; i++){
		lru->bucket[i] = lru->bucket[i+1];
	}
	lru->size--;
	return tmp;
}

int lru_empty(lru_t *lru){
	return (lru->size == 0);
}

int lru_full(lru_t *lru){
	return (lru->size == PG_BUF_SIZE);
}

int lru_clear(lru_t *lru){
	lru->size = 0;
	return 0;
}

int lru_find(lru_t *lru, uint64 e){
	int ret = -1;
	for(int i = 0; i < lru->size; i++){
		if(lru->bucket[i] == e){
			ret = i;
			break;
		}
	}
	return ret;
}
