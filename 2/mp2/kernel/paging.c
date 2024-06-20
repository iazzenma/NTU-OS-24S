#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

/* NTU OS 2024 */
/* Allocate eight consecutive disk blocks. */
/* Save the content of the physical page in the pte */
/* to the disk blocks and save the block-id into the */
/* pte. */
char *swap_page_from_pte(pte_t *pte) {
  char *pa = (char*) PTE2PA(*pte);
  uint dp = balloc_page(ROOTDEV);

  write_page_to_disk(ROOTDEV, pa, dp); // write this page to disk
  *pte = (BLOCKNO2PTE(dp) | PTE_FLAGS(*pte) | PTE_S) & ~PTE_V;

  return pa;
}

/* NTU OS 2024 */
/* Page fault handler */
int handle_pgfault() {
  uint64 va = PGROUNDDOWN(r_stval());
  struct proc *p = myproc();
  pagetable_t pgtbl = p->pagetable;
  pte_t *pte = walk(pgtbl, va, 0);
  if (*pte & PTE_S){
    uint64 blockno = PTE2BLOCKNO(*pte);
    char *pa = kalloc();
    begin_op();
    read_page_from_disk(ROOTDEV, pa, blockno);
    bfree_page(ROOTDEV, blockno);
    end_op();

    *pte = PA2PTE(pa) | PTE_FLAGS(*pte);
    *pte |= PTE_V;
    *pte &= ~PTE_S;
  }
  else{
    char *pa = kalloc();
    memset(pa, 0, PGSIZE);
    mappages(pgtbl, va, PGSIZE, (uint64) pa, PTE_U | PTE_R | PTE_W | PTE_X);
  }
  return 0;
}
