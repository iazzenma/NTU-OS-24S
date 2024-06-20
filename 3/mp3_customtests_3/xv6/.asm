
user/_custom_rttask6:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f>:
#define NULL 0

int k = 0;

void f(void *arg)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec22                	sd	s0,24(sp)
       4:	1000                	addi	s0,sp,32
       6:	fea43423          	sd	a0,-24(s0)
    while (1) {
        k++;
       a:	00002797          	auipc	a5,0x2
       e:	51678793          	addi	a5,a5,1302 # 2520 <k>
      12:	439c                	lw	a5,0(a5)
      14:	2785                	addiw	a5,a5,1
      16:	0007871b          	sext.w	a4,a5
      1a:	00002797          	auipc	a5,0x2
      1e:	50678793          	addi	a5,a5,1286 # 2520 <k>
      22:	c398                	sw	a4,0(a5)
      24:	b7dd                	j	a <f+0xa>

0000000000000026 <main>:
}

// 15 threads arriving @ different times w same deadline

int main(int argc, char **argv)
{   
      26:	7139                	addi	sp,sp,-64
      28:	fc06                	sd	ra,56(sp)
      2a:	f822                	sd	s0,48(sp)
      2c:	0080                	addi	s0,sp,64
      2e:	87aa                	mv	a5,a0
      30:	fcb43023          	sd	a1,-64(s0)
      34:	fcf42623          	sw	a5,-52(s0)
    struct thread *t0 = thread_create(f, NULL, 1,6,6,1);
      38:	4785                	li	a5,1
      3a:	4719                	li	a4,6
      3c:	4699                	li	a3,6
      3e:	4605                	li	a2,1
      40:	4581                	li	a1,0
      42:	00000517          	auipc	a0,0x0
      46:	fbe50513          	addi	a0,a0,-66 # 0 <f>
      4a:	00001097          	auipc	ra,0x1
      4e:	f32080e7          	jalr	-206(ra) # f7c <thread_create>
      52:	fea43023          	sd	a0,-32(s0)
    thread_add_at(t0, 19);
      56:	45cd                	li	a1,19
      58:	fe043503          	ld	a0,-32(s0)
      5c:	00001097          	auipc	ra,0x1
      60:	04c080e7          	jalr	76(ra) # 10a8 <thread_add_at>
    for(int i=2;i<=15;i++){
      64:	4789                	li	a5,2
      66:	fef42623          	sw	a5,-20(s0)
      6a:	a891                	j	be <main+0x98>
        struct thread *t = thread_create(f, NULL, 1,23-(16-i),23-(16-i),1);
      6c:	fec42783          	lw	a5,-20(s0)
      70:	279d                	addiw	a5,a5,7
      72:	0007869b          	sext.w	a3,a5
      76:	fec42783          	lw	a5,-20(s0)
      7a:	279d                	addiw	a5,a5,7
      7c:	0007871b          	sext.w	a4,a5
      80:	4785                	li	a5,1
      82:	4605                	li	a2,1
      84:	4581                	li	a1,0
      86:	00000517          	auipc	a0,0x0
      8a:	f7a50513          	addi	a0,a0,-134 # 0 <f>
      8e:	00001097          	auipc	ra,0x1
      92:	eee080e7          	jalr	-274(ra) # f7c <thread_create>
      96:	fca43c23          	sd	a0,-40(s0)
        thread_add_at(t, 16-i);
      9a:	4741                	li	a4,16
      9c:	fec42783          	lw	a5,-20(s0)
      a0:	40f707bb          	subw	a5,a4,a5
      a4:	2781                	sext.w	a5,a5
      a6:	85be                	mv	a1,a5
      a8:	fd843503          	ld	a0,-40(s0)
      ac:	00001097          	auipc	ra,0x1
      b0:	ffc080e7          	jalr	-4(ra) # 10a8 <thread_add_at>
    for(int i=2;i<=15;i++){
      b4:	fec42783          	lw	a5,-20(s0)
      b8:	2785                	addiw	a5,a5,1
      ba:	fef42623          	sw	a5,-20(s0)
      be:	fec42783          	lw	a5,-20(s0)
      c2:	0007871b          	sext.w	a4,a5
      c6:	47bd                	li	a5,15
      c8:	fae7d2e3          	bge	a5,a4,6c <main+0x46>
    }
    thread_start_threading();
      cc:	00001097          	auipc	ra,0x1
      d0:	7ea080e7          	jalr	2026(ra) # 18b6 <thread_start_threading>
    printf("\nexited\n");
      d4:	00002517          	auipc	a0,0x2
      d8:	2b450513          	addi	a0,a0,692 # 2388 <schedule_dm+0x254>
      dc:	00001097          	auipc	ra,0x1
      e0:	9e8080e7          	jalr	-1560(ra) # ac4 <printf>
    exit(0);
      e4:	4501                	li	a0,0
      e6:	00000097          	auipc	ra,0x0
      ea:	498080e7          	jalr	1176(ra) # 57e <exit>

00000000000000ee <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      ee:	7179                	addi	sp,sp,-48
      f0:	f422                	sd	s0,40(sp)
      f2:	1800                	addi	s0,sp,48
      f4:	fca43c23          	sd	a0,-40(s0)
      f8:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      fc:	fd843783          	ld	a5,-40(s0)
     100:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     104:	0001                	nop
     106:	fd043703          	ld	a4,-48(s0)
     10a:	00170793          	addi	a5,a4,1
     10e:	fcf43823          	sd	a5,-48(s0)
     112:	fd843783          	ld	a5,-40(s0)
     116:	00178693          	addi	a3,a5,1
     11a:	fcd43c23          	sd	a3,-40(s0)
     11e:	00074703          	lbu	a4,0(a4)
     122:	00e78023          	sb	a4,0(a5)
     126:	0007c783          	lbu	a5,0(a5)
     12a:	fff1                	bnez	a5,106 <strcpy+0x18>
    ;
  return os;
     12c:	fe843783          	ld	a5,-24(s0)
}
     130:	853e                	mv	a0,a5
     132:	7422                	ld	s0,40(sp)
     134:	6145                	addi	sp,sp,48
     136:	8082                	ret

0000000000000138 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     138:	1101                	addi	sp,sp,-32
     13a:	ec22                	sd	s0,24(sp)
     13c:	1000                	addi	s0,sp,32
     13e:	fea43423          	sd	a0,-24(s0)
     142:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     146:	a819                	j	15c <strcmp+0x24>
    p++, q++;
     148:	fe843783          	ld	a5,-24(s0)
     14c:	0785                	addi	a5,a5,1
     14e:	fef43423          	sd	a5,-24(s0)
     152:	fe043783          	ld	a5,-32(s0)
     156:	0785                	addi	a5,a5,1
     158:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     15c:	fe843783          	ld	a5,-24(s0)
     160:	0007c783          	lbu	a5,0(a5)
     164:	cb99                	beqz	a5,17a <strcmp+0x42>
     166:	fe843783          	ld	a5,-24(s0)
     16a:	0007c703          	lbu	a4,0(a5)
     16e:	fe043783          	ld	a5,-32(s0)
     172:	0007c783          	lbu	a5,0(a5)
     176:	fcf709e3          	beq	a4,a5,148 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     17a:	fe843783          	ld	a5,-24(s0)
     17e:	0007c783          	lbu	a5,0(a5)
     182:	0007871b          	sext.w	a4,a5
     186:	fe043783          	ld	a5,-32(s0)
     18a:	0007c783          	lbu	a5,0(a5)
     18e:	2781                	sext.w	a5,a5
     190:	40f707bb          	subw	a5,a4,a5
     194:	2781                	sext.w	a5,a5
}
     196:	853e                	mv	a0,a5
     198:	6462                	ld	s0,24(sp)
     19a:	6105                	addi	sp,sp,32
     19c:	8082                	ret

000000000000019e <strlen>:

uint
strlen(const char *s)
{
     19e:	7179                	addi	sp,sp,-48
     1a0:	f422                	sd	s0,40(sp)
     1a2:	1800                	addi	s0,sp,48
     1a4:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     1a8:	fe042623          	sw	zero,-20(s0)
     1ac:	a031                	j	1b8 <strlen+0x1a>
     1ae:	fec42783          	lw	a5,-20(s0)
     1b2:	2785                	addiw	a5,a5,1
     1b4:	fef42623          	sw	a5,-20(s0)
     1b8:	fec42783          	lw	a5,-20(s0)
     1bc:	fd843703          	ld	a4,-40(s0)
     1c0:	97ba                	add	a5,a5,a4
     1c2:	0007c783          	lbu	a5,0(a5)
     1c6:	f7e5                	bnez	a5,1ae <strlen+0x10>
    ;
  return n;
     1c8:	fec42783          	lw	a5,-20(s0)
}
     1cc:	853e                	mv	a0,a5
     1ce:	7422                	ld	s0,40(sp)
     1d0:	6145                	addi	sp,sp,48
     1d2:	8082                	ret

00000000000001d4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1d4:	7179                	addi	sp,sp,-48
     1d6:	f422                	sd	s0,40(sp)
     1d8:	1800                	addi	s0,sp,48
     1da:	fca43c23          	sd	a0,-40(s0)
     1de:	87ae                	mv	a5,a1
     1e0:	8732                	mv	a4,a2
     1e2:	fcf42a23          	sw	a5,-44(s0)
     1e6:	87ba                	mv	a5,a4
     1e8:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1ec:	fd843783          	ld	a5,-40(s0)
     1f0:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1f4:	fe042623          	sw	zero,-20(s0)
     1f8:	a00d                	j	21a <memset+0x46>
    cdst[i] = c;
     1fa:	fec42783          	lw	a5,-20(s0)
     1fe:	fe043703          	ld	a4,-32(s0)
     202:	97ba                	add	a5,a5,a4
     204:	fd442703          	lw	a4,-44(s0)
     208:	0ff77713          	andi	a4,a4,255
     20c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     210:	fec42783          	lw	a5,-20(s0)
     214:	2785                	addiw	a5,a5,1
     216:	fef42623          	sw	a5,-20(s0)
     21a:	fec42703          	lw	a4,-20(s0)
     21e:	fd042783          	lw	a5,-48(s0)
     222:	2781                	sext.w	a5,a5
     224:	fcf76be3          	bltu	a4,a5,1fa <memset+0x26>
  }
  return dst;
     228:	fd843783          	ld	a5,-40(s0)
}
     22c:	853e                	mv	a0,a5
     22e:	7422                	ld	s0,40(sp)
     230:	6145                	addi	sp,sp,48
     232:	8082                	ret

0000000000000234 <strchr>:

char*
strchr(const char *s, char c)
{
     234:	1101                	addi	sp,sp,-32
     236:	ec22                	sd	s0,24(sp)
     238:	1000                	addi	s0,sp,32
     23a:	fea43423          	sd	a0,-24(s0)
     23e:	87ae                	mv	a5,a1
     240:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     244:	a01d                	j	26a <strchr+0x36>
    if(*s == c)
     246:	fe843783          	ld	a5,-24(s0)
     24a:	0007c703          	lbu	a4,0(a5)
     24e:	fe744783          	lbu	a5,-25(s0)
     252:	0ff7f793          	andi	a5,a5,255
     256:	00e79563          	bne	a5,a4,260 <strchr+0x2c>
      return (char*)s;
     25a:	fe843783          	ld	a5,-24(s0)
     25e:	a821                	j	276 <strchr+0x42>
  for(; *s; s++)
     260:	fe843783          	ld	a5,-24(s0)
     264:	0785                	addi	a5,a5,1
     266:	fef43423          	sd	a5,-24(s0)
     26a:	fe843783          	ld	a5,-24(s0)
     26e:	0007c783          	lbu	a5,0(a5)
     272:	fbf1                	bnez	a5,246 <strchr+0x12>
  return 0;
     274:	4781                	li	a5,0
}
     276:	853e                	mv	a0,a5
     278:	6462                	ld	s0,24(sp)
     27a:	6105                	addi	sp,sp,32
     27c:	8082                	ret

000000000000027e <gets>:

char*
gets(char *buf, int max)
{
     27e:	7179                	addi	sp,sp,-48
     280:	f406                	sd	ra,40(sp)
     282:	f022                	sd	s0,32(sp)
     284:	1800                	addi	s0,sp,48
     286:	fca43c23          	sd	a0,-40(s0)
     28a:	87ae                	mv	a5,a1
     28c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     290:	fe042623          	sw	zero,-20(s0)
     294:	a8a1                	j	2ec <gets+0x6e>
    cc = read(0, &c, 1);
     296:	fe740793          	addi	a5,s0,-25
     29a:	4605                	li	a2,1
     29c:	85be                	mv	a1,a5
     29e:	4501                	li	a0,0
     2a0:	00000097          	auipc	ra,0x0
     2a4:	2f6080e7          	jalr	758(ra) # 596 <read>
     2a8:	87aa                	mv	a5,a0
     2aa:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     2ae:	fe842783          	lw	a5,-24(s0)
     2b2:	2781                	sext.w	a5,a5
     2b4:	04f05763          	blez	a5,302 <gets+0x84>
      break;
    buf[i++] = c;
     2b8:	fec42783          	lw	a5,-20(s0)
     2bc:	0017871b          	addiw	a4,a5,1
     2c0:	fee42623          	sw	a4,-20(s0)
     2c4:	873e                	mv	a4,a5
     2c6:	fd843783          	ld	a5,-40(s0)
     2ca:	97ba                	add	a5,a5,a4
     2cc:	fe744703          	lbu	a4,-25(s0)
     2d0:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     2d4:	fe744783          	lbu	a5,-25(s0)
     2d8:	873e                	mv	a4,a5
     2da:	47a9                	li	a5,10
     2dc:	02f70463          	beq	a4,a5,304 <gets+0x86>
     2e0:	fe744783          	lbu	a5,-25(s0)
     2e4:	873e                	mv	a4,a5
     2e6:	47b5                	li	a5,13
     2e8:	00f70e63          	beq	a4,a5,304 <gets+0x86>
  for(i=0; i+1 < max; ){
     2ec:	fec42783          	lw	a5,-20(s0)
     2f0:	2785                	addiw	a5,a5,1
     2f2:	0007871b          	sext.w	a4,a5
     2f6:	fd442783          	lw	a5,-44(s0)
     2fa:	2781                	sext.w	a5,a5
     2fc:	f8f74de3          	blt	a4,a5,296 <gets+0x18>
     300:	a011                	j	304 <gets+0x86>
      break;
     302:	0001                	nop
      break;
  }
  buf[i] = '\0';
     304:	fec42783          	lw	a5,-20(s0)
     308:	fd843703          	ld	a4,-40(s0)
     30c:	97ba                	add	a5,a5,a4
     30e:	00078023          	sb	zero,0(a5)
  return buf;
     312:	fd843783          	ld	a5,-40(s0)
}
     316:	853e                	mv	a0,a5
     318:	70a2                	ld	ra,40(sp)
     31a:	7402                	ld	s0,32(sp)
     31c:	6145                	addi	sp,sp,48
     31e:	8082                	ret

0000000000000320 <stat>:

int
stat(const char *n, struct stat *st)
{
     320:	7179                	addi	sp,sp,-48
     322:	f406                	sd	ra,40(sp)
     324:	f022                	sd	s0,32(sp)
     326:	1800                	addi	s0,sp,48
     328:	fca43c23          	sd	a0,-40(s0)
     32c:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     330:	4581                	li	a1,0
     332:	fd843503          	ld	a0,-40(s0)
     336:	00000097          	auipc	ra,0x0
     33a:	288080e7          	jalr	648(ra) # 5be <open>
     33e:	87aa                	mv	a5,a0
     340:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     344:	fec42783          	lw	a5,-20(s0)
     348:	2781                	sext.w	a5,a5
     34a:	0007d463          	bgez	a5,352 <stat+0x32>
    return -1;
     34e:	57fd                	li	a5,-1
     350:	a035                	j	37c <stat+0x5c>
  r = fstat(fd, st);
     352:	fec42783          	lw	a5,-20(s0)
     356:	fd043583          	ld	a1,-48(s0)
     35a:	853e                	mv	a0,a5
     35c:	00000097          	auipc	ra,0x0
     360:	27a080e7          	jalr	634(ra) # 5d6 <fstat>
     364:	87aa                	mv	a5,a0
     366:	fef42423          	sw	a5,-24(s0)
  close(fd);
     36a:	fec42783          	lw	a5,-20(s0)
     36e:	853e                	mv	a0,a5
     370:	00000097          	auipc	ra,0x0
     374:	236080e7          	jalr	566(ra) # 5a6 <close>
  return r;
     378:	fe842783          	lw	a5,-24(s0)
}
     37c:	853e                	mv	a0,a5
     37e:	70a2                	ld	ra,40(sp)
     380:	7402                	ld	s0,32(sp)
     382:	6145                	addi	sp,sp,48
     384:	8082                	ret

0000000000000386 <atoi>:

int
atoi(const char *s)
{
     386:	7179                	addi	sp,sp,-48
     388:	f422                	sd	s0,40(sp)
     38a:	1800                	addi	s0,sp,48
     38c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     390:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     394:	a815                	j	3c8 <atoi+0x42>
    n = n*10 + *s++ - '0';
     396:	fec42703          	lw	a4,-20(s0)
     39a:	87ba                	mv	a5,a4
     39c:	0027979b          	slliw	a5,a5,0x2
     3a0:	9fb9                	addw	a5,a5,a4
     3a2:	0017979b          	slliw	a5,a5,0x1
     3a6:	0007871b          	sext.w	a4,a5
     3aa:	fd843783          	ld	a5,-40(s0)
     3ae:	00178693          	addi	a3,a5,1
     3b2:	fcd43c23          	sd	a3,-40(s0)
     3b6:	0007c783          	lbu	a5,0(a5)
     3ba:	2781                	sext.w	a5,a5
     3bc:	9fb9                	addw	a5,a5,a4
     3be:	2781                	sext.w	a5,a5
     3c0:	fd07879b          	addiw	a5,a5,-48
     3c4:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     3c8:	fd843783          	ld	a5,-40(s0)
     3cc:	0007c783          	lbu	a5,0(a5)
     3d0:	873e                	mv	a4,a5
     3d2:	02f00793          	li	a5,47
     3d6:	00e7fb63          	bgeu	a5,a4,3ec <atoi+0x66>
     3da:	fd843783          	ld	a5,-40(s0)
     3de:	0007c783          	lbu	a5,0(a5)
     3e2:	873e                	mv	a4,a5
     3e4:	03900793          	li	a5,57
     3e8:	fae7f7e3          	bgeu	a5,a4,396 <atoi+0x10>
  return n;
     3ec:	fec42783          	lw	a5,-20(s0)
}
     3f0:	853e                	mv	a0,a5
     3f2:	7422                	ld	s0,40(sp)
     3f4:	6145                	addi	sp,sp,48
     3f6:	8082                	ret

00000000000003f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3f8:	7139                	addi	sp,sp,-64
     3fa:	fc22                	sd	s0,56(sp)
     3fc:	0080                	addi	s0,sp,64
     3fe:	fca43c23          	sd	a0,-40(s0)
     402:	fcb43823          	sd	a1,-48(s0)
     406:	87b2                	mv	a5,a2
     408:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     40c:	fd843783          	ld	a5,-40(s0)
     410:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     414:	fd043783          	ld	a5,-48(s0)
     418:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     41c:	fe043703          	ld	a4,-32(s0)
     420:	fe843783          	ld	a5,-24(s0)
     424:	02e7fc63          	bgeu	a5,a4,45c <memmove+0x64>
    while(n-- > 0)
     428:	a00d                	j	44a <memmove+0x52>
      *dst++ = *src++;
     42a:	fe043703          	ld	a4,-32(s0)
     42e:	00170793          	addi	a5,a4,1
     432:	fef43023          	sd	a5,-32(s0)
     436:	fe843783          	ld	a5,-24(s0)
     43a:	00178693          	addi	a3,a5,1
     43e:	fed43423          	sd	a3,-24(s0)
     442:	00074703          	lbu	a4,0(a4)
     446:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     44a:	fcc42783          	lw	a5,-52(s0)
     44e:	fff7871b          	addiw	a4,a5,-1
     452:	fce42623          	sw	a4,-52(s0)
     456:	fcf04ae3          	bgtz	a5,42a <memmove+0x32>
     45a:	a891                	j	4ae <memmove+0xb6>
  } else {
    dst += n;
     45c:	fcc42783          	lw	a5,-52(s0)
     460:	fe843703          	ld	a4,-24(s0)
     464:	97ba                	add	a5,a5,a4
     466:	fef43423          	sd	a5,-24(s0)
    src += n;
     46a:	fcc42783          	lw	a5,-52(s0)
     46e:	fe043703          	ld	a4,-32(s0)
     472:	97ba                	add	a5,a5,a4
     474:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     478:	a01d                	j	49e <memmove+0xa6>
      *--dst = *--src;
     47a:	fe043783          	ld	a5,-32(s0)
     47e:	17fd                	addi	a5,a5,-1
     480:	fef43023          	sd	a5,-32(s0)
     484:	fe843783          	ld	a5,-24(s0)
     488:	17fd                	addi	a5,a5,-1
     48a:	fef43423          	sd	a5,-24(s0)
     48e:	fe043783          	ld	a5,-32(s0)
     492:	0007c703          	lbu	a4,0(a5)
     496:	fe843783          	ld	a5,-24(s0)
     49a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     49e:	fcc42783          	lw	a5,-52(s0)
     4a2:	fff7871b          	addiw	a4,a5,-1
     4a6:	fce42623          	sw	a4,-52(s0)
     4aa:	fcf048e3          	bgtz	a5,47a <memmove+0x82>
  }
  return vdst;
     4ae:	fd843783          	ld	a5,-40(s0)
}
     4b2:	853e                	mv	a0,a5
     4b4:	7462                	ld	s0,56(sp)
     4b6:	6121                	addi	sp,sp,64
     4b8:	8082                	ret

00000000000004ba <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     4ba:	7139                	addi	sp,sp,-64
     4bc:	fc22                	sd	s0,56(sp)
     4be:	0080                	addi	s0,sp,64
     4c0:	fca43c23          	sd	a0,-40(s0)
     4c4:	fcb43823          	sd	a1,-48(s0)
     4c8:	87b2                	mv	a5,a2
     4ca:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     4ce:	fd843783          	ld	a5,-40(s0)
     4d2:	fef43423          	sd	a5,-24(s0)
     4d6:	fd043783          	ld	a5,-48(s0)
     4da:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4de:	a0a1                	j	526 <memcmp+0x6c>
    if (*p1 != *p2) {
     4e0:	fe843783          	ld	a5,-24(s0)
     4e4:	0007c703          	lbu	a4,0(a5)
     4e8:	fe043783          	ld	a5,-32(s0)
     4ec:	0007c783          	lbu	a5,0(a5)
     4f0:	02f70163          	beq	a4,a5,512 <memcmp+0x58>
      return *p1 - *p2;
     4f4:	fe843783          	ld	a5,-24(s0)
     4f8:	0007c783          	lbu	a5,0(a5)
     4fc:	0007871b          	sext.w	a4,a5
     500:	fe043783          	ld	a5,-32(s0)
     504:	0007c783          	lbu	a5,0(a5)
     508:	2781                	sext.w	a5,a5
     50a:	40f707bb          	subw	a5,a4,a5
     50e:	2781                	sext.w	a5,a5
     510:	a01d                	j	536 <memcmp+0x7c>
    }
    p1++;
     512:	fe843783          	ld	a5,-24(s0)
     516:	0785                	addi	a5,a5,1
     518:	fef43423          	sd	a5,-24(s0)
    p2++;
     51c:	fe043783          	ld	a5,-32(s0)
     520:	0785                	addi	a5,a5,1
     522:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     526:	fcc42783          	lw	a5,-52(s0)
     52a:	fff7871b          	addiw	a4,a5,-1
     52e:	fce42623          	sw	a4,-52(s0)
     532:	f7dd                	bnez	a5,4e0 <memcmp+0x26>
  }
  return 0;
     534:	4781                	li	a5,0
}
     536:	853e                	mv	a0,a5
     538:	7462                	ld	s0,56(sp)
     53a:	6121                	addi	sp,sp,64
     53c:	8082                	ret

000000000000053e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     53e:	7179                	addi	sp,sp,-48
     540:	f406                	sd	ra,40(sp)
     542:	f022                	sd	s0,32(sp)
     544:	1800                	addi	s0,sp,48
     546:	fea43423          	sd	a0,-24(s0)
     54a:	feb43023          	sd	a1,-32(s0)
     54e:	87b2                	mv	a5,a2
     550:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     554:	fdc42783          	lw	a5,-36(s0)
     558:	863e                	mv	a2,a5
     55a:	fe043583          	ld	a1,-32(s0)
     55e:	fe843503          	ld	a0,-24(s0)
     562:	00000097          	auipc	ra,0x0
     566:	e96080e7          	jalr	-362(ra) # 3f8 <memmove>
     56a:	87aa                	mv	a5,a0
}
     56c:	853e                	mv	a0,a5
     56e:	70a2                	ld	ra,40(sp)
     570:	7402                	ld	s0,32(sp)
     572:	6145                	addi	sp,sp,48
     574:	8082                	ret

0000000000000576 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     576:	4885                	li	a7,1
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <exit>:
.global exit
exit:
 li a7, SYS_exit
     57e:	4889                	li	a7,2
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <wait>:
.global wait
wait:
 li a7, SYS_wait
     586:	488d                	li	a7,3
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     58e:	4891                	li	a7,4
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <read>:
.global read
read:
 li a7, SYS_read
     596:	4895                	li	a7,5
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <write>:
.global write
write:
 li a7, SYS_write
     59e:	48c1                	li	a7,16
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <close>:
.global close
close:
 li a7, SYS_close
     5a6:	48d5                	li	a7,21
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <kill>:
.global kill
kill:
 li a7, SYS_kill
     5ae:	4899                	li	a7,6
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <exec>:
.global exec
exec:
 li a7, SYS_exec
     5b6:	489d                	li	a7,7
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <open>:
.global open
open:
 li a7, SYS_open
     5be:	48bd                	li	a7,15
 ecall
     5c0:	00000073          	ecall
 ret
     5c4:	8082                	ret

00000000000005c6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     5c6:	48c5                	li	a7,17
 ecall
     5c8:	00000073          	ecall
 ret
     5cc:	8082                	ret

00000000000005ce <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     5ce:	48c9                	li	a7,18
 ecall
     5d0:	00000073          	ecall
 ret
     5d4:	8082                	ret

00000000000005d6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5d6:	48a1                	li	a7,8
 ecall
     5d8:	00000073          	ecall
 ret
     5dc:	8082                	ret

00000000000005de <link>:
.global link
link:
 li a7, SYS_link
     5de:	48cd                	li	a7,19
 ecall
     5e0:	00000073          	ecall
 ret
     5e4:	8082                	ret

00000000000005e6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5e6:	48d1                	li	a7,20
 ecall
     5e8:	00000073          	ecall
 ret
     5ec:	8082                	ret

00000000000005ee <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5ee:	48a5                	li	a7,9
 ecall
     5f0:	00000073          	ecall
 ret
     5f4:	8082                	ret

00000000000005f6 <dup>:
.global dup
dup:
 li a7, SYS_dup
     5f6:	48a9                	li	a7,10
 ecall
     5f8:	00000073          	ecall
 ret
     5fc:	8082                	ret

00000000000005fe <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5fe:	48ad                	li	a7,11
 ecall
     600:	00000073          	ecall
 ret
     604:	8082                	ret

0000000000000606 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     606:	48b1                	li	a7,12
 ecall
     608:	00000073          	ecall
 ret
     60c:	8082                	ret

000000000000060e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     60e:	48b5                	li	a7,13
 ecall
     610:	00000073          	ecall
 ret
     614:	8082                	ret

0000000000000616 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     616:	48b9                	li	a7,14
 ecall
     618:	00000073          	ecall
 ret
     61c:	8082                	ret

000000000000061e <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     61e:	48d9                	li	a7,22
 ecall
     620:	00000073          	ecall
 ret
     624:	8082                	ret

0000000000000626 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     626:	48dd                	li	a7,23
 ecall
     628:	00000073          	ecall
 ret
     62c:	8082                	ret

000000000000062e <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     62e:	48e1                	li	a7,24
 ecall
     630:	00000073          	ecall
 ret
     634:	8082                	ret

0000000000000636 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     636:	1101                	addi	sp,sp,-32
     638:	ec06                	sd	ra,24(sp)
     63a:	e822                	sd	s0,16(sp)
     63c:	1000                	addi	s0,sp,32
     63e:	87aa                	mv	a5,a0
     640:	872e                	mv	a4,a1
     642:	fef42623          	sw	a5,-20(s0)
     646:	87ba                	mv	a5,a4
     648:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     64c:	feb40713          	addi	a4,s0,-21
     650:	fec42783          	lw	a5,-20(s0)
     654:	4605                	li	a2,1
     656:	85ba                	mv	a1,a4
     658:	853e                	mv	a0,a5
     65a:	00000097          	auipc	ra,0x0
     65e:	f44080e7          	jalr	-188(ra) # 59e <write>
}
     662:	0001                	nop
     664:	60e2                	ld	ra,24(sp)
     666:	6442                	ld	s0,16(sp)
     668:	6105                	addi	sp,sp,32
     66a:	8082                	ret

000000000000066c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     66c:	7139                	addi	sp,sp,-64
     66e:	fc06                	sd	ra,56(sp)
     670:	f822                	sd	s0,48(sp)
     672:	0080                	addi	s0,sp,64
     674:	87aa                	mv	a5,a0
     676:	8736                	mv	a4,a3
     678:	fcf42623          	sw	a5,-52(s0)
     67c:	87ae                	mv	a5,a1
     67e:	fcf42423          	sw	a5,-56(s0)
     682:	87b2                	mv	a5,a2
     684:	fcf42223          	sw	a5,-60(s0)
     688:	87ba                	mv	a5,a4
     68a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     68e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     692:	fc042783          	lw	a5,-64(s0)
     696:	2781                	sext.w	a5,a5
     698:	c38d                	beqz	a5,6ba <printint+0x4e>
     69a:	fc842783          	lw	a5,-56(s0)
     69e:	2781                	sext.w	a5,a5
     6a0:	0007dd63          	bgez	a5,6ba <printint+0x4e>
    neg = 1;
     6a4:	4785                	li	a5,1
     6a6:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     6aa:	fc842783          	lw	a5,-56(s0)
     6ae:	40f007bb          	negw	a5,a5
     6b2:	2781                	sext.w	a5,a5
     6b4:	fef42223          	sw	a5,-28(s0)
     6b8:	a029                	j	6c2 <printint+0x56>
  } else {
    x = xx;
     6ba:	fc842783          	lw	a5,-56(s0)
     6be:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     6c2:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     6c6:	fc442783          	lw	a5,-60(s0)
     6ca:	fe442703          	lw	a4,-28(s0)
     6ce:	02f777bb          	remuw	a5,a4,a5
     6d2:	0007861b          	sext.w	a2,a5
     6d6:	fec42783          	lw	a5,-20(s0)
     6da:	0017871b          	addiw	a4,a5,1
     6de:	fee42623          	sw	a4,-20(s0)
     6e2:	00002697          	auipc	a3,0x2
     6e6:	dfe68693          	addi	a3,a3,-514 # 24e0 <digits>
     6ea:	02061713          	slli	a4,a2,0x20
     6ee:	9301                	srli	a4,a4,0x20
     6f0:	9736                	add	a4,a4,a3
     6f2:	00074703          	lbu	a4,0(a4)
     6f6:	ff040693          	addi	a3,s0,-16
     6fa:	97b6                	add	a5,a5,a3
     6fc:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     700:	fc442783          	lw	a5,-60(s0)
     704:	fe442703          	lw	a4,-28(s0)
     708:	02f757bb          	divuw	a5,a4,a5
     70c:	fef42223          	sw	a5,-28(s0)
     710:	fe442783          	lw	a5,-28(s0)
     714:	2781                	sext.w	a5,a5
     716:	fbc5                	bnez	a5,6c6 <printint+0x5a>
  if(neg)
     718:	fe842783          	lw	a5,-24(s0)
     71c:	2781                	sext.w	a5,a5
     71e:	cf95                	beqz	a5,75a <printint+0xee>
    buf[i++] = '-';
     720:	fec42783          	lw	a5,-20(s0)
     724:	0017871b          	addiw	a4,a5,1
     728:	fee42623          	sw	a4,-20(s0)
     72c:	ff040713          	addi	a4,s0,-16
     730:	97ba                	add	a5,a5,a4
     732:	02d00713          	li	a4,45
     736:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     73a:	a005                	j	75a <printint+0xee>
    putc(fd, buf[i]);
     73c:	fec42783          	lw	a5,-20(s0)
     740:	ff040713          	addi	a4,s0,-16
     744:	97ba                	add	a5,a5,a4
     746:	fe07c703          	lbu	a4,-32(a5)
     74a:	fcc42783          	lw	a5,-52(s0)
     74e:	85ba                	mv	a1,a4
     750:	853e                	mv	a0,a5
     752:	00000097          	auipc	ra,0x0
     756:	ee4080e7          	jalr	-284(ra) # 636 <putc>
  while(--i >= 0)
     75a:	fec42783          	lw	a5,-20(s0)
     75e:	37fd                	addiw	a5,a5,-1
     760:	fef42623          	sw	a5,-20(s0)
     764:	fec42783          	lw	a5,-20(s0)
     768:	2781                	sext.w	a5,a5
     76a:	fc07d9e3          	bgez	a5,73c <printint+0xd0>
}
     76e:	0001                	nop
     770:	0001                	nop
     772:	70e2                	ld	ra,56(sp)
     774:	7442                	ld	s0,48(sp)
     776:	6121                	addi	sp,sp,64
     778:	8082                	ret

000000000000077a <printptr>:

static void
printptr(int fd, uint64 x) {
     77a:	7179                	addi	sp,sp,-48
     77c:	f406                	sd	ra,40(sp)
     77e:	f022                	sd	s0,32(sp)
     780:	1800                	addi	s0,sp,48
     782:	87aa                	mv	a5,a0
     784:	fcb43823          	sd	a1,-48(s0)
     788:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     78c:	fdc42783          	lw	a5,-36(s0)
     790:	03000593          	li	a1,48
     794:	853e                	mv	a0,a5
     796:	00000097          	auipc	ra,0x0
     79a:	ea0080e7          	jalr	-352(ra) # 636 <putc>
  putc(fd, 'x');
     79e:	fdc42783          	lw	a5,-36(s0)
     7a2:	07800593          	li	a1,120
     7a6:	853e                	mv	a0,a5
     7a8:	00000097          	auipc	ra,0x0
     7ac:	e8e080e7          	jalr	-370(ra) # 636 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7b0:	fe042623          	sw	zero,-20(s0)
     7b4:	a82d                	j	7ee <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     7b6:	fd043783          	ld	a5,-48(s0)
     7ba:	93f1                	srli	a5,a5,0x3c
     7bc:	00002717          	auipc	a4,0x2
     7c0:	d2470713          	addi	a4,a4,-732 # 24e0 <digits>
     7c4:	97ba                	add	a5,a5,a4
     7c6:	0007c703          	lbu	a4,0(a5)
     7ca:	fdc42783          	lw	a5,-36(s0)
     7ce:	85ba                	mv	a1,a4
     7d0:	853e                	mv	a0,a5
     7d2:	00000097          	auipc	ra,0x0
     7d6:	e64080e7          	jalr	-412(ra) # 636 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7da:	fec42783          	lw	a5,-20(s0)
     7de:	2785                	addiw	a5,a5,1
     7e0:	fef42623          	sw	a5,-20(s0)
     7e4:	fd043783          	ld	a5,-48(s0)
     7e8:	0792                	slli	a5,a5,0x4
     7ea:	fcf43823          	sd	a5,-48(s0)
     7ee:	fec42783          	lw	a5,-20(s0)
     7f2:	873e                	mv	a4,a5
     7f4:	47bd                	li	a5,15
     7f6:	fce7f0e3          	bgeu	a5,a4,7b6 <printptr+0x3c>
}
     7fa:	0001                	nop
     7fc:	0001                	nop
     7fe:	70a2                	ld	ra,40(sp)
     800:	7402                	ld	s0,32(sp)
     802:	6145                	addi	sp,sp,48
     804:	8082                	ret

0000000000000806 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     806:	715d                	addi	sp,sp,-80
     808:	e486                	sd	ra,72(sp)
     80a:	e0a2                	sd	s0,64(sp)
     80c:	0880                	addi	s0,sp,80
     80e:	87aa                	mv	a5,a0
     810:	fcb43023          	sd	a1,-64(s0)
     814:	fac43c23          	sd	a2,-72(s0)
     818:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     81c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     820:	fe042223          	sw	zero,-28(s0)
     824:	a42d                	j	a4e <vprintf+0x248>
    c = fmt[i] & 0xff;
     826:	fe442783          	lw	a5,-28(s0)
     82a:	fc043703          	ld	a4,-64(s0)
     82e:	97ba                	add	a5,a5,a4
     830:	0007c783          	lbu	a5,0(a5)
     834:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     838:	fe042783          	lw	a5,-32(s0)
     83c:	2781                	sext.w	a5,a5
     83e:	eb9d                	bnez	a5,874 <vprintf+0x6e>
      if(c == '%'){
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	02500793          	li	a5,37
     84c:	00f71763          	bne	a4,a5,85a <vprintf+0x54>
        state = '%';
     850:	02500793          	li	a5,37
     854:	fef42023          	sw	a5,-32(s0)
     858:	a2f5                	j	a44 <vprintf+0x23e>
      } else {
        putc(fd, c);
     85a:	fdc42783          	lw	a5,-36(s0)
     85e:	0ff7f713          	andi	a4,a5,255
     862:	fcc42783          	lw	a5,-52(s0)
     866:	85ba                	mv	a1,a4
     868:	853e                	mv	a0,a5
     86a:	00000097          	auipc	ra,0x0
     86e:	dcc080e7          	jalr	-564(ra) # 636 <putc>
     872:	aac9                	j	a44 <vprintf+0x23e>
      }
    } else if(state == '%'){
     874:	fe042783          	lw	a5,-32(s0)
     878:	0007871b          	sext.w	a4,a5
     87c:	02500793          	li	a5,37
     880:	1cf71263          	bne	a4,a5,a44 <vprintf+0x23e>
      if(c == 'd'){
     884:	fdc42783          	lw	a5,-36(s0)
     888:	0007871b          	sext.w	a4,a5
     88c:	06400793          	li	a5,100
     890:	02f71463          	bne	a4,a5,8b8 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     894:	fb843783          	ld	a5,-72(s0)
     898:	00878713          	addi	a4,a5,8
     89c:	fae43c23          	sd	a4,-72(s0)
     8a0:	4398                	lw	a4,0(a5)
     8a2:	fcc42783          	lw	a5,-52(s0)
     8a6:	4685                	li	a3,1
     8a8:	4629                	li	a2,10
     8aa:	85ba                	mv	a1,a4
     8ac:	853e                	mv	a0,a5
     8ae:	00000097          	auipc	ra,0x0
     8b2:	dbe080e7          	jalr	-578(ra) # 66c <printint>
     8b6:	a269                	j	a40 <vprintf+0x23a>
      } else if(c == 'l') {
     8b8:	fdc42783          	lw	a5,-36(s0)
     8bc:	0007871b          	sext.w	a4,a5
     8c0:	06c00793          	li	a5,108
     8c4:	02f71663          	bne	a4,a5,8f0 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     8c8:	fb843783          	ld	a5,-72(s0)
     8cc:	00878713          	addi	a4,a5,8
     8d0:	fae43c23          	sd	a4,-72(s0)
     8d4:	639c                	ld	a5,0(a5)
     8d6:	0007871b          	sext.w	a4,a5
     8da:	fcc42783          	lw	a5,-52(s0)
     8de:	4681                	li	a3,0
     8e0:	4629                	li	a2,10
     8e2:	85ba                	mv	a1,a4
     8e4:	853e                	mv	a0,a5
     8e6:	00000097          	auipc	ra,0x0
     8ea:	d86080e7          	jalr	-634(ra) # 66c <printint>
     8ee:	aa89                	j	a40 <vprintf+0x23a>
      } else if(c == 'x') {
     8f0:	fdc42783          	lw	a5,-36(s0)
     8f4:	0007871b          	sext.w	a4,a5
     8f8:	07800793          	li	a5,120
     8fc:	02f71463          	bne	a4,a5,924 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     900:	fb843783          	ld	a5,-72(s0)
     904:	00878713          	addi	a4,a5,8
     908:	fae43c23          	sd	a4,-72(s0)
     90c:	4398                	lw	a4,0(a5)
     90e:	fcc42783          	lw	a5,-52(s0)
     912:	4681                	li	a3,0
     914:	4641                	li	a2,16
     916:	85ba                	mv	a1,a4
     918:	853e                	mv	a0,a5
     91a:	00000097          	auipc	ra,0x0
     91e:	d52080e7          	jalr	-686(ra) # 66c <printint>
     922:	aa39                	j	a40 <vprintf+0x23a>
      } else if(c == 'p') {
     924:	fdc42783          	lw	a5,-36(s0)
     928:	0007871b          	sext.w	a4,a5
     92c:	07000793          	li	a5,112
     930:	02f71263          	bne	a4,a5,954 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     934:	fb843783          	ld	a5,-72(s0)
     938:	00878713          	addi	a4,a5,8
     93c:	fae43c23          	sd	a4,-72(s0)
     940:	6398                	ld	a4,0(a5)
     942:	fcc42783          	lw	a5,-52(s0)
     946:	85ba                	mv	a1,a4
     948:	853e                	mv	a0,a5
     94a:	00000097          	auipc	ra,0x0
     94e:	e30080e7          	jalr	-464(ra) # 77a <printptr>
     952:	a0fd                	j	a40 <vprintf+0x23a>
      } else if(c == 's'){
     954:	fdc42783          	lw	a5,-36(s0)
     958:	0007871b          	sext.w	a4,a5
     95c:	07300793          	li	a5,115
     960:	04f71c63          	bne	a4,a5,9b8 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     964:	fb843783          	ld	a5,-72(s0)
     968:	00878713          	addi	a4,a5,8
     96c:	fae43c23          	sd	a4,-72(s0)
     970:	639c                	ld	a5,0(a5)
     972:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     976:	fe843783          	ld	a5,-24(s0)
     97a:	eb8d                	bnez	a5,9ac <vprintf+0x1a6>
          s = "(null)";
     97c:	00002797          	auipc	a5,0x2
     980:	a1c78793          	addi	a5,a5,-1508 # 2398 <schedule_dm+0x264>
     984:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     988:	a015                	j	9ac <vprintf+0x1a6>
          putc(fd, *s);
     98a:	fe843783          	ld	a5,-24(s0)
     98e:	0007c703          	lbu	a4,0(a5)
     992:	fcc42783          	lw	a5,-52(s0)
     996:	85ba                	mv	a1,a4
     998:	853e                	mv	a0,a5
     99a:	00000097          	auipc	ra,0x0
     99e:	c9c080e7          	jalr	-868(ra) # 636 <putc>
          s++;
     9a2:	fe843783          	ld	a5,-24(s0)
     9a6:	0785                	addi	a5,a5,1
     9a8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9ac:	fe843783          	ld	a5,-24(s0)
     9b0:	0007c783          	lbu	a5,0(a5)
     9b4:	fbf9                	bnez	a5,98a <vprintf+0x184>
     9b6:	a069                	j	a40 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     9b8:	fdc42783          	lw	a5,-36(s0)
     9bc:	0007871b          	sext.w	a4,a5
     9c0:	06300793          	li	a5,99
     9c4:	02f71463          	bne	a4,a5,9ec <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     9c8:	fb843783          	ld	a5,-72(s0)
     9cc:	00878713          	addi	a4,a5,8
     9d0:	fae43c23          	sd	a4,-72(s0)
     9d4:	439c                	lw	a5,0(a5)
     9d6:	0ff7f713          	andi	a4,a5,255
     9da:	fcc42783          	lw	a5,-52(s0)
     9de:	85ba                	mv	a1,a4
     9e0:	853e                	mv	a0,a5
     9e2:	00000097          	auipc	ra,0x0
     9e6:	c54080e7          	jalr	-940(ra) # 636 <putc>
     9ea:	a899                	j	a40 <vprintf+0x23a>
      } else if(c == '%'){
     9ec:	fdc42783          	lw	a5,-36(s0)
     9f0:	0007871b          	sext.w	a4,a5
     9f4:	02500793          	li	a5,37
     9f8:	00f71f63          	bne	a4,a5,a16 <vprintf+0x210>
        putc(fd, c);
     9fc:	fdc42783          	lw	a5,-36(s0)
     a00:	0ff7f713          	andi	a4,a5,255
     a04:	fcc42783          	lw	a5,-52(s0)
     a08:	85ba                	mv	a1,a4
     a0a:	853e                	mv	a0,a5
     a0c:	00000097          	auipc	ra,0x0
     a10:	c2a080e7          	jalr	-982(ra) # 636 <putc>
     a14:	a035                	j	a40 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a16:	fcc42783          	lw	a5,-52(s0)
     a1a:	02500593          	li	a1,37
     a1e:	853e                	mv	a0,a5
     a20:	00000097          	auipc	ra,0x0
     a24:	c16080e7          	jalr	-1002(ra) # 636 <putc>
        putc(fd, c);
     a28:	fdc42783          	lw	a5,-36(s0)
     a2c:	0ff7f713          	andi	a4,a5,255
     a30:	fcc42783          	lw	a5,-52(s0)
     a34:	85ba                	mv	a1,a4
     a36:	853e                	mv	a0,a5
     a38:	00000097          	auipc	ra,0x0
     a3c:	bfe080e7          	jalr	-1026(ra) # 636 <putc>
      }
      state = 0;
     a40:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a44:	fe442783          	lw	a5,-28(s0)
     a48:	2785                	addiw	a5,a5,1
     a4a:	fef42223          	sw	a5,-28(s0)
     a4e:	fe442783          	lw	a5,-28(s0)
     a52:	fc043703          	ld	a4,-64(s0)
     a56:	97ba                	add	a5,a5,a4
     a58:	0007c783          	lbu	a5,0(a5)
     a5c:	dc0795e3          	bnez	a5,826 <vprintf+0x20>
    }
  }
}
     a60:	0001                	nop
     a62:	0001                	nop
     a64:	60a6                	ld	ra,72(sp)
     a66:	6406                	ld	s0,64(sp)
     a68:	6161                	addi	sp,sp,80
     a6a:	8082                	ret

0000000000000a6c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a6c:	7159                	addi	sp,sp,-112
     a6e:	fc06                	sd	ra,56(sp)
     a70:	f822                	sd	s0,48(sp)
     a72:	0080                	addi	s0,sp,64
     a74:	fcb43823          	sd	a1,-48(s0)
     a78:	e010                	sd	a2,0(s0)
     a7a:	e414                	sd	a3,8(s0)
     a7c:	e818                	sd	a4,16(s0)
     a7e:	ec1c                	sd	a5,24(s0)
     a80:	03043023          	sd	a6,32(s0)
     a84:	03143423          	sd	a7,40(s0)
     a88:	87aa                	mv	a5,a0
     a8a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a8e:	03040793          	addi	a5,s0,48
     a92:	fcf43423          	sd	a5,-56(s0)
     a96:	fc843783          	ld	a5,-56(s0)
     a9a:	fd078793          	addi	a5,a5,-48
     a9e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     aa2:	fe843703          	ld	a4,-24(s0)
     aa6:	fdc42783          	lw	a5,-36(s0)
     aaa:	863a                	mv	a2,a4
     aac:	fd043583          	ld	a1,-48(s0)
     ab0:	853e                	mv	a0,a5
     ab2:	00000097          	auipc	ra,0x0
     ab6:	d54080e7          	jalr	-684(ra) # 806 <vprintf>
}
     aba:	0001                	nop
     abc:	70e2                	ld	ra,56(sp)
     abe:	7442                	ld	s0,48(sp)
     ac0:	6165                	addi	sp,sp,112
     ac2:	8082                	ret

0000000000000ac4 <printf>:

void
printf(const char *fmt, ...)
{
     ac4:	7159                	addi	sp,sp,-112
     ac6:	f406                	sd	ra,40(sp)
     ac8:	f022                	sd	s0,32(sp)
     aca:	1800                	addi	s0,sp,48
     acc:	fca43c23          	sd	a0,-40(s0)
     ad0:	e40c                	sd	a1,8(s0)
     ad2:	e810                	sd	a2,16(s0)
     ad4:	ec14                	sd	a3,24(s0)
     ad6:	f018                	sd	a4,32(s0)
     ad8:	f41c                	sd	a5,40(s0)
     ada:	03043823          	sd	a6,48(s0)
     ade:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     ae2:	04040793          	addi	a5,s0,64
     ae6:	fcf43823          	sd	a5,-48(s0)
     aea:	fd043783          	ld	a5,-48(s0)
     aee:	fc878793          	addi	a5,a5,-56
     af2:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     af6:	fe843783          	ld	a5,-24(s0)
     afa:	863e                	mv	a2,a5
     afc:	fd843583          	ld	a1,-40(s0)
     b00:	4505                	li	a0,1
     b02:	00000097          	auipc	ra,0x0
     b06:	d04080e7          	jalr	-764(ra) # 806 <vprintf>
}
     b0a:	0001                	nop
     b0c:	70a2                	ld	ra,40(sp)
     b0e:	7402                	ld	s0,32(sp)
     b10:	6165                	addi	sp,sp,112
     b12:	8082                	ret

0000000000000b14 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b14:	7179                	addi	sp,sp,-48
     b16:	f422                	sd	s0,40(sp)
     b18:	1800                	addi	s0,sp,48
     b1a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b1e:	fd843783          	ld	a5,-40(s0)
     b22:	17c1                	addi	a5,a5,-16
     b24:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b28:	00002797          	auipc	a5,0x2
     b2c:	a1078793          	addi	a5,a5,-1520 # 2538 <freep>
     b30:	639c                	ld	a5,0(a5)
     b32:	fef43423          	sd	a5,-24(s0)
     b36:	a815                	j	b6a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b38:	fe843783          	ld	a5,-24(s0)
     b3c:	639c                	ld	a5,0(a5)
     b3e:	fe843703          	ld	a4,-24(s0)
     b42:	00f76f63          	bltu	a4,a5,b60 <free+0x4c>
     b46:	fe043703          	ld	a4,-32(s0)
     b4a:	fe843783          	ld	a5,-24(s0)
     b4e:	02e7eb63          	bltu	a5,a4,b84 <free+0x70>
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	639c                	ld	a5,0(a5)
     b58:	fe043703          	ld	a4,-32(s0)
     b5c:	02f76463          	bltu	a4,a5,b84 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b60:	fe843783          	ld	a5,-24(s0)
     b64:	639c                	ld	a5,0(a5)
     b66:	fef43423          	sd	a5,-24(s0)
     b6a:	fe043703          	ld	a4,-32(s0)
     b6e:	fe843783          	ld	a5,-24(s0)
     b72:	fce7f3e3          	bgeu	a5,a4,b38 <free+0x24>
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	639c                	ld	a5,0(a5)
     b7c:	fe043703          	ld	a4,-32(s0)
     b80:	faf77ce3          	bgeu	a4,a5,b38 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b84:	fe043783          	ld	a5,-32(s0)
     b88:	479c                	lw	a5,8(a5)
     b8a:	1782                	slli	a5,a5,0x20
     b8c:	9381                	srli	a5,a5,0x20
     b8e:	0792                	slli	a5,a5,0x4
     b90:	fe043703          	ld	a4,-32(s0)
     b94:	973e                	add	a4,a4,a5
     b96:	fe843783          	ld	a5,-24(s0)
     b9a:	639c                	ld	a5,0(a5)
     b9c:	02f71763          	bne	a4,a5,bca <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     ba0:	fe043783          	ld	a5,-32(s0)
     ba4:	4798                	lw	a4,8(a5)
     ba6:	fe843783          	ld	a5,-24(s0)
     baa:	639c                	ld	a5,0(a5)
     bac:	479c                	lw	a5,8(a5)
     bae:	9fb9                	addw	a5,a5,a4
     bb0:	0007871b          	sext.w	a4,a5
     bb4:	fe043783          	ld	a5,-32(s0)
     bb8:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     bba:	fe843783          	ld	a5,-24(s0)
     bbe:	639c                	ld	a5,0(a5)
     bc0:	6398                	ld	a4,0(a5)
     bc2:	fe043783          	ld	a5,-32(s0)
     bc6:	e398                	sd	a4,0(a5)
     bc8:	a039                	j	bd6 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     bca:	fe843783          	ld	a5,-24(s0)
     bce:	6398                	ld	a4,0(a5)
     bd0:	fe043783          	ld	a5,-32(s0)
     bd4:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     bd6:	fe843783          	ld	a5,-24(s0)
     bda:	479c                	lw	a5,8(a5)
     bdc:	1782                	slli	a5,a5,0x20
     bde:	9381                	srli	a5,a5,0x20
     be0:	0792                	slli	a5,a5,0x4
     be2:	fe843703          	ld	a4,-24(s0)
     be6:	97ba                	add	a5,a5,a4
     be8:	fe043703          	ld	a4,-32(s0)
     bec:	02f71563          	bne	a4,a5,c16 <free+0x102>
    p->s.size += bp->s.size;
     bf0:	fe843783          	ld	a5,-24(s0)
     bf4:	4798                	lw	a4,8(a5)
     bf6:	fe043783          	ld	a5,-32(s0)
     bfa:	479c                	lw	a5,8(a5)
     bfc:	9fb9                	addw	a5,a5,a4
     bfe:	0007871b          	sext.w	a4,a5
     c02:	fe843783          	ld	a5,-24(s0)
     c06:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     c08:	fe043783          	ld	a5,-32(s0)
     c0c:	6398                	ld	a4,0(a5)
     c0e:	fe843783          	ld	a5,-24(s0)
     c12:	e398                	sd	a4,0(a5)
     c14:	a031                	j	c20 <free+0x10c>
  } else
    p->s.ptr = bp;
     c16:	fe843783          	ld	a5,-24(s0)
     c1a:	fe043703          	ld	a4,-32(s0)
     c1e:	e398                	sd	a4,0(a5)
  freep = p;
     c20:	00002797          	auipc	a5,0x2
     c24:	91878793          	addi	a5,a5,-1768 # 2538 <freep>
     c28:	fe843703          	ld	a4,-24(s0)
     c2c:	e398                	sd	a4,0(a5)
}
     c2e:	0001                	nop
     c30:	7422                	ld	s0,40(sp)
     c32:	6145                	addi	sp,sp,48
     c34:	8082                	ret

0000000000000c36 <morecore>:

static Header*
morecore(uint nu)
{
     c36:	7179                	addi	sp,sp,-48
     c38:	f406                	sd	ra,40(sp)
     c3a:	f022                	sd	s0,32(sp)
     c3c:	1800                	addi	s0,sp,48
     c3e:	87aa                	mv	a5,a0
     c40:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c44:	fdc42783          	lw	a5,-36(s0)
     c48:	0007871b          	sext.w	a4,a5
     c4c:	6785                	lui	a5,0x1
     c4e:	00f77563          	bgeu	a4,a5,c58 <morecore+0x22>
    nu = 4096;
     c52:	6785                	lui	a5,0x1
     c54:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c58:	fdc42783          	lw	a5,-36(s0)
     c5c:	0047979b          	slliw	a5,a5,0x4
     c60:	2781                	sext.w	a5,a5
     c62:	2781                	sext.w	a5,a5
     c64:	853e                	mv	a0,a5
     c66:	00000097          	auipc	ra,0x0
     c6a:	9a0080e7          	jalr	-1632(ra) # 606 <sbrk>
     c6e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c72:	fe843703          	ld	a4,-24(s0)
     c76:	57fd                	li	a5,-1
     c78:	00f71463          	bne	a4,a5,c80 <morecore+0x4a>
    return 0;
     c7c:	4781                	li	a5,0
     c7e:	a03d                	j	cac <morecore+0x76>
  hp = (Header*)p;
     c80:	fe843783          	ld	a5,-24(s0)
     c84:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c88:	fe043783          	ld	a5,-32(s0)
     c8c:	fdc42703          	lw	a4,-36(s0)
     c90:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c92:	fe043783          	ld	a5,-32(s0)
     c96:	07c1                	addi	a5,a5,16
     c98:	853e                	mv	a0,a5
     c9a:	00000097          	auipc	ra,0x0
     c9e:	e7a080e7          	jalr	-390(ra) # b14 <free>
  return freep;
     ca2:	00002797          	auipc	a5,0x2
     ca6:	89678793          	addi	a5,a5,-1898 # 2538 <freep>
     caa:	639c                	ld	a5,0(a5)
}
     cac:	853e                	mv	a0,a5
     cae:	70a2                	ld	ra,40(sp)
     cb0:	7402                	ld	s0,32(sp)
     cb2:	6145                	addi	sp,sp,48
     cb4:	8082                	ret

0000000000000cb6 <malloc>:

void*
malloc(uint nbytes)
{
     cb6:	7139                	addi	sp,sp,-64
     cb8:	fc06                	sd	ra,56(sp)
     cba:	f822                	sd	s0,48(sp)
     cbc:	0080                	addi	s0,sp,64
     cbe:	87aa                	mv	a5,a0
     cc0:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     cc4:	fcc46783          	lwu	a5,-52(s0)
     cc8:	07bd                	addi	a5,a5,15
     cca:	8391                	srli	a5,a5,0x4
     ccc:	2781                	sext.w	a5,a5
     cce:	2785                	addiw	a5,a5,1
     cd0:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     cd4:	00002797          	auipc	a5,0x2
     cd8:	86478793          	addi	a5,a5,-1948 # 2538 <freep>
     cdc:	639c                	ld	a5,0(a5)
     cde:	fef43023          	sd	a5,-32(s0)
     ce2:	fe043783          	ld	a5,-32(s0)
     ce6:	ef95                	bnez	a5,d22 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ce8:	00002797          	auipc	a5,0x2
     cec:	84078793          	addi	a5,a5,-1984 # 2528 <base>
     cf0:	fef43023          	sd	a5,-32(s0)
     cf4:	00002797          	auipc	a5,0x2
     cf8:	84478793          	addi	a5,a5,-1980 # 2538 <freep>
     cfc:	fe043703          	ld	a4,-32(s0)
     d00:	e398                	sd	a4,0(a5)
     d02:	00002797          	auipc	a5,0x2
     d06:	83678793          	addi	a5,a5,-1994 # 2538 <freep>
     d0a:	6398                	ld	a4,0(a5)
     d0c:	00002797          	auipc	a5,0x2
     d10:	81c78793          	addi	a5,a5,-2020 # 2528 <base>
     d14:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     d16:	00002797          	auipc	a5,0x2
     d1a:	81278793          	addi	a5,a5,-2030 # 2528 <base>
     d1e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d22:	fe043783          	ld	a5,-32(s0)
     d26:	639c                	ld	a5,0(a5)
     d28:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d2c:	fe843783          	ld	a5,-24(s0)
     d30:	4798                	lw	a4,8(a5)
     d32:	fdc42783          	lw	a5,-36(s0)
     d36:	2781                	sext.w	a5,a5
     d38:	06f76863          	bltu	a4,a5,da8 <malloc+0xf2>
      if(p->s.size == nunits)
     d3c:	fe843783          	ld	a5,-24(s0)
     d40:	4798                	lw	a4,8(a5)
     d42:	fdc42783          	lw	a5,-36(s0)
     d46:	2781                	sext.w	a5,a5
     d48:	00e79963          	bne	a5,a4,d5a <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d4c:	fe843783          	ld	a5,-24(s0)
     d50:	6398                	ld	a4,0(a5)
     d52:	fe043783          	ld	a5,-32(s0)
     d56:	e398                	sd	a4,0(a5)
     d58:	a82d                	j	d92 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d5a:	fe843783          	ld	a5,-24(s0)
     d5e:	4798                	lw	a4,8(a5)
     d60:	fdc42783          	lw	a5,-36(s0)
     d64:	40f707bb          	subw	a5,a4,a5
     d68:	0007871b          	sext.w	a4,a5
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d72:	fe843783          	ld	a5,-24(s0)
     d76:	479c                	lw	a5,8(a5)
     d78:	1782                	slli	a5,a5,0x20
     d7a:	9381                	srli	a5,a5,0x20
     d7c:	0792                	slli	a5,a5,0x4
     d7e:	fe843703          	ld	a4,-24(s0)
     d82:	97ba                	add	a5,a5,a4
     d84:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d88:	fe843783          	ld	a5,-24(s0)
     d8c:	fdc42703          	lw	a4,-36(s0)
     d90:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d92:	00001797          	auipc	a5,0x1
     d96:	7a678793          	addi	a5,a5,1958 # 2538 <freep>
     d9a:	fe043703          	ld	a4,-32(s0)
     d9e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     da0:	fe843783          	ld	a5,-24(s0)
     da4:	07c1                	addi	a5,a5,16
     da6:	a091                	j	dea <malloc+0x134>
    }
    if(p == freep)
     da8:	00001797          	auipc	a5,0x1
     dac:	79078793          	addi	a5,a5,1936 # 2538 <freep>
     db0:	639c                	ld	a5,0(a5)
     db2:	fe843703          	ld	a4,-24(s0)
     db6:	02f71063          	bne	a4,a5,dd6 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     dba:	fdc42783          	lw	a5,-36(s0)
     dbe:	853e                	mv	a0,a5
     dc0:	00000097          	auipc	ra,0x0
     dc4:	e76080e7          	jalr	-394(ra) # c36 <morecore>
     dc8:	fea43423          	sd	a0,-24(s0)
     dcc:	fe843783          	ld	a5,-24(s0)
     dd0:	e399                	bnez	a5,dd6 <malloc+0x120>
        return 0;
     dd2:	4781                	li	a5,0
     dd4:	a819                	j	dea <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     dd6:	fe843783          	ld	a5,-24(s0)
     dda:	fef43023          	sd	a5,-32(s0)
     dde:	fe843783          	ld	a5,-24(s0)
     de2:	639c                	ld	a5,0(a5)
     de4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     de8:	b791                	j	d2c <malloc+0x76>
  }
}
     dea:	853e                	mv	a0,a5
     dec:	70e2                	ld	ra,56(sp)
     dee:	7442                	ld	s0,48(sp)
     df0:	6121                	addi	sp,sp,64
     df2:	8082                	ret

0000000000000df4 <setjmp>:
     df4:	e100                	sd	s0,0(a0)
     df6:	e504                	sd	s1,8(a0)
     df8:	01253823          	sd	s2,16(a0)
     dfc:	01353c23          	sd	s3,24(a0)
     e00:	03453023          	sd	s4,32(a0)
     e04:	03553423          	sd	s5,40(a0)
     e08:	03653823          	sd	s6,48(a0)
     e0c:	03753c23          	sd	s7,56(a0)
     e10:	05853023          	sd	s8,64(a0)
     e14:	05953423          	sd	s9,72(a0)
     e18:	05a53823          	sd	s10,80(a0)
     e1c:	05b53c23          	sd	s11,88(a0)
     e20:	06153023          	sd	ra,96(a0)
     e24:	06253423          	sd	sp,104(a0)
     e28:	4501                	li	a0,0
     e2a:	8082                	ret

0000000000000e2c <longjmp>:
     e2c:	6100                	ld	s0,0(a0)
     e2e:	6504                	ld	s1,8(a0)
     e30:	01053903          	ld	s2,16(a0)
     e34:	01853983          	ld	s3,24(a0)
     e38:	02053a03          	ld	s4,32(a0)
     e3c:	02853a83          	ld	s5,40(a0)
     e40:	03053b03          	ld	s6,48(a0)
     e44:	03853b83          	ld	s7,56(a0)
     e48:	04053c03          	ld	s8,64(a0)
     e4c:	04853c83          	ld	s9,72(a0)
     e50:	05053d03          	ld	s10,80(a0)
     e54:	05853d83          	ld	s11,88(a0)
     e58:	06053083          	ld	ra,96(a0)
     e5c:	06853103          	ld	sp,104(a0)
     e60:	c199                	beqz	a1,e66 <longjmp_1>
     e62:	852e                	mv	a0,a1
     e64:	8082                	ret

0000000000000e66 <longjmp_1>:
     e66:	4505                	li	a0,1
     e68:	8082                	ret

0000000000000e6a <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
     e6a:	7179                	addi	sp,sp,-48
     e6c:	f422                	sd	s0,40(sp)
     e6e:	1800                	addi	s0,sp,48
     e70:	fea43423          	sd	a0,-24(s0)
     e74:	feb43023          	sd	a1,-32(s0)
     e78:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
     e7c:	fd843783          	ld	a5,-40(s0)
     e80:	fe843703          	ld	a4,-24(s0)
     e84:	e798                	sd	a4,8(a5)
    new_entry->next = next;
     e86:	fe843783          	ld	a5,-24(s0)
     e8a:	fd843703          	ld	a4,-40(s0)
     e8e:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
     e90:	fe843783          	ld	a5,-24(s0)
     e94:	fe043703          	ld	a4,-32(s0)
     e98:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
     e9a:	fe043783          	ld	a5,-32(s0)
     e9e:	fe843703          	ld	a4,-24(s0)
     ea2:	e398                	sd	a4,0(a5)
}
     ea4:	0001                	nop
     ea6:	7422                	ld	s0,40(sp)
     ea8:	6145                	addi	sp,sp,48
     eaa:	8082                	ret

0000000000000eac <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
     eac:	1101                	addi	sp,sp,-32
     eae:	ec06                	sd	ra,24(sp)
     eb0:	e822                	sd	s0,16(sp)
     eb2:	1000                	addi	s0,sp,32
     eb4:	fea43423          	sd	a0,-24(s0)
     eb8:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
     ebc:	fe043783          	ld	a5,-32(s0)
     ec0:	679c                	ld	a5,8(a5)
     ec2:	fe043603          	ld	a2,-32(s0)
     ec6:	85be                	mv	a1,a5
     ec8:	fe843503          	ld	a0,-24(s0)
     ecc:	00000097          	auipc	ra,0x0
     ed0:	f9e080e7          	jalr	-98(ra) # e6a <__list_add>
}
     ed4:	0001                	nop
     ed6:	60e2                	ld	ra,24(sp)
     ed8:	6442                	ld	s0,16(sp)
     eda:	6105                	addi	sp,sp,32
     edc:	8082                	ret

0000000000000ede <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
     ede:	1101                	addi	sp,sp,-32
     ee0:	ec22                	sd	s0,24(sp)
     ee2:	1000                	addi	s0,sp,32
     ee4:	fea43423          	sd	a0,-24(s0)
     ee8:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
     eec:	fe043783          	ld	a5,-32(s0)
     ef0:	fe843703          	ld	a4,-24(s0)
     ef4:	e798                	sd	a4,8(a5)
    prev->next = next;
     ef6:	fe843783          	ld	a5,-24(s0)
     efa:	fe043703          	ld	a4,-32(s0)
     efe:	e398                	sd	a4,0(a5)
}
     f00:	0001                	nop
     f02:	6462                	ld	s0,24(sp)
     f04:	6105                	addi	sp,sp,32
     f06:	8082                	ret

0000000000000f08 <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
     f08:	1101                	addi	sp,sp,-32
     f0a:	ec06                	sd	ra,24(sp)
     f0c:	e822                	sd	s0,16(sp)
     f0e:	1000                	addi	s0,sp,32
     f10:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
     f14:	fe843783          	ld	a5,-24(s0)
     f18:	6798                	ld	a4,8(a5)
     f1a:	fe843783          	ld	a5,-24(s0)
     f1e:	639c                	ld	a5,0(a5)
     f20:	85be                	mv	a1,a5
     f22:	853a                	mv	a0,a4
     f24:	00000097          	auipc	ra,0x0
     f28:	fba080e7          	jalr	-70(ra) # ede <__list_del>
    entry->next = LIST_POISON1;
     f2c:	fe843783          	ld	a5,-24(s0)
     f30:	00100737          	lui	a4,0x100
     f34:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd420>
     f38:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
     f3a:	fe843783          	ld	a5,-24(s0)
     f3e:	00200737          	lui	a4,0x200
     f42:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd520>
     f46:	e798                	sd	a4,8(a5)
}
     f48:	0001                	nop
     f4a:	60e2                	ld	ra,24(sp)
     f4c:	6442                	ld	s0,16(sp)
     f4e:	6105                	addi	sp,sp,32
     f50:	8082                	ret

0000000000000f52 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     f52:	1101                	addi	sp,sp,-32
     f54:	ec22                	sd	s0,24(sp)
     f56:	1000                	addi	s0,sp,32
     f58:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     f5c:	fe843783          	ld	a5,-24(s0)
     f60:	639c                	ld	a5,0(a5)
     f62:	fe843703          	ld	a4,-24(s0)
     f66:	40f707b3          	sub	a5,a4,a5
     f6a:	0017b793          	seqz	a5,a5
     f6e:	0ff7f793          	andi	a5,a5,255
     f72:	2781                	sext.w	a5,a5
}
     f74:	853e                	mv	a0,a5
     f76:	6462                	ld	s0,24(sp)
     f78:	6105                	addi	sp,sp,32
     f7a:	8082                	ret

0000000000000f7c <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f7c:	715d                	addi	sp,sp,-80
     f7e:	e486                	sd	ra,72(sp)
     f80:	e0a2                	sd	s0,64(sp)
     f82:	0880                	addi	s0,sp,80
     f84:	fca43423          	sd	a0,-56(s0)
     f88:	fcb43023          	sd	a1,-64(s0)
     f8c:	85b2                	mv	a1,a2
     f8e:	8636                	mv	a2,a3
     f90:	86ba                	mv	a3,a4
     f92:	873e                	mv	a4,a5
     f94:	87ae                	mv	a5,a1
     f96:	faf42e23          	sw	a5,-68(s0)
     f9a:	87b2                	mv	a5,a2
     f9c:	faf42c23          	sw	a5,-72(s0)
     fa0:	87b6                	mv	a5,a3
     fa2:	faf42a23          	sw	a5,-76(s0)
     fa6:	87ba                	mv	a5,a4
     fa8:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     fac:	06000513          	li	a0,96
     fb0:	00000097          	auipc	ra,0x0
     fb4:	d06080e7          	jalr	-762(ra) # cb6 <malloc>
     fb8:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     fbc:	6505                	lui	a0,0x1
     fbe:	00000097          	auipc	ra,0x0
     fc2:	cf8080e7          	jalr	-776(ra) # cb6 <malloc>
     fc6:	87aa                	mv	a5,a0
     fc8:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     fcc:	fe043703          	ld	a4,-32(s0)
     fd0:	6785                	lui	a5,0x1
     fd2:	17c1                	addi	a5,a5,-16
     fd4:	97ba                	add	a5,a5,a4
     fd6:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     fda:	fe843783          	ld	a5,-24(s0)
     fde:	fc843703          	ld	a4,-56(s0)
     fe2:	e398                	sd	a4,0(a5)
    t->arg = arg;
     fe4:	fe843783          	ld	a5,-24(s0)
     fe8:	fc043703          	ld	a4,-64(s0)
     fec:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     fee:	00001797          	auipc	a5,0x1
     ff2:	52e78793          	addi	a5,a5,1326 # 251c <_id.1229>
     ff6:	439c                	lw	a5,0(a5)
     ff8:	0017871b          	addiw	a4,a5,1
     ffc:	0007069b          	sext.w	a3,a4
    1000:	00001717          	auipc	a4,0x1
    1004:	51c70713          	addi	a4,a4,1308 # 251c <_id.1229>
    1008:	c314                	sw	a3,0(a4)
    100a:	fe843703          	ld	a4,-24(s0)
    100e:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    1010:	fe843783          	ld	a5,-24(s0)
    1014:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1018:	fe043703          	ld	a4,-32(s0)
    101c:	fe843783          	ld	a5,-24(s0)
    1020:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1022:	fd843703          	ld	a4,-40(s0)
    1026:	fe843783          	ld	a5,-24(s0)
    102a:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    102c:	fe843783          	ld	a5,-24(s0)
    1030:	fb842703          	lw	a4,-72(s0)
    1034:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1036:	fe843783          	ld	a5,-24(s0)
    103a:	fb442703          	lw	a4,-76(s0)
    103e:	cbb8                	sw	a4,80(a5)
    t->deadline = period;
    1040:	fe843783          	ld	a5,-24(s0)
    1044:	fb442703          	lw	a4,-76(s0)
    1048:	c7f8                	sw	a4,76(a5)
    t->n = n;
    104a:	fe843783          	ld	a5,-24(s0)
    104e:	fb042703          	lw	a4,-80(s0)
    1052:	cbf8                	sw	a4,84(a5)
    t->is_real_time = is_real_time;
    1054:	fe843783          	ld	a5,-24(s0)
    1058:	fbc42703          	lw	a4,-68(s0)
    105c:	c3b8                	sw	a4,64(a5)
    t->weight = 1;
    105e:	fe843783          	ld	a5,-24(s0)
    1062:	4705                	li	a4,1
    1064:	c7b8                	sw	a4,72(a5)
    t->remaining_time = processing_time;
    1066:	fe843783          	ld	a5,-24(s0)
    106a:	fb842703          	lw	a4,-72(s0)
    106e:	cfb8                	sw	a4,88(a5)
    t->current_deadline = 0;
    1070:	fe843783          	ld	a5,-24(s0)
    1074:	0407ae23          	sw	zero,92(a5)
    return t;
    1078:	fe843783          	ld	a5,-24(s0)
}
    107c:	853e                	mv	a0,a5
    107e:	60a6                	ld	ra,72(sp)
    1080:	6406                	ld	s0,64(sp)
    1082:	6161                	addi	sp,sp,80
    1084:	8082                	ret

0000000000001086 <thread_set_weight>:

void thread_set_weight(struct thread *t, int weight)
{
    1086:	1101                	addi	sp,sp,-32
    1088:	ec22                	sd	s0,24(sp)
    108a:	1000                	addi	s0,sp,32
    108c:	fea43423          	sd	a0,-24(s0)
    1090:	87ae                	mv	a5,a1
    1092:	fef42223          	sw	a5,-28(s0)
    t->weight = weight;
    1096:	fe843783          	ld	a5,-24(s0)
    109a:	fe442703          	lw	a4,-28(s0)
    109e:	c7b8                	sw	a4,72(a5)
}
    10a0:	0001                	nop
    10a2:	6462                	ld	s0,24(sp)
    10a4:	6105                	addi	sp,sp,32
    10a6:	8082                	ret

00000000000010a8 <thread_add_at>:

void thread_add_at(struct thread *t, int arrival_time)
{
    10a8:	7179                	addi	sp,sp,-48
    10aa:	f406                	sd	ra,40(sp)
    10ac:	f022                	sd	s0,32(sp)
    10ae:	1800                	addi	s0,sp,48
    10b0:	fca43c23          	sd	a0,-40(s0)
    10b4:	87ae                	mv	a5,a1
    10b6:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10ba:	02000513          	li	a0,32
    10be:	00000097          	auipc	ra,0x0
    10c2:	bf8080e7          	jalr	-1032(ra) # cb6 <malloc>
    10c6:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10ca:	fe843783          	ld	a5,-24(s0)
    10ce:	fd843703          	ld	a4,-40(s0)
    10d2:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10d4:	fe843783          	ld	a5,-24(s0)
    10d8:	fd442703          	lw	a4,-44(s0)
    10dc:	cf98                	sw	a4,24(a5)
    if (t->is_real_time) {
    10de:	fd843783          	ld	a5,-40(s0)
    10e2:	43bc                	lw	a5,64(a5)
    10e4:	c38d                	beqz	a5,1106 <thread_add_at+0x5e>
        t->current_deadline = arrival_time;
    10e6:	fd843783          	ld	a5,-40(s0)
    10ea:	fd442703          	lw	a4,-44(s0)
    10ee:	cff8                	sw	a4,92(a5)
        t->current_deadline = arrival_time + t->deadline;
    10f0:	fd843783          	ld	a5,-40(s0)
    10f4:	47fc                	lw	a5,76(a5)
    10f6:	fd442703          	lw	a4,-44(s0)
    10fa:	9fb9                	addw	a5,a5,a4
    10fc:	0007871b          	sext.w	a4,a5
    1100:	fd843783          	ld	a5,-40(s0)
    1104:	cff8                	sw	a4,92(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1106:	fe843783          	ld	a5,-24(s0)
    110a:	07a1                	addi	a5,a5,8
    110c:	00001597          	auipc	a1,0x1
    1110:	3fc58593          	addi	a1,a1,1020 # 2508 <release_queue>
    1114:	853e                	mv	a0,a5
    1116:	00000097          	auipc	ra,0x0
    111a:	d96080e7          	jalr	-618(ra) # eac <list_add_tail>
}
    111e:	0001                	nop
    1120:	70a2                	ld	ra,40(sp)
    1122:	7402                	ld	s0,32(sp)
    1124:	6145                	addi	sp,sp,48
    1126:	8082                	ret

0000000000001128 <__release>:

void __release()
{
    1128:	7139                	addi	sp,sp,-64
    112a:	fc06                	sd	ra,56(sp)
    112c:	f822                	sd	s0,48(sp)
    112e:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1130:	00001797          	auipc	a5,0x1
    1134:	3d878793          	addi	a5,a5,984 # 2508 <release_queue>
    1138:	639c                	ld	a5,0(a5)
    113a:	fcf43c23          	sd	a5,-40(s0)
    113e:	fd843783          	ld	a5,-40(s0)
    1142:	17e1                	addi	a5,a5,-8
    1144:	fef43423          	sd	a5,-24(s0)
    1148:	fe843783          	ld	a5,-24(s0)
    114c:	679c                	ld	a5,8(a5)
    114e:	fcf43823          	sd	a5,-48(s0)
    1152:	fd043783          	ld	a5,-48(s0)
    1156:	17e1                	addi	a5,a5,-8
    1158:	fef43023          	sd	a5,-32(s0)
    115c:	a851                	j	11f0 <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
    115e:	fe843783          	ld	a5,-24(s0)
    1162:	4f98                	lw	a4,24(a5)
    1164:	00001797          	auipc	a5,0x1
    1168:	3e478793          	addi	a5,a5,996 # 2548 <threading_system_time>
    116c:	439c                	lw	a5,0(a5)
    116e:	06e7c363          	blt	a5,a4,11d4 <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
    1172:	fe843783          	ld	a5,-24(s0)
    1176:	6398                	ld	a4,0(a5)
    1178:	fe843783          	ld	a5,-24(s0)
    117c:	639c                	ld	a5,0(a5)
    117e:	4378                	lw	a4,68(a4)
    1180:	cfb8                	sw	a4,88(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1182:	fe843783          	ld	a5,-24(s0)
    1186:	4f94                	lw	a3,24(a5)
    1188:	fe843783          	ld	a5,-24(s0)
    118c:	639c                	ld	a5,0(a5)
    118e:	47f8                	lw	a4,76(a5)
    1190:	fe843783          	ld	a5,-24(s0)
    1194:	639c                	ld	a5,0(a5)
    1196:	9f35                	addw	a4,a4,a3
    1198:	2701                	sext.w	a4,a4
    119a:	cff8                	sw	a4,92(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    119c:	fe843783          	ld	a5,-24(s0)
    11a0:	639c                	ld	a5,0(a5)
    11a2:	02878793          	addi	a5,a5,40
    11a6:	00001597          	auipc	a1,0x1
    11aa:	35258593          	addi	a1,a1,850 # 24f8 <run_queue>
    11ae:	853e                	mv	a0,a5
    11b0:	00000097          	auipc	ra,0x0
    11b4:	cfc080e7          	jalr	-772(ra) # eac <list_add_tail>
            list_del(&cur->thread_list);
    11b8:	fe843783          	ld	a5,-24(s0)
    11bc:	07a1                	addi	a5,a5,8
    11be:	853e                	mv	a0,a5
    11c0:	00000097          	auipc	ra,0x0
    11c4:	d48080e7          	jalr	-696(ra) # f08 <list_del>
            free(cur);
    11c8:	fe843503          	ld	a0,-24(s0)
    11cc:	00000097          	auipc	ra,0x0
    11d0:	948080e7          	jalr	-1720(ra) # b14 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    11d4:	fe043783          	ld	a5,-32(s0)
    11d8:	fef43423          	sd	a5,-24(s0)
    11dc:	fe043783          	ld	a5,-32(s0)
    11e0:	679c                	ld	a5,8(a5)
    11e2:	fcf43423          	sd	a5,-56(s0)
    11e6:	fc843783          	ld	a5,-56(s0)
    11ea:	17e1                	addi	a5,a5,-8
    11ec:	fef43023          	sd	a5,-32(s0)
    11f0:	fe843783          	ld	a5,-24(s0)
    11f4:	00878713          	addi	a4,a5,8
    11f8:	00001797          	auipc	a5,0x1
    11fc:	31078793          	addi	a5,a5,784 # 2508 <release_queue>
    1200:	f4f71fe3          	bne	a4,a5,115e <__release+0x36>
        }
    }
}
    1204:	0001                	nop
    1206:	0001                	nop
    1208:	70e2                	ld	ra,56(sp)
    120a:	7442                	ld	s0,48(sp)
    120c:	6121                	addi	sp,sp,64
    120e:	8082                	ret

0000000000001210 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1210:	1101                	addi	sp,sp,-32
    1212:	ec06                	sd	ra,24(sp)
    1214:	e822                	sd	s0,16(sp)
    1216:	1000                	addi	s0,sp,32
    1218:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    121c:	fe843783          	ld	a5,-24(s0)
    1220:	7b98                	ld	a4,48(a5)
    1222:	00001797          	auipc	a5,0x1
    1226:	31e78793          	addi	a5,a5,798 # 2540 <current>
    122a:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    122c:	fe843783          	ld	a5,-24(s0)
    1230:	02878793          	addi	a5,a5,40
    1234:	853e                	mv	a0,a5
    1236:	00000097          	auipc	ra,0x0
    123a:	cd2080e7          	jalr	-814(ra) # f08 <list_del>

    free(to_remove->stack);
    123e:	fe843783          	ld	a5,-24(s0)
    1242:	6b9c                	ld	a5,16(a5)
    1244:	853e                	mv	a0,a5
    1246:	00000097          	auipc	ra,0x0
    124a:	8ce080e7          	jalr	-1842(ra) # b14 <free>
    free(to_remove);
    124e:	fe843503          	ld	a0,-24(s0)
    1252:	00000097          	auipc	ra,0x0
    1256:	8c2080e7          	jalr	-1854(ra) # b14 <free>

    __schedule();
    125a:	00000097          	auipc	ra,0x0
    125e:	572080e7          	jalr	1394(ra) # 17cc <__schedule>
    __dispatch();
    1262:	00000097          	auipc	ra,0x0
    1266:	3da080e7          	jalr	986(ra) # 163c <__dispatch>
    thrdresume(main_thrd_id);
    126a:	00001797          	auipc	a5,0x1
    126e:	2ae78793          	addi	a5,a5,686 # 2518 <main_thrd_id>
    1272:	439c                	lw	a5,0(a5)
    1274:	853e                	mv	a0,a5
    1276:	fffff097          	auipc	ra,0xfffff
    127a:	3b0080e7          	jalr	944(ra) # 626 <thrdresume>
}
    127e:	0001                	nop
    1280:	60e2                	ld	ra,24(sp)
    1282:	6442                	ld	s0,16(sp)
    1284:	6105                	addi	sp,sp,32
    1286:	8082                	ret

0000000000001288 <thread_exit>:

void thread_exit(void)
{
    1288:	7179                	addi	sp,sp,-48
    128a:	f406                	sd	ra,40(sp)
    128c:	f022                	sd	s0,32(sp)
    128e:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1290:	00001797          	auipc	a5,0x1
    1294:	2b078793          	addi	a5,a5,688 # 2540 <current>
    1298:	6398                	ld	a4,0(a5)
    129a:	00001797          	auipc	a5,0x1
    129e:	25e78793          	addi	a5,a5,606 # 24f8 <run_queue>
    12a2:	02f71063          	bne	a4,a5,12c2 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    12a6:	00001597          	auipc	a1,0x1
    12aa:	0fa58593          	addi	a1,a1,250 # 23a0 <schedule_dm+0x26c>
    12ae:	4509                	li	a0,2
    12b0:	fffff097          	auipc	ra,0xfffff
    12b4:	7bc080e7          	jalr	1980(ra) # a6c <fprintf>
        exit(1);
    12b8:	4505                	li	a0,1
    12ba:	fffff097          	auipc	ra,0xfffff
    12be:	2c4080e7          	jalr	708(ra) # 57e <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    12c2:	00001797          	auipc	a5,0x1
    12c6:	27e78793          	addi	a5,a5,638 # 2540 <current>
    12ca:	639c                	ld	a5,0(a5)
    12cc:	fef43423          	sd	a5,-24(s0)
    12d0:	fe843783          	ld	a5,-24(s0)
    12d4:	fd878793          	addi	a5,a5,-40
    12d8:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    12dc:	fe043783          	ld	a5,-32(s0)
    12e0:	5f9c                	lw	a5,56(a5)
    12e2:	4585                	li	a1,1
    12e4:	853e                	mv	a0,a5
    12e6:	fffff097          	auipc	ra,0xfffff
    12ea:	348080e7          	jalr	840(ra) # 62e <cancelthrdstop>
    12ee:	87aa                	mv	a5,a0
    12f0:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    12f4:	00001797          	auipc	a5,0x1
    12f8:	25478793          	addi	a5,a5,596 # 2548 <threading_system_time>
    12fc:	439c                	lw	a5,0(a5)
    12fe:	fdc42703          	lw	a4,-36(s0)
    1302:	9fb9                	addw	a5,a5,a4
    1304:	0007871b          	sext.w	a4,a5
    1308:	00001797          	auipc	a5,0x1
    130c:	24078793          	addi	a5,a5,576 # 2548 <threading_system_time>
    1310:	c398                	sw	a4,0(a5)

    __release();
    1312:	00000097          	auipc	ra,0x0
    1316:	e16080e7          	jalr	-490(ra) # 1128 <__release>
    __thread_exit(to_remove);
    131a:	fe043503          	ld	a0,-32(s0)
    131e:	00000097          	auipc	ra,0x0
    1322:	ef2080e7          	jalr	-270(ra) # 1210 <__thread_exit>
}
    1326:	0001                	nop
    1328:	70a2                	ld	ra,40(sp)
    132a:	7402                	ld	s0,32(sp)
    132c:	6145                	addi	sp,sp,48
    132e:	8082                	ret

0000000000001330 <__finish_current>:

void __finish_current()
{
    1330:	7179                	addi	sp,sp,-48
    1332:	f406                	sd	ra,40(sp)
    1334:	f022                	sd	s0,32(sp)
    1336:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1338:	00001797          	auipc	a5,0x1
    133c:	20878793          	addi	a5,a5,520 # 2540 <current>
    1340:	639c                	ld	a5,0(a5)
    1342:	fef43423          	sd	a5,-24(s0)
    1346:	fe843783          	ld	a5,-24(s0)
    134a:	fd878793          	addi	a5,a5,-40
    134e:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1352:	fe043783          	ld	a5,-32(s0)
    1356:	4bfc                	lw	a5,84(a5)
    1358:	37fd                	addiw	a5,a5,-1
    135a:	0007871b          	sext.w	a4,a5
    135e:	fe043783          	ld	a5,-32(s0)
    1362:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish at %d\n",
    1364:	fe043783          	ld	a5,-32(s0)
    1368:	5fd8                	lw	a4,60(a5)
    136a:	00001797          	auipc	a5,0x1
    136e:	1de78793          	addi	a5,a5,478 # 2548 <threading_system_time>
    1372:	4390                	lw	a2,0(a5)
    1374:	fe043783          	ld	a5,-32(s0)
    1378:	4bfc                	lw	a5,84(a5)
    137a:	86be                	mv	a3,a5
    137c:	85ba                	mv	a1,a4
    137e:	00001517          	auipc	a0,0x1
    1382:	05a50513          	addi	a0,a0,90 # 23d8 <schedule_dm+0x2a4>
    1386:	fffff097          	auipc	ra,0xfffff
    138a:	73e080e7          	jalr	1854(ra) # ac4 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    138e:	fe043783          	ld	a5,-32(s0)
    1392:	4bfc                	lw	a5,84(a5)
    1394:	04f05563          	blez	a5,13de <__finish_current+0xae>
        struct list_head *to_remove = current;
    1398:	00001797          	auipc	a5,0x1
    139c:	1a878793          	addi	a5,a5,424 # 2540 <current>
    13a0:	639c                	ld	a5,0(a5)
    13a2:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    13a6:	00001797          	auipc	a5,0x1
    13aa:	19a78793          	addi	a5,a5,410 # 2540 <current>
    13ae:	639c                	ld	a5,0(a5)
    13b0:	6798                	ld	a4,8(a5)
    13b2:	00001797          	auipc	a5,0x1
    13b6:	18e78793          	addi	a5,a5,398 # 2540 <current>
    13ba:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    13bc:	fd843503          	ld	a0,-40(s0)
    13c0:	00000097          	auipc	ra,0x0
    13c4:	b48080e7          	jalr	-1208(ra) # f08 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    13c8:	fe043783          	ld	a5,-32(s0)
    13cc:	4ffc                	lw	a5,92(a5)
    13ce:	85be                	mv	a1,a5
    13d0:	fe043503          	ld	a0,-32(s0)
    13d4:	00000097          	auipc	ra,0x0
    13d8:	cd4080e7          	jalr	-812(ra) # 10a8 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    13dc:	a039                	j	13ea <__finish_current+0xba>
        __thread_exit(current_thread);
    13de:	fe043503          	ld	a0,-32(s0)
    13e2:	00000097          	auipc	ra,0x0
    13e6:	e2e080e7          	jalr	-466(ra) # 1210 <__thread_exit>
}
    13ea:	0001                	nop
    13ec:	70a2                	ld	ra,40(sp)
    13ee:	7402                	ld	s0,32(sp)
    13f0:	6145                	addi	sp,sp,48
    13f2:	8082                	ret

00000000000013f4 <__rt_finish_current>:
void __rt_finish_current()
{
    13f4:	7179                	addi	sp,sp,-48
    13f6:	f406                	sd	ra,40(sp)
    13f8:	f022                	sd	s0,32(sp)
    13fa:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    13fc:	00001797          	auipc	a5,0x1
    1400:	14478793          	addi	a5,a5,324 # 2540 <current>
    1404:	639c                	ld	a5,0(a5)
    1406:	fef43423          	sd	a5,-24(s0)
    140a:	fe843783          	ld	a5,-24(s0)
    140e:	fd878793          	addi	a5,a5,-40
    1412:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1416:	fe043783          	ld	a5,-32(s0)
    141a:	4bfc                	lw	a5,84(a5)
    141c:	37fd                	addiw	a5,a5,-1
    141e:	0007871b          	sext.w	a4,a5
    1422:	fe043783          	ld	a5,-32(s0)
    1426:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1428:	fe043783          	ld	a5,-32(s0)
    142c:	5fd8                	lw	a4,60(a5)
    142e:	00001797          	auipc	a5,0x1
    1432:	11a78793          	addi	a5,a5,282 # 2548 <threading_system_time>
    1436:	4390                	lw	a2,0(a5)
    1438:	fe043783          	ld	a5,-32(s0)
    143c:	4bfc                	lw	a5,84(a5)
    143e:	86be                	mv	a3,a5
    1440:	85ba                	mv	a1,a4
    1442:	00001517          	auipc	a0,0x1
    1446:	fae50513          	addi	a0,a0,-82 # 23f0 <schedule_dm+0x2bc>
    144a:	fffff097          	auipc	ra,0xfffff
    144e:	67a080e7          	jalr	1658(ra) # ac4 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1452:	fe043783          	ld	a5,-32(s0)
    1456:	4bfc                	lw	a5,84(a5)
    1458:	04f05563          	blez	a5,14a2 <__rt_finish_current+0xae>
        struct list_head *to_remove = current;
    145c:	00001797          	auipc	a5,0x1
    1460:	0e478793          	addi	a5,a5,228 # 2540 <current>
    1464:	639c                	ld	a5,0(a5)
    1466:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    146a:	00001797          	auipc	a5,0x1
    146e:	0d678793          	addi	a5,a5,214 # 2540 <current>
    1472:	639c                	ld	a5,0(a5)
    1474:	6798                	ld	a4,8(a5)
    1476:	00001797          	auipc	a5,0x1
    147a:	0ca78793          	addi	a5,a5,202 # 2540 <current>
    147e:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1480:	fd843503          	ld	a0,-40(s0)
    1484:	00000097          	auipc	ra,0x0
    1488:	a84080e7          	jalr	-1404(ra) # f08 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    148c:	fe043783          	ld	a5,-32(s0)
    1490:	4ffc                	lw	a5,92(a5)
    1492:	85be                	mv	a1,a5
    1494:	fe043503          	ld	a0,-32(s0)
    1498:	00000097          	auipc	ra,0x0
    149c:	c10080e7          	jalr	-1008(ra) # 10a8 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    14a0:	a039                	j	14ae <__rt_finish_current+0xba>
        __thread_exit(current_thread);
    14a2:	fe043503          	ld	a0,-32(s0)
    14a6:	00000097          	auipc	ra,0x0
    14aa:	d6a080e7          	jalr	-662(ra) # 1210 <__thread_exit>
}
    14ae:	0001                	nop
    14b0:	70a2                	ld	ra,40(sp)
    14b2:	7402                	ld	s0,32(sp)
    14b4:	6145                	addi	sp,sp,48
    14b6:	8082                	ret

00000000000014b8 <switch_handler>:

void switch_handler(void *arg)
{
    14b8:	7139                	addi	sp,sp,-64
    14ba:	fc06                	sd	ra,56(sp)
    14bc:	f822                	sd	s0,48(sp)
    14be:	0080                	addi	s0,sp,64
    14c0:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    14c4:	fc843783          	ld	a5,-56(s0)
    14c8:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14cc:	00001797          	auipc	a5,0x1
    14d0:	07478793          	addi	a5,a5,116 # 2540 <current>
    14d4:	639c                	ld	a5,0(a5)
    14d6:	fef43023          	sd	a5,-32(s0)
    14da:	fe043783          	ld	a5,-32(s0)
    14de:	fd878793          	addi	a5,a5,-40
    14e2:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    14e6:	fe843783          	ld	a5,-24(s0)
    14ea:	0007871b          	sext.w	a4,a5
    14ee:	00001797          	auipc	a5,0x1
    14f2:	05a78793          	addi	a5,a5,90 # 2548 <threading_system_time>
    14f6:	439c                	lw	a5,0(a5)
    14f8:	2781                	sext.w	a5,a5
    14fa:	9fb9                	addw	a5,a5,a4
    14fc:	2781                	sext.w	a5,a5
    14fe:	0007871b          	sext.w	a4,a5
    1502:	00001797          	auipc	a5,0x1
    1506:	04678793          	addi	a5,a5,70 # 2548 <threading_system_time>
    150a:	c398                	sw	a4,0(a5)
     __release();
    150c:	00000097          	auipc	ra,0x0
    1510:	c1c080e7          	jalr	-996(ra) # 1128 <__release>
    current_thread->remaining_time -= elapsed_time;
    1514:	fd843783          	ld	a5,-40(s0)
    1518:	4fbc                	lw	a5,88(a5)
    151a:	0007871b          	sext.w	a4,a5
    151e:	fe843783          	ld	a5,-24(s0)
    1522:	2781                	sext.w	a5,a5
    1524:	40f707bb          	subw	a5,a4,a5
    1528:	2781                	sext.w	a5,a5
    152a:	0007871b          	sext.w	a4,a5
    152e:	fd843783          	ld	a5,-40(s0)
    1532:	cfb8                	sw	a4,88(a5)

    if (current_thread->is_real_time)
    1534:	fd843783          	ld	a5,-40(s0)
    1538:	43bc                	lw	a5,64(a5)
    153a:	c3ad                	beqz	a5,159c <switch_handler+0xe4>
        if (threading_system_time > current_thread->current_deadline || 
    153c:	fd843783          	ld	a5,-40(s0)
    1540:	4ff8                	lw	a4,92(a5)
    1542:	00001797          	auipc	a5,0x1
    1546:	00678793          	addi	a5,a5,6 # 2548 <threading_system_time>
    154a:	439c                	lw	a5,0(a5)
    154c:	02f74163          	blt	a4,a5,156e <switch_handler+0xb6>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1550:	fd843783          	ld	a5,-40(s0)
    1554:	4ff8                	lw	a4,92(a5)
    1556:	00001797          	auipc	a5,0x1
    155a:	ff278793          	addi	a5,a5,-14 # 2548 <threading_system_time>
    155e:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1560:	02f71e63          	bne	a4,a5,159c <switch_handler+0xe4>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1564:	fd843783          	ld	a5,-40(s0)
    1568:	4fbc                	lw	a5,88(a5)
    156a:	02f05963          	blez	a5,159c <switch_handler+0xe4>
            printf("thread#%d misses a deadline at %d\n", current_thread->ID, threading_system_time);
    156e:	fd843783          	ld	a5,-40(s0)
    1572:	5fd8                	lw	a4,60(a5)
    1574:	00001797          	auipc	a5,0x1
    1578:	fd478793          	addi	a5,a5,-44 # 2548 <threading_system_time>
    157c:	439c                	lw	a5,0(a5)
    157e:	863e                	mv	a2,a5
    1580:	85ba                	mv	a1,a4
    1582:	00001517          	auipc	a0,0x1
    1586:	ea650513          	addi	a0,a0,-346 # 2428 <schedule_dm+0x2f4>
    158a:	fffff097          	auipc	ra,0xfffff
    158e:	53a080e7          	jalr	1338(ra) # ac4 <printf>
            exit(0);
    1592:	4501                	li	a0,0
    1594:	fffff097          	auipc	ra,0xfffff
    1598:	fea080e7          	jalr	-22(ra) # 57e <exit>
        }

    if (current_thread->remaining_time <= 0) {
    159c:	fd843783          	ld	a5,-40(s0)
    15a0:	4fbc                	lw	a5,88(a5)
    15a2:	02f04063          	bgtz	a5,15c2 <switch_handler+0x10a>
        if (current_thread->is_real_time)
    15a6:	fd843783          	ld	a5,-40(s0)
    15aa:	43bc                	lw	a5,64(a5)
    15ac:	c791                	beqz	a5,15b8 <switch_handler+0x100>
            __rt_finish_current();
    15ae:	00000097          	auipc	ra,0x0
    15b2:	e46080e7          	jalr	-442(ra) # 13f4 <__rt_finish_current>
    15b6:	a881                	j	1606 <switch_handler+0x14e>
        else
            __finish_current();
    15b8:	00000097          	auipc	ra,0x0
    15bc:	d78080e7          	jalr	-648(ra) # 1330 <__finish_current>
    15c0:	a099                	j	1606 <switch_handler+0x14e>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    15c2:	00001797          	auipc	a5,0x1
    15c6:	f7e78793          	addi	a5,a5,-130 # 2540 <current>
    15ca:	639c                	ld	a5,0(a5)
    15cc:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    15d0:	00001797          	auipc	a5,0x1
    15d4:	f7078793          	addi	a5,a5,-144 # 2540 <current>
    15d8:	639c                	ld	a5,0(a5)
    15da:	6798                	ld	a4,8(a5)
    15dc:	00001797          	auipc	a5,0x1
    15e0:	f6478793          	addi	a5,a5,-156 # 2540 <current>
    15e4:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    15e6:	fd043503          	ld	a0,-48(s0)
    15ea:	00000097          	auipc	ra,0x0
    15ee:	91e080e7          	jalr	-1762(ra) # f08 <list_del>
        list_add_tail(to_remove, &run_queue);
    15f2:	00001597          	auipc	a1,0x1
    15f6:	f0658593          	addi	a1,a1,-250 # 24f8 <run_queue>
    15fa:	fd043503          	ld	a0,-48(s0)
    15fe:	00000097          	auipc	ra,0x0
    1602:	8ae080e7          	jalr	-1874(ra) # eac <list_add_tail>
    }

    __release();
    1606:	00000097          	auipc	ra,0x0
    160a:	b22080e7          	jalr	-1246(ra) # 1128 <__release>
    __schedule();
    160e:	00000097          	auipc	ra,0x0
    1612:	1be080e7          	jalr	446(ra) # 17cc <__schedule>
    __dispatch();
    1616:	00000097          	auipc	ra,0x0
    161a:	026080e7          	jalr	38(ra) # 163c <__dispatch>
    thrdresume(main_thrd_id);
    161e:	00001797          	auipc	a5,0x1
    1622:	efa78793          	addi	a5,a5,-262 # 2518 <main_thrd_id>
    1626:	439c                	lw	a5,0(a5)
    1628:	853e                	mv	a0,a5
    162a:	fffff097          	auipc	ra,0xfffff
    162e:	ffc080e7          	jalr	-4(ra) # 626 <thrdresume>
}
    1632:	0001                	nop
    1634:	70e2                	ld	ra,56(sp)
    1636:	7442                	ld	s0,48(sp)
    1638:	6121                	addi	sp,sp,64
    163a:	8082                	ret

000000000000163c <__dispatch>:

void __dispatch()
{
    163c:	7179                	addi	sp,sp,-48
    163e:	f406                	sd	ra,40(sp)
    1640:	f022                	sd	s0,32(sp)
    1642:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1644:	00001797          	auipc	a5,0x1
    1648:	efc78793          	addi	a5,a5,-260 # 2540 <current>
    164c:	6398                	ld	a4,0(a5)
    164e:	00001797          	auipc	a5,0x1
    1652:	eaa78793          	addi	a5,a5,-342 # 24f8 <run_queue>
    1656:	16f70663          	beq	a4,a5,17c2 <__dispatch+0x186>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    165a:	00001797          	auipc	a5,0x1
    165e:	ee678793          	addi	a5,a5,-282 # 2540 <current>
    1662:	639c                	ld	a5,0(a5)
    1664:	fef43423          	sd	a5,-24(s0)
    1668:	fe843783          	ld	a5,-24(s0)
    166c:	fd878793          	addi	a5,a5,-40
    1670:	fef43023          	sd	a5,-32(s0)
    if (current_thread->is_real_time && allocated_time == 0) { // miss deadline, abort
    1674:	fe043783          	ld	a5,-32(s0)
    1678:	43bc                	lw	a5,64(a5)
    167a:	cf85                	beqz	a5,16b2 <__dispatch+0x76>
    167c:	00001797          	auipc	a5,0x1
    1680:	ed478793          	addi	a5,a5,-300 # 2550 <allocated_time>
    1684:	639c                	ld	a5,0(a5)
    1686:	e795                	bnez	a5,16b2 <__dispatch+0x76>
        printf("thread#%d misses a deadline at %d\n", current_thread->ID, current_thread->current_deadline);
    1688:	fe043783          	ld	a5,-32(s0)
    168c:	5fd8                	lw	a4,60(a5)
    168e:	fe043783          	ld	a5,-32(s0)
    1692:	4ffc                	lw	a5,92(a5)
    1694:	863e                	mv	a2,a5
    1696:	85ba                	mv	a1,a4
    1698:	00001517          	auipc	a0,0x1
    169c:	d9050513          	addi	a0,a0,-624 # 2428 <schedule_dm+0x2f4>
    16a0:	fffff097          	auipc	ra,0xfffff
    16a4:	424080e7          	jalr	1060(ra) # ac4 <printf>
        exit(0);
    16a8:	4501                	li	a0,0
    16aa:	fffff097          	auipc	ra,0xfffff
    16ae:	ed4080e7          	jalr	-300(ra) # 57e <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    16b2:	fe043783          	ld	a5,-32(s0)
    16b6:	5fd8                	lw	a4,60(a5)
    16b8:	00001797          	auipc	a5,0x1
    16bc:	e9078793          	addi	a5,a5,-368 # 2548 <threading_system_time>
    16c0:	4390                	lw	a2,0(a5)
    16c2:	00001797          	auipc	a5,0x1
    16c6:	e8e78793          	addi	a5,a5,-370 # 2550 <allocated_time>
    16ca:	639c                	ld	a5,0(a5)
    16cc:	86be                	mv	a3,a5
    16ce:	85ba                	mv	a1,a4
    16d0:	00001517          	auipc	a0,0x1
    16d4:	d8050513          	addi	a0,a0,-640 # 2450 <schedule_dm+0x31c>
    16d8:	fffff097          	auipc	ra,0xfffff
    16dc:	3ec080e7          	jalr	1004(ra) # ac4 <printf>

    if (current_thread->buf_set) {
    16e0:	fe043783          	ld	a5,-32(s0)
    16e4:	539c                	lw	a5,32(a5)
    16e6:	c7a1                	beqz	a5,172e <__dispatch+0xf2>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    16e8:	00001797          	auipc	a5,0x1
    16ec:	e6878793          	addi	a5,a5,-408 # 2550 <allocated_time>
    16f0:	639c                	ld	a5,0(a5)
    16f2:	0007871b          	sext.w	a4,a5
    16f6:	fe043783          	ld	a5,-32(s0)
    16fa:	03878593          	addi	a1,a5,56
    16fe:	00001797          	auipc	a5,0x1
    1702:	e5278793          	addi	a5,a5,-430 # 2550 <allocated_time>
    1706:	639c                	ld	a5,0(a5)
    1708:	86be                	mv	a3,a5
    170a:	00000617          	auipc	a2,0x0
    170e:	dae60613          	addi	a2,a2,-594 # 14b8 <switch_handler>
    1712:	853a                	mv	a0,a4
    1714:	fffff097          	auipc	ra,0xfffff
    1718:	f0a080e7          	jalr	-246(ra) # 61e <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    171c:	fe043783          	ld	a5,-32(s0)
    1720:	5f9c                	lw	a5,56(a5)
    1722:	853e                	mv	a0,a5
    1724:	fffff097          	auipc	ra,0xfffff
    1728:	f02080e7          	jalr	-254(ra) # 626 <thrdresume>
    172c:	a071                	j	17b8 <__dispatch+0x17c>
    } else {
        current_thread->buf_set = 1;
    172e:	fe043783          	ld	a5,-32(s0)
    1732:	4705                	li	a4,1
    1734:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1736:	fe043783          	ld	a5,-32(s0)
    173a:	6f9c                	ld	a5,24(a5)
    173c:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1740:	fe043783          	ld	a5,-32(s0)
    1744:	577d                	li	a4,-1
    1746:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1748:	00001797          	auipc	a5,0x1
    174c:	e0878793          	addi	a5,a5,-504 # 2550 <allocated_time>
    1750:	639c                	ld	a5,0(a5)
    1752:	0007871b          	sext.w	a4,a5
    1756:	fe043783          	ld	a5,-32(s0)
    175a:	03878593          	addi	a1,a5,56
    175e:	00001797          	auipc	a5,0x1
    1762:	df278793          	addi	a5,a5,-526 # 2550 <allocated_time>
    1766:	639c                	ld	a5,0(a5)
    1768:	86be                	mv	a3,a5
    176a:	00000617          	auipc	a2,0x0
    176e:	d4e60613          	addi	a2,a2,-690 # 14b8 <switch_handler>
    1772:	853a                	mv	a0,a4
    1774:	fffff097          	auipc	ra,0xfffff
    1778:	eaa080e7          	jalr	-342(ra) # 61e <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    177c:	fe043783          	ld	a5,-32(s0)
    1780:	5f9c                	lw	a5,56(a5)
    1782:	0207d063          	bgez	a5,17a2 <__dispatch+0x166>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    1786:	00001597          	auipc	a1,0x1
    178a:	cfa58593          	addi	a1,a1,-774 # 2480 <schedule_dm+0x34c>
    178e:	4509                	li	a0,2
    1790:	fffff097          	auipc	ra,0xfffff
    1794:	2dc080e7          	jalr	732(ra) # a6c <fprintf>
            exit(1);
    1798:	4505                	li	a0,1
    179a:	fffff097          	auipc	ra,0xfffff
    179e:	de4080e7          	jalr	-540(ra) # 57e <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    17a2:	fd843783          	ld	a5,-40(s0)
    17a6:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    17a8:	fe043783          	ld	a5,-32(s0)
    17ac:	6398                	ld	a4,0(a5)
    17ae:	fe043783          	ld	a5,-32(s0)
    17b2:	679c                	ld	a5,8(a5)
    17b4:	853e                	mv	a0,a5
    17b6:	9702                	jalr	a4
    }
    thread_exit();
    17b8:	00000097          	auipc	ra,0x0
    17bc:	ad0080e7          	jalr	-1328(ra) # 1288 <thread_exit>
    17c0:	a011                	j	17c4 <__dispatch+0x188>
        return;
    17c2:	0001                	nop
}
    17c4:	70a2                	ld	ra,40(sp)
    17c6:	7402                	ld	s0,32(sp)
    17c8:	6145                	addi	sp,sp,48
    17ca:	8082                	ret

00000000000017cc <__schedule>:

void __schedule()
{
    17cc:	711d                	addi	sp,sp,-96
    17ce:	ec86                	sd	ra,88(sp)
    17d0:	e8a2                	sd	s0,80(sp)
    17d2:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    17d4:	00001797          	auipc	a5,0x1
    17d8:	d7478793          	addi	a5,a5,-652 # 2548 <threading_system_time>
    17dc:	439c                	lw	a5,0(a5)
    17de:	fcf42c23          	sw	a5,-40(s0)
    17e2:	4789                	li	a5,2
    17e4:	fcf42e23          	sw	a5,-36(s0)
    17e8:	00001797          	auipc	a5,0x1
    17ec:	d1078793          	addi	a5,a5,-752 # 24f8 <run_queue>
    17f0:	fef43023          	sd	a5,-32(s0)
    17f4:	00001797          	auipc	a5,0x1
    17f8:	d1478793          	addi	a5,a5,-748 # 2508 <release_queue>
    17fc:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_LST
    r = schedule_lst(args);
#endif

#ifdef THREAD_SCHEDULER_DM
    r = schedule_dm(args);
    1800:	fd843783          	ld	a5,-40(s0)
    1804:	faf43023          	sd	a5,-96(s0)
    1808:	fe043783          	ld	a5,-32(s0)
    180c:	faf43423          	sd	a5,-88(s0)
    1810:	fe843783          	ld	a5,-24(s0)
    1814:	faf43823          	sd	a5,-80(s0)
    1818:	fa040793          	addi	a5,s0,-96
    181c:	853e                	mv	a0,a5
    181e:	00001097          	auipc	ra,0x1
    1822:	916080e7          	jalr	-1770(ra) # 2134 <schedule_dm>
    1826:	872a                	mv	a4,a0
    1828:	87ae                	mv	a5,a1
    182a:	fce43423          	sd	a4,-56(s0)
    182e:	fcf43823          	sd	a5,-48(s0)
#endif

    current = r.scheduled_thread_list_member;
    1832:	fc843703          	ld	a4,-56(s0)
    1836:	00001797          	auipc	a5,0x1
    183a:	d0a78793          	addi	a5,a5,-758 # 2540 <current>
    183e:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1840:	fd042783          	lw	a5,-48(s0)
    1844:	873e                	mv	a4,a5
    1846:	00001797          	auipc	a5,0x1
    184a:	d0a78793          	addi	a5,a5,-758 # 2550 <allocated_time>
    184e:	e398                	sd	a4,0(a5)
}
    1850:	0001                	nop
    1852:	60e6                	ld	ra,88(sp)
    1854:	6446                	ld	s0,80(sp)
    1856:	6125                	addi	sp,sp,96
    1858:	8082                	ret

000000000000185a <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    185a:	1101                	addi	sp,sp,-32
    185c:	ec06                	sd	ra,24(sp)
    185e:	e822                	sd	s0,16(sp)
    1860:	1000                	addi	s0,sp,32
    1862:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1866:	00001797          	auipc	a5,0x1
    186a:	ce678793          	addi	a5,a5,-794 # 254c <sleeping>
    186e:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1872:	fe843783          	ld	a5,-24(s0)
    1876:	0007871b          	sext.w	a4,a5
    187a:	00001797          	auipc	a5,0x1
    187e:	cce78793          	addi	a5,a5,-818 # 2548 <threading_system_time>
    1882:	439c                	lw	a5,0(a5)
    1884:	2781                	sext.w	a5,a5
    1886:	9fb9                	addw	a5,a5,a4
    1888:	2781                	sext.w	a5,a5
    188a:	0007871b          	sext.w	a4,a5
    188e:	00001797          	auipc	a5,0x1
    1892:	cba78793          	addi	a5,a5,-838 # 2548 <threading_system_time>
    1896:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1898:	00001797          	auipc	a5,0x1
    189c:	c8078793          	addi	a5,a5,-896 # 2518 <main_thrd_id>
    18a0:	439c                	lw	a5,0(a5)
    18a2:	853e                	mv	a0,a5
    18a4:	fffff097          	auipc	ra,0xfffff
    18a8:	d82080e7          	jalr	-638(ra) # 626 <thrdresume>
}
    18ac:	0001                	nop
    18ae:	60e2                	ld	ra,24(sp)
    18b0:	6442                	ld	s0,16(sp)
    18b2:	6105                	addi	sp,sp,32
    18b4:	8082                	ret

00000000000018b6 <thread_start_threading>:

void thread_start_threading()
{
    18b6:	1141                	addi	sp,sp,-16
    18b8:	e406                	sd	ra,8(sp)
    18ba:	e022                	sd	s0,0(sp)
    18bc:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    18be:	00001797          	auipc	a5,0x1
    18c2:	c8a78793          	addi	a5,a5,-886 # 2548 <threading_system_time>
    18c6:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    18ca:	00001797          	auipc	a5,0x1
    18ce:	c7678793          	addi	a5,a5,-906 # 2540 <current>
    18d2:	00001717          	auipc	a4,0x1
    18d6:	c2670713          	addi	a4,a4,-986 # 24f8 <run_queue>
    18da:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    18dc:	4681                	li	a3,0
    18de:	00000617          	auipc	a2,0x0
    18e2:	f7c60613          	addi	a2,a2,-132 # 185a <back_to_main_handler>
    18e6:	00001597          	auipc	a1,0x1
    18ea:	c3258593          	addi	a1,a1,-974 # 2518 <main_thrd_id>
    18ee:	3e800513          	li	a0,1000
    18f2:	fffff097          	auipc	ra,0xfffff
    18f6:	d2c080e7          	jalr	-724(ra) # 61e <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    18fa:	00001797          	auipc	a5,0x1
    18fe:	c1e78793          	addi	a5,a5,-994 # 2518 <main_thrd_id>
    1902:	439c                	lw	a5,0(a5)
    1904:	4581                	li	a1,0
    1906:	853e                	mv	a0,a5
    1908:	fffff097          	auipc	ra,0xfffff
    190c:	d26080e7          	jalr	-730(ra) # 62e <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1910:	a0c9                	j	19d2 <thread_start_threading+0x11c>
        __release();
    1912:	00000097          	auipc	ra,0x0
    1916:	816080e7          	jalr	-2026(ra) # 1128 <__release>
        __schedule();
    191a:	00000097          	auipc	ra,0x0
    191e:	eb2080e7          	jalr	-334(ra) # 17cc <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1922:	00001797          	auipc	a5,0x1
    1926:	bf678793          	addi	a5,a5,-1034 # 2518 <main_thrd_id>
    192a:	439c                	lw	a5,0(a5)
    192c:	4581                	li	a1,0
    192e:	853e                	mv	a0,a5
    1930:	fffff097          	auipc	ra,0xfffff
    1934:	cfe080e7          	jalr	-770(ra) # 62e <cancelthrdstop>
        __dispatch();
    1938:	00000097          	auipc	ra,0x0
    193c:	d04080e7          	jalr	-764(ra) # 163c <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1940:	00001517          	auipc	a0,0x1
    1944:	bb850513          	addi	a0,a0,-1096 # 24f8 <run_queue>
    1948:	fffff097          	auipc	ra,0xfffff
    194c:	60a080e7          	jalr	1546(ra) # f52 <list_empty>
    1950:	87aa                	mv	a5,a0
    1952:	cb99                	beqz	a5,1968 <thread_start_threading+0xb2>
    1954:	00001517          	auipc	a0,0x1
    1958:	bb450513          	addi	a0,a0,-1100 # 2508 <release_queue>
    195c:	fffff097          	auipc	ra,0xfffff
    1960:	5f6080e7          	jalr	1526(ra) # f52 <list_empty>
    1964:	87aa                	mv	a5,a0
    1966:	ebd9                	bnez	a5,19fc <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1968:	00001797          	auipc	a5,0x1
    196c:	be878793          	addi	a5,a5,-1048 # 2550 <allocated_time>
    1970:	639c                	ld	a5,0(a5)
    1972:	85be                	mv	a1,a5
    1974:	00001517          	auipc	a0,0x1
    1978:	b4450513          	addi	a0,a0,-1212 # 24b8 <schedule_dm+0x384>
    197c:	fffff097          	auipc	ra,0xfffff
    1980:	148080e7          	jalr	328(ra) # ac4 <printf>
        sleeping = 1;
    1984:	00001797          	auipc	a5,0x1
    1988:	bc878793          	addi	a5,a5,-1080 # 254c <sleeping>
    198c:	4705                	li	a4,1
    198e:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1990:	00001797          	auipc	a5,0x1
    1994:	bc078793          	addi	a5,a5,-1088 # 2550 <allocated_time>
    1998:	639c                	ld	a5,0(a5)
    199a:	0007871b          	sext.w	a4,a5
    199e:	00001797          	auipc	a5,0x1
    19a2:	bb278793          	addi	a5,a5,-1102 # 2550 <allocated_time>
    19a6:	639c                	ld	a5,0(a5)
    19a8:	86be                	mv	a3,a5
    19aa:	00000617          	auipc	a2,0x0
    19ae:	eb060613          	addi	a2,a2,-336 # 185a <back_to_main_handler>
    19b2:	00001597          	auipc	a1,0x1
    19b6:	b6658593          	addi	a1,a1,-1178 # 2518 <main_thrd_id>
    19ba:	853a                	mv	a0,a4
    19bc:	fffff097          	auipc	ra,0xfffff
    19c0:	c62080e7          	jalr	-926(ra) # 61e <thrdstop>
        while (sleeping) {
    19c4:	0001                	nop
    19c6:	00001797          	auipc	a5,0x1
    19ca:	b8678793          	addi	a5,a5,-1146 # 254c <sleeping>
    19ce:	439c                	lw	a5,0(a5)
    19d0:	fbfd                	bnez	a5,19c6 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19d2:	00001517          	auipc	a0,0x1
    19d6:	b2650513          	addi	a0,a0,-1242 # 24f8 <run_queue>
    19da:	fffff097          	auipc	ra,0xfffff
    19de:	578080e7          	jalr	1400(ra) # f52 <list_empty>
    19e2:	87aa                	mv	a5,a0
    19e4:	d79d                	beqz	a5,1912 <thread_start_threading+0x5c>
    19e6:	00001517          	auipc	a0,0x1
    19ea:	b2250513          	addi	a0,a0,-1246 # 2508 <release_queue>
    19ee:	fffff097          	auipc	ra,0xfffff
    19f2:	564080e7          	jalr	1380(ra) # f52 <list_empty>
    19f6:	87aa                	mv	a5,a0
    19f8:	df89                	beqz	a5,1912 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    19fa:	a011                	j	19fe <thread_start_threading+0x148>
            break;
    19fc:	0001                	nop
}
    19fe:	0001                	nop
    1a00:	60a2                	ld	ra,8(sp)
    1a02:	6402                	ld	s0,0(sp)
    1a04:	0141                	addi	sp,sp,16
    1a06:	8082                	ret

0000000000001a08 <min>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

int min(int a, int b){
    1a08:	1101                	addi	sp,sp,-32
    1a0a:	ec22                	sd	s0,24(sp)
    1a0c:	1000                	addi	s0,sp,32
    1a0e:	87aa                	mv	a5,a0
    1a10:	872e                	mv	a4,a1
    1a12:	fef42623          	sw	a5,-20(s0)
    1a16:	87ba                	mv	a5,a4
    1a18:	fef42423          	sw	a5,-24(s0)
    return (a < b)? a:b;
    1a1c:	fec42603          	lw	a2,-20(s0)
    1a20:	fe842783          	lw	a5,-24(s0)
    1a24:	0007869b          	sext.w	a3,a5
    1a28:	0006071b          	sext.w	a4,a2
    1a2c:	00d75363          	bge	a4,a3,1a32 <min+0x2a>
    1a30:	87b2                	mv	a5,a2
    1a32:	2781                	sext.w	a5,a5
}
    1a34:	853e                	mv	a0,a5
    1a36:	6462                	ld	s0,24(sp)
    1a38:	6105                	addi	sp,sp,32
    1a3a:	8082                	ret

0000000000001a3c <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    1a3c:	715d                	addi	sp,sp,-80
    1a3e:	e4a2                	sd	s0,72(sp)
    1a40:	e0a6                	sd	s1,64(sp)
    1a42:	0880                	addi	s0,sp,80
    1a44:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    1a46:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1a4a:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1a4e:	649c                	ld	a5,8(s1)
    1a50:	639c                	ld	a5,0(a5)
    1a52:	fcf43c23          	sd	a5,-40(s0)
    1a56:	fd843783          	ld	a5,-40(s0)
    1a5a:	fd878793          	addi	a5,a5,-40
    1a5e:	fef43023          	sd	a5,-32(s0)
    1a62:	a81d                	j	1a98 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    1a64:	fe843783          	ld	a5,-24(s0)
    1a68:	cb89                	beqz	a5,1a7a <schedule_default+0x3e>
    1a6a:	fe043783          	ld	a5,-32(s0)
    1a6e:	5fd8                	lw	a4,60(a5)
    1a70:	fe843783          	ld	a5,-24(s0)
    1a74:	5fdc                	lw	a5,60(a5)
    1a76:	00f75663          	bge	a4,a5,1a82 <schedule_default+0x46>
            thread_with_smallest_id = th;
    1a7a:	fe043783          	ld	a5,-32(s0)
    1a7e:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1a82:	fe043783          	ld	a5,-32(s0)
    1a86:	779c                	ld	a5,40(a5)
    1a88:	fcf43823          	sd	a5,-48(s0)
    1a8c:	fd043783          	ld	a5,-48(s0)
    1a90:	fd878793          	addi	a5,a5,-40
    1a94:	fef43023          	sd	a5,-32(s0)
    1a98:	fe043783          	ld	a5,-32(s0)
    1a9c:	02878713          	addi	a4,a5,40
    1aa0:	649c                	ld	a5,8(s1)
    1aa2:	fcf711e3          	bne	a4,a5,1a64 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    1aa6:	fe843783          	ld	a5,-24(s0)
    1aaa:	cf89                	beqz	a5,1ac4 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    1aac:	fe843783          	ld	a5,-24(s0)
    1ab0:	02878793          	addi	a5,a5,40
    1ab4:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    1ab8:	fe843783          	ld	a5,-24(s0)
    1abc:	4fbc                	lw	a5,88(a5)
    1abe:	faf42c23          	sw	a5,-72(s0)
    1ac2:	a039                	j	1ad0 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1ac4:	649c                	ld	a5,8(s1)
    1ac6:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    1aca:	4785                	li	a5,1
    1acc:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1ad0:	fb043783          	ld	a5,-80(s0)
    1ad4:	fcf43023          	sd	a5,-64(s0)
    1ad8:	fb843783          	ld	a5,-72(s0)
    1adc:	fcf43423          	sd	a5,-56(s0)
    1ae0:	4701                	li	a4,0
    1ae2:	fc043703          	ld	a4,-64(s0)
    1ae6:	4781                	li	a5,0
    1ae8:	fc843783          	ld	a5,-56(s0)
    1aec:	863a                	mv	a2,a4
    1aee:	86be                	mv	a3,a5
    1af0:	8732                	mv	a4,a2
    1af2:	87b6                	mv	a5,a3
}
    1af4:	853a                	mv	a0,a4
    1af6:	85be                	mv	a1,a5
    1af8:	6426                	ld	s0,72(sp)
    1afa:	6486                	ld	s1,64(sp)
    1afc:	6161                	addi	sp,sp,80
    1afe:	8082                	ret

0000000000001b00 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{
    1b00:	7135                	addi	sp,sp,-160
    1b02:	ed06                	sd	ra,152(sp)
    1b04:	e922                	sd	s0,144(sp)
    1b06:	e526                	sd	s1,136(sp)
    1b08:	e14a                	sd	s2,128(sp)
    1b0a:	fcce                	sd	s3,120(sp)
    1b0c:	1100                	addi	s0,sp,160
    1b0e:	84aa                	mv	s1,a0
    //* DONE: implement the weighted round-robin scheduling algorithm
    struct thread *thread_head = NULL;
    1b10:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1b14:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b18:	649c                	ld	a5,8(s1)
    1b1a:	639c                	ld	a5,0(a5)
    1b1c:	faf43023          	sd	a5,-96(s0)
    1b20:	fa043783          	ld	a5,-96(s0)
    1b24:	fd878793          	addi	a5,a5,-40
    1b28:	fcf43023          	sd	a5,-64(s0)
    1b2c:	a025                	j	1b54 <schedule_wrr+0x54>
        if (thread_head == NULL){
    1b2e:	fc843783          	ld	a5,-56(s0)
    1b32:	e791                	bnez	a5,1b3e <schedule_wrr+0x3e>
            thread_head = th;
    1b34:	fc043783          	ld	a5,-64(s0)
    1b38:	fcf43423          	sd	a5,-56(s0)
            break;
    1b3c:	a01d                	j	1b62 <schedule_wrr+0x62>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b3e:	fc043783          	ld	a5,-64(s0)
    1b42:	779c                	ld	a5,40(a5)
    1b44:	f8f43c23          	sd	a5,-104(s0)
    1b48:	f9843783          	ld	a5,-104(s0)
    1b4c:	fd878793          	addi	a5,a5,-40
    1b50:	fcf43023          	sd	a5,-64(s0)
    1b54:	fc043783          	ld	a5,-64(s0)
    1b58:	02878713          	addi	a4,a5,40
    1b5c:	649c                	ld	a5,8(s1)
    1b5e:	fcf718e3          	bne	a4,a5,1b2e <schedule_wrr+0x2e>
        }
    }

    int next_release = -1;
    1b62:	57fd                	li	a5,-1
    1b64:	faf42e23          	sw	a5,-68(s0)
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    1b68:	689c                	ld	a5,16(s1)
    1b6a:	639c                	ld	a5,0(a5)
    1b6c:	f8f43823          	sd	a5,-112(s0)
    1b70:	f9043783          	ld	a5,-112(s0)
    1b74:	17e1                	addi	a5,a5,-8
    1b76:	faf43823          	sd	a5,-80(s0)
    1b7a:	fb043783          	ld	a5,-80(s0)
    1b7e:	679c                	ld	a5,8(a5)
    1b80:	f8f43423          	sd	a5,-120(s0)
    1b84:	f8843783          	ld	a5,-120(s0)
    1b88:	17e1                	addi	a5,a5,-8
    1b8a:	faf43423          	sd	a5,-88(s0)
    1b8e:	a899                	j	1be4 <schedule_wrr+0xe4>
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
    1b90:	fbc42783          	lw	a5,-68(s0)
    1b94:	0007871b          	sext.w	a4,a5
    1b98:	57fd                	li	a5,-1
    1b9a:	00f70f63          	beq	a4,a5,1bb8 <schedule_wrr+0xb8>
    1b9e:	fb043783          	ld	a5,-80(s0)
    1ba2:	4f98                	lw	a4,24(a5)
    1ba4:	409c                	lw	a5,0(s1)
    1ba6:	40f707bb          	subw	a5,a4,a5
    1baa:	0007871b          	sext.w	a4,a5
    1bae:	fbc42783          	lw	a5,-68(s0)
    1bb2:	2781                	sext.w	a5,a5
    1bb4:	00f75a63          	bge	a4,a5,1bc8 <schedule_wrr+0xc8>
            next_release = cur->release_time - args.current_time;
    1bb8:	fb043783          	ld	a5,-80(s0)
    1bbc:	4f98                	lw	a4,24(a5)
    1bbe:	409c                	lw	a5,0(s1)
    1bc0:	40f707bb          	subw	a5,a4,a5
    1bc4:	faf42e23          	sw	a5,-68(s0)
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    1bc8:	fa843783          	ld	a5,-88(s0)
    1bcc:	faf43823          	sd	a5,-80(s0)
    1bd0:	fa843783          	ld	a5,-88(s0)
    1bd4:	679c                	ld	a5,8(a5)
    1bd6:	f8f43023          	sd	a5,-128(s0)
    1bda:	f8043783          	ld	a5,-128(s0)
    1bde:	17e1                	addi	a5,a5,-8
    1be0:	faf43423          	sd	a5,-88(s0)
    1be4:	fb043783          	ld	a5,-80(s0)
    1be8:	00878713          	addi	a4,a5,8
    1bec:	689c                	ld	a5,16(s1)
    1bee:	faf711e3          	bne	a4,a5,1b90 <schedule_wrr+0x90>
        }
    }

    struct threads_sched_result r;
    if (thread_head != NULL) {
    1bf2:	fc843783          	ld	a5,-56(s0)
    1bf6:	cb95                	beqz	a5,1c2a <schedule_wrr+0x12a>
        r.scheduled_thread_list_member = &thread_head->thread_list;
    1bf8:	fc843783          	ld	a5,-56(s0)
    1bfc:	02878793          	addi	a5,a5,40
    1c00:	f6f43023          	sd	a5,-160(s0)
        r.allocated_time = min(thread_head->remaining_time, thread_head->weight * 2);
    1c04:	fc843783          	ld	a5,-56(s0)
    1c08:	4fb8                	lw	a4,88(a5)
    1c0a:	fc843783          	ld	a5,-56(s0)
    1c0e:	47bc                	lw	a5,72(a5)
    1c10:	0017979b          	slliw	a5,a5,0x1
    1c14:	2781                	sext.w	a5,a5
    1c16:	85be                	mv	a1,a5
    1c18:	853a                	mv	a0,a4
    1c1a:	00000097          	auipc	ra,0x0
    1c1e:	dee080e7          	jalr	-530(ra) # 1a08 <min>
    1c22:	87aa                	mv	a5,a0
    1c24:	f6f42423          	sw	a5,-152(s0)
    1c28:	a801                	j	1c38 <schedule_wrr+0x138>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1c2a:	649c                	ld	a5,8(s1)
    1c2c:	f6f43023          	sd	a5,-160(s0)
        r.allocated_time = next_release;
    1c30:	fbc42783          	lw	a5,-68(s0)
    1c34:	f6f42423          	sw	a5,-152(s0)
    }
    return r;
    1c38:	f6043783          	ld	a5,-160(s0)
    1c3c:	f6f43823          	sd	a5,-144(s0)
    1c40:	f6843783          	ld	a5,-152(s0)
    1c44:	f6f43c23          	sd	a5,-136(s0)
    1c48:	4701                	li	a4,0
    1c4a:	f7043703          	ld	a4,-144(s0)
    1c4e:	4781                	li	a5,0
    1c50:	f7843783          	ld	a5,-136(s0)
    1c54:	893a                	mv	s2,a4
    1c56:	89be                	mv	s3,a5
    1c58:	874a                	mv	a4,s2
    1c5a:	87ce                	mv	a5,s3
}
    1c5c:	853a                	mv	a0,a4
    1c5e:	85be                	mv	a1,a5
    1c60:	60ea                	ld	ra,152(sp)
    1c62:	644a                	ld	s0,144(sp)
    1c64:	64aa                	ld	s1,136(sp)
    1c66:	690a                	ld	s2,128(sp)
    1c68:	79e6                	ld	s3,120(sp)
    1c6a:	610d                	addi	sp,sp,160
    1c6c:	8082                	ret

0000000000001c6e <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{
    1c6e:	7119                	addi	sp,sp,-128
    1c70:	fca2                	sd	s0,120(sp)
    1c72:	f8a6                	sd	s1,112(sp)
    1c74:	0100                	addi	s0,sp,128
    1c76:	84aa                	mv	s1,a0
    //* DONE: implement the shortest-job-first scheduling algorithm
    struct thread *thread_shortest = NULL;
    1c78:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1c7c:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1c80:	649c                	ld	a5,8(s1)
    1c82:	639c                	ld	a5,0(a5)
    1c84:	fcf43023          	sd	a5,-64(s0)
    1c88:	fc043783          	ld	a5,-64(s0)
    1c8c:	fd878793          	addi	a5,a5,-40
    1c90:	fef43023          	sd	a5,-32(s0)
    1c94:	a899                	j	1cea <schedule_sjf+0x7c>
        if (thread_shortest == NULL || th->remaining_time < thread_shortest->remaining_time\
    1c96:	fe843783          	ld	a5,-24(s0)
    1c9a:	cb8d                	beqz	a5,1ccc <schedule_sjf+0x5e>
    1c9c:	fe043783          	ld	a5,-32(s0)
    1ca0:	4fb8                	lw	a4,88(a5)
    1ca2:	fe843783          	ld	a5,-24(s0)
    1ca6:	4fbc                	lw	a5,88(a5)
    1ca8:	02f74263          	blt	a4,a5,1ccc <schedule_sjf+0x5e>
        || (th->remaining_time == thread_shortest->remaining_time && th->ID < thread_shortest->ID))
    1cac:	fe043783          	ld	a5,-32(s0)
    1cb0:	4fb8                	lw	a4,88(a5)
    1cb2:	fe843783          	ld	a5,-24(s0)
    1cb6:	4fbc                	lw	a5,88(a5)
    1cb8:	00f71e63          	bne	a4,a5,1cd4 <schedule_sjf+0x66>
    1cbc:	fe043783          	ld	a5,-32(s0)
    1cc0:	5fd8                	lw	a4,60(a5)
    1cc2:	fe843783          	ld	a5,-24(s0)
    1cc6:	5fdc                	lw	a5,60(a5)
    1cc8:	00f75663          	bge	a4,a5,1cd4 <schedule_sjf+0x66>
            thread_shortest = th;
    1ccc:	fe043783          	ld	a5,-32(s0)
    1cd0:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1cd4:	fe043783          	ld	a5,-32(s0)
    1cd8:	779c                	ld	a5,40(a5)
    1cda:	faf43023          	sd	a5,-96(s0)
    1cde:	fa043783          	ld	a5,-96(s0)
    1ce2:	fd878793          	addi	a5,a5,-40
    1ce6:	fef43023          	sd	a5,-32(s0)
    1cea:	fe043783          	ld	a5,-32(s0)
    1cee:	02878713          	addi	a4,a5,40
    1cf2:	649c                	ld	a5,8(s1)
    1cf4:	faf711e3          	bne	a4,a5,1c96 <schedule_sjf+0x28>
    }

    struct release_queue_entry *cur, *nxt;
    int next_release = -1, a_time = thread_shortest->remaining_time;
    1cf8:	57fd                	li	a5,-1
    1cfa:	fcf42623          	sw	a5,-52(s0)
    1cfe:	fe843783          	ld	a5,-24(s0)
    1d02:	4fbc                	lw	a5,88(a5)
    1d04:	fcf42423          	sw	a5,-56(s0)
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    1d08:	689c                	ld	a5,16(s1)
    1d0a:	639c                	ld	a5,0(a5)
    1d0c:	faf43c23          	sd	a5,-72(s0)
    1d10:	fb843783          	ld	a5,-72(s0)
    1d14:	17e1                	addi	a5,a5,-8
    1d16:	fcf43c23          	sd	a5,-40(s0)
    1d1a:	fd843783          	ld	a5,-40(s0)
    1d1e:	679c                	ld	a5,8(a5)
    1d20:	faf43823          	sd	a5,-80(s0)
    1d24:	fb043783          	ld	a5,-80(s0)
    1d28:	17e1                	addi	a5,a5,-8
    1d2a:	fcf43823          	sd	a5,-48(s0)
    1d2e:	a8e9                	j	1e08 <schedule_sjf+0x19a>
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
    1d30:	fcc42783          	lw	a5,-52(s0)
    1d34:	0007871b          	sext.w	a4,a5
    1d38:	57fd                	li	a5,-1
    1d3a:	00f70f63          	beq	a4,a5,1d58 <schedule_sjf+0xea>
    1d3e:	fd843783          	ld	a5,-40(s0)
    1d42:	4f98                	lw	a4,24(a5)
    1d44:	409c                	lw	a5,0(s1)
    1d46:	40f707bb          	subw	a5,a4,a5
    1d4a:	0007871b          	sext.w	a4,a5
    1d4e:	fcc42783          	lw	a5,-52(s0)
    1d52:	2781                	sext.w	a5,a5
    1d54:	00f75a63          	bge	a4,a5,1d68 <schedule_sjf+0xfa>
            next_release = cur->release_time - args.current_time;
    1d58:	fd843783          	ld	a5,-40(s0)
    1d5c:	4f98                	lw	a4,24(a5)
    1d5e:	409c                	lw	a5,0(s1)
    1d60:	40f707bb          	subw	a5,a4,a5
    1d64:	fcf42623          	sw	a5,-52(s0)
        }

        if(cur->release_time < args.current_time + a_time\
    1d68:	fd843783          	ld	a5,-40(s0)
    1d6c:	4f8c                	lw	a1,24(a5)
    1d6e:	409c                	lw	a5,0(s1)
    1d70:	fc842703          	lw	a4,-56(s0)
    1d74:	9fb9                	addw	a5,a5,a4
    1d76:	2781                	sext.w	a5,a5
    1d78:	872e                	mv	a4,a1
    1d7a:	06f75963          	bge	a4,a5,1dec <schedule_sjf+0x17e>
            && (cur->release_time + cur->thrd->processing_time < args.current_time + thread_shortest->remaining_time\
    1d7e:	fd843783          	ld	a5,-40(s0)
    1d82:	4f98                	lw	a4,24(a5)
    1d84:	fd843783          	ld	a5,-40(s0)
    1d88:	639c                	ld	a5,0(a5)
    1d8a:	43fc                	lw	a5,68(a5)
    1d8c:	9fb9                	addw	a5,a5,a4
    1d8e:	0007859b          	sext.w	a1,a5
    1d92:	4098                	lw	a4,0(s1)
    1d94:	fe843783          	ld	a5,-24(s0)
    1d98:	4fbc                	lw	a5,88(a5)
    1d9a:	9fb9                	addw	a5,a5,a4
    1d9c:	2781                	sext.w	a5,a5
    1d9e:	872e                	mv	a4,a1
    1da0:	02f74e63          	blt	a4,a5,1ddc <schedule_sjf+0x16e>
                || (cur->release_time + cur->thrd->processing_time == args.current_time + thread_shortest->remaining_time\
    1da4:	fd843783          	ld	a5,-40(s0)
    1da8:	4f98                	lw	a4,24(a5)
    1daa:	fd843783          	ld	a5,-40(s0)
    1dae:	639c                	ld	a5,0(a5)
    1db0:	43fc                	lw	a5,68(a5)
    1db2:	9fb9                	addw	a5,a5,a4
    1db4:	0007859b          	sext.w	a1,a5
    1db8:	4098                	lw	a4,0(s1)
    1dba:	fe843783          	ld	a5,-24(s0)
    1dbe:	4fbc                	lw	a5,88(a5)
    1dc0:	9fb9                	addw	a5,a5,a4
    1dc2:	2781                	sext.w	a5,a5
    1dc4:	872e                	mv	a4,a1
    1dc6:	02f71363          	bne	a4,a5,1dec <schedule_sjf+0x17e>
                && cur->thrd->ID < thread_shortest->ID))){ 
    1dca:	fd843783          	ld	a5,-40(s0)
    1dce:	639c                	ld	a5,0(a5)
    1dd0:	5fd8                	lw	a4,60(a5)
    1dd2:	fe843783          	ld	a5,-24(s0)
    1dd6:	5fdc                	lw	a5,60(a5)
    1dd8:	00f75a63          	bge	a4,a5,1dec <schedule_sjf+0x17e>
            a_time = cur->release_time - args.current_time;
    1ddc:	fd843783          	ld	a5,-40(s0)
    1de0:	4f98                	lw	a4,24(a5)
    1de2:	409c                	lw	a5,0(s1)
    1de4:	40f707bb          	subw	a5,a4,a5
    1de8:	fcf42423          	sw	a5,-56(s0)
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    1dec:	fd043783          	ld	a5,-48(s0)
    1df0:	fcf43c23          	sd	a5,-40(s0)
    1df4:	fd043783          	ld	a5,-48(s0)
    1df8:	679c                	ld	a5,8(a5)
    1dfa:	faf43423          	sd	a5,-88(s0)
    1dfe:	fa843783          	ld	a5,-88(s0)
    1e02:	17e1                	addi	a5,a5,-8
    1e04:	fcf43823          	sd	a5,-48(s0)
    1e08:	fd843783          	ld	a5,-40(s0)
    1e0c:	00878713          	addi	a4,a5,8
    1e10:	689c                	ld	a5,16(s1)
    1e12:	f0f71fe3          	bne	a4,a5,1d30 <schedule_sjf+0xc2>
        }
    }

    struct threads_sched_result r;
    if (thread_shortest != NULL) {
    1e16:	fe843783          	ld	a5,-24(s0)
    1e1a:	cf81                	beqz	a5,1e32 <schedule_sjf+0x1c4>
        r.scheduled_thread_list_member = &thread_shortest->thread_list;
    1e1c:	fe843783          	ld	a5,-24(s0)
    1e20:	02878793          	addi	a5,a5,40
    1e24:	f8f43023          	sd	a5,-128(s0)
        r.allocated_time = a_time;
    1e28:	fc842783          	lw	a5,-56(s0)
    1e2c:	f8f42423          	sw	a5,-120(s0)
    1e30:	a801                	j	1e40 <schedule_sjf+0x1d2>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1e32:	649c                	ld	a5,8(s1)
    1e34:	f8f43023          	sd	a5,-128(s0)
        r.allocated_time = next_release;
    1e38:	fcc42783          	lw	a5,-52(s0)
    1e3c:	f8f42423          	sw	a5,-120(s0)
    }
    return r;
    1e40:	f8043783          	ld	a5,-128(s0)
    1e44:	f8f43823          	sd	a5,-112(s0)
    1e48:	f8843783          	ld	a5,-120(s0)
    1e4c:	f8f43c23          	sd	a5,-104(s0)
    1e50:	4701                	li	a4,0
    1e52:	f9043703          	ld	a4,-112(s0)
    1e56:	4781                	li	a5,0
    1e58:	f9843783          	ld	a5,-104(s0)
    1e5c:	863a                	mv	a2,a4
    1e5e:	86be                	mv	a3,a5
    1e60:	8732                	mv	a4,a2
    1e62:	87b6                	mv	a5,a3
}
    1e64:	853a                	mv	a0,a4
    1e66:	85be                	mv	a1,a5
    1e68:	7466                	ld	s0,120(sp)
    1e6a:	74c6                	ld	s1,112(sp)
    1e6c:	6109                	addi	sp,sp,128
    1e6e:	8082                	ret

0000000000001e70 <schedule_lst>:


/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    1e70:	7131                	addi	sp,sp,-192
    1e72:	fd06                	sd	ra,184(sp)
    1e74:	f922                	sd	s0,176(sp)
    1e76:	f526                	sd	s1,168(sp)
    1e78:	f14a                	sd	s2,160(sp)
    1e7a:	ed4e                	sd	s3,152(sp)
    1e7c:	0180                	addi	s0,sp,192
    1e7e:	84aa                	mv	s1,a0
    int least_slack_time = -1;
    1e80:	57fd                	li	a5,-1
    1e82:	fcf42623          	sw	a5,-52(s0)
    struct thread *thread_with_least_slack = NULL, *thread_miss = NULL;
    1e86:	fc043023          	sd	zero,-64(s0)
    1e8a:	fa043c23          	sd	zero,-72(s0)
    struct thread *th = NULL;
    1e8e:	fa043823          	sd	zero,-80(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1e92:	649c                	ld	a5,8(s1)
    1e94:	639c                	ld	a5,0(a5)
    1e96:	f8f43823          	sd	a5,-112(s0)
    1e9a:	f9043783          	ld	a5,-112(s0)
    1e9e:	fd878793          	addi	a5,a5,-40
    1ea2:	faf43823          	sd	a5,-80(s0)
    1ea6:	a05d                	j	1f4c <schedule_lst+0xdc>
        int slack_time = th->current_deadline - args.current_time - th->remaining_time;
    1ea8:	fb043783          	ld	a5,-80(s0)
    1eac:	4ff8                	lw	a4,92(a5)
    1eae:	409c                	lw	a5,0(s1)
    1eb0:	40f707bb          	subw	a5,a4,a5
    1eb4:	0007871b          	sext.w	a4,a5
    1eb8:	fb043783          	ld	a5,-80(s0)
    1ebc:	4fbc                	lw	a5,88(a5)
    1ebe:	40f707bb          	subw	a5,a4,a5
    1ec2:	f6f42623          	sw	a5,-148(s0)
        if (thread_with_least_slack == NULL || slack_time < least_slack_time || (slack_time == least_slack_time && th->ID < thread_with_least_slack->ID)) {
    1ec6:	fc043783          	ld	a5,-64(s0)
    1eca:	cb8d                	beqz	a5,1efc <schedule_lst+0x8c>
    1ecc:	f6c42703          	lw	a4,-148(s0)
    1ed0:	fcc42783          	lw	a5,-52(s0)
    1ed4:	2701                	sext.w	a4,a4
    1ed6:	2781                	sext.w	a5,a5
    1ed8:	02f74263          	blt	a4,a5,1efc <schedule_lst+0x8c>
    1edc:	f6c42703          	lw	a4,-148(s0)
    1ee0:	fcc42783          	lw	a5,-52(s0)
    1ee4:	2701                	sext.w	a4,a4
    1ee6:	2781                	sext.w	a5,a5
    1ee8:	02f71263          	bne	a4,a5,1f0c <schedule_lst+0x9c>
    1eec:	fb043783          	ld	a5,-80(s0)
    1ef0:	5fd8                	lw	a4,60(a5)
    1ef2:	fc043783          	ld	a5,-64(s0)
    1ef6:	5fdc                	lw	a5,60(a5)
    1ef8:	00f75a63          	bge	a4,a5,1f0c <schedule_lst+0x9c>
            least_slack_time = slack_time;
    1efc:	f6c42783          	lw	a5,-148(s0)
    1f00:	fcf42623          	sw	a5,-52(s0)
            thread_with_least_slack = th;
    1f04:	fb043783          	ld	a5,-80(s0)
    1f08:	fcf43023          	sd	a5,-64(s0)
        }
        if (th->current_deadline <= args.current_time){
    1f0c:	fb043783          	ld	a5,-80(s0)
    1f10:	4ff8                	lw	a4,92(a5)
    1f12:	409c                	lw	a5,0(s1)
    1f14:	02e7c163          	blt	a5,a4,1f36 <schedule_lst+0xc6>
            if (thread_miss == NULL || th->ID < thread_miss->ID){
    1f18:	fb843783          	ld	a5,-72(s0)
    1f1c:	cb89                	beqz	a5,1f2e <schedule_lst+0xbe>
    1f1e:	fb043783          	ld	a5,-80(s0)
    1f22:	5fd8                	lw	a4,60(a5)
    1f24:	fb843783          	ld	a5,-72(s0)
    1f28:	5fdc                	lw	a5,60(a5)
    1f2a:	00f75663          	bge	a4,a5,1f36 <schedule_lst+0xc6>
                thread_miss = th;
    1f2e:	fb043783          	ld	a5,-80(s0)
    1f32:	faf43c23          	sd	a5,-72(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1f36:	fb043783          	ld	a5,-80(s0)
    1f3a:	779c                	ld	a5,40(a5)
    1f3c:	f6f43023          	sd	a5,-160(s0)
    1f40:	f6043783          	ld	a5,-160(s0)
    1f44:	fd878793          	addi	a5,a5,-40
    1f48:	faf43823          	sd	a5,-80(s0)
    1f4c:	fb043783          	ld	a5,-80(s0)
    1f50:	02878713          	addi	a4,a5,40
    1f54:	649c                	ld	a5,8(s1)
    1f56:	f4f719e3          	bne	a4,a5,1ea8 <schedule_lst+0x38>
            }
        }
    }

    int next_release = -1,\
    1f5a:	57fd                	li	a5,-1
    1f5c:	faf42623          	sw	a5,-84(s0)
        a_time = min(thread_with_least_slack->current_deadline - args.current_time, thread_with_least_slack->remaining_time);
    1f60:	fc043783          	ld	a5,-64(s0)
    1f64:	4ff8                	lw	a4,92(a5)
    1f66:	409c                	lw	a5,0(s1)
    1f68:	40f707bb          	subw	a5,a4,a5
    1f6c:	0007871b          	sext.w	a4,a5
    1f70:	fc043783          	ld	a5,-64(s0)
    1f74:	4fbc                	lw	a5,88(a5)
    1f76:	85be                	mv	a1,a5
    1f78:	853a                	mv	a0,a4
    1f7a:	00000097          	auipc	ra,0x0
    1f7e:	a8e080e7          	jalr	-1394(ra) # 1a08 <min>
    1f82:	87aa                	mv	a5,a0
    1f84:	faf42423          	sw	a5,-88(s0)
    th = NULL;
    1f88:	fa043823          	sd	zero,-80(s0)
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    1f8c:	689c                	ld	a5,16(s1)
    1f8e:	639c                	ld	a5,0(a5)
    1f90:	f8f43423          	sd	a5,-120(s0)
    1f94:	f8843783          	ld	a5,-120(s0)
    1f98:	17e1                	addi	a5,a5,-8
    1f9a:	faf43023          	sd	a5,-96(s0)
    1f9e:	fa043783          	ld	a5,-96(s0)
    1fa2:	679c                	ld	a5,8(a5)
    1fa4:	f8f43023          	sd	a5,-128(s0)
    1fa8:	f8043783          	ld	a5,-128(s0)
    1fac:	17e1                	addi	a5,a5,-8
    1fae:	f8f43c23          	sd	a5,-104(s0)
    1fb2:	a8f5                	j	20ae <schedule_lst+0x23e>
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
    1fb4:	fac42783          	lw	a5,-84(s0)
    1fb8:	0007871b          	sext.w	a4,a5
    1fbc:	57fd                	li	a5,-1
    1fbe:	00f70f63          	beq	a4,a5,1fdc <schedule_lst+0x16c>
    1fc2:	fa043783          	ld	a5,-96(s0)
    1fc6:	4f98                	lw	a4,24(a5)
    1fc8:	409c                	lw	a5,0(s1)
    1fca:	40f707bb          	subw	a5,a4,a5
    1fce:	0007871b          	sext.w	a4,a5
    1fd2:	fac42783          	lw	a5,-84(s0)
    1fd6:	2781                	sext.w	a5,a5
    1fd8:	00f75a63          	bge	a4,a5,1fec <schedule_lst+0x17c>
            next_release = cur->release_time - args.current_time;
    1fdc:	fa043783          	ld	a5,-96(s0)
    1fe0:	4f98                	lw	a4,24(a5)
    1fe2:	409c                	lw	a5,0(s1)
    1fe4:	40f707bb          	subw	a5,a4,a5
    1fe8:	faf42623          	sw	a5,-84(s0)
        }
        int cur_slack = cur->thrd->period - cur->thrd->processing_time,\
    1fec:	fa043783          	ld	a5,-96(s0)
    1ff0:	639c                	ld	a5,0(a5)
    1ff2:	4bb8                	lw	a4,80(a5)
    1ff4:	fa043783          	ld	a5,-96(s0)
    1ff8:	639c                	ld	a5,0(a5)
    1ffa:	43fc                	lw	a5,68(a5)
    1ffc:	40f707bb          	subw	a5,a4,a5
    2000:	f6f42e23          	sw	a5,-132(s0)
            tmp_slack = thread_with_least_slack->current_deadline - cur->release_time - (thread_with_least_slack->remaining_time - (cur->release_time - args.current_time)); // twls's slack time @ cur's release
    2004:	fc043783          	ld	a5,-64(s0)
    2008:	4ff8                	lw	a4,92(a5)
    200a:	fa043783          	ld	a5,-96(s0)
    200e:	4f9c                	lw	a5,24(a5)
    2010:	40f707bb          	subw	a5,a4,a5
    2014:	0007871b          	sext.w	a4,a5
    2018:	fc043783          	ld	a5,-64(s0)
    201c:	4fb4                	lw	a3,88(a5)
    201e:	fa043783          	ld	a5,-96(s0)
    2022:	4f90                	lw	a2,24(a5)
    2024:	409c                	lw	a5,0(s1)
    2026:	40f607bb          	subw	a5,a2,a5
    202a:	2781                	sext.w	a5,a5
    202c:	40f687bb          	subw	a5,a3,a5
    2030:	2781                	sext.w	a5,a5
    2032:	40f707bb          	subw	a5,a4,a5
    2036:	f6f42c23          	sw	a5,-136(s0)
        if(cur->release_time < args.current_time + a_time\
    203a:	fa043783          	ld	a5,-96(s0)
    203e:	4f94                	lw	a3,24(a5)
    2040:	409c                	lw	a5,0(s1)
    2042:	fa842703          	lw	a4,-88(s0)
    2046:	9fb9                	addw	a5,a5,a4
    2048:	2781                	sext.w	a5,a5
    204a:	8736                	mv	a4,a3
    204c:	04f75363          	bge	a4,a5,2092 <schedule_lst+0x222>
        && (cur_slack < tmp_slack || (cur_slack == tmp_slack && cur->thrd->ID < thread_with_least_slack->ID))){ 
    2050:	f7c42703          	lw	a4,-132(s0)
    2054:	f7842783          	lw	a5,-136(s0)
    2058:	2701                	sext.w	a4,a4
    205a:	2781                	sext.w	a5,a5
    205c:	02f74363          	blt	a4,a5,2082 <schedule_lst+0x212>
    2060:	f7c42703          	lw	a4,-132(s0)
    2064:	f7842783          	lw	a5,-136(s0)
    2068:	2701                	sext.w	a4,a4
    206a:	2781                	sext.w	a5,a5
    206c:	02f71363          	bne	a4,a5,2092 <schedule_lst+0x222>
    2070:	fa043783          	ld	a5,-96(s0)
    2074:	639c                	ld	a5,0(a5)
    2076:	5fd8                	lw	a4,60(a5)
    2078:	fc043783          	ld	a5,-64(s0)
    207c:	5fdc                	lw	a5,60(a5)
    207e:	00f75a63          	bge	a4,a5,2092 <schedule_lst+0x222>
            a_time = cur->release_time - args.current_time;
    2082:	fa043783          	ld	a5,-96(s0)
    2086:	4f98                	lw	a4,24(a5)
    2088:	409c                	lw	a5,0(s1)
    208a:	40f707bb          	subw	a5,a4,a5
    208e:	faf42423          	sw	a5,-88(s0)
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    2092:	f9843783          	ld	a5,-104(s0)
    2096:	faf43023          	sd	a5,-96(s0)
    209a:	f9843783          	ld	a5,-104(s0)
    209e:	679c                	ld	a5,8(a5)
    20a0:	f6f43823          	sd	a5,-144(s0)
    20a4:	f7043783          	ld	a5,-144(s0)
    20a8:	17e1                	addi	a5,a5,-8
    20aa:	f8f43c23          	sd	a5,-104(s0)
    20ae:	fa043783          	ld	a5,-96(s0)
    20b2:	00878713          	addi	a4,a5,8
    20b6:	689c                	ld	a5,16(s1)
    20b8:	eef71ee3          	bne	a4,a5,1fb4 <schedule_lst+0x144>
        }
    }

    struct threads_sched_result r;
    if (thread_miss != NULL) {
    20bc:	fb843783          	ld	a5,-72(s0)
    20c0:	cb91                	beqz	a5,20d4 <schedule_lst+0x264>
        r.scheduled_thread_list_member = &thread_miss->thread_list;
    20c2:	fb843783          	ld	a5,-72(s0)
    20c6:	02878793          	addi	a5,a5,40
    20ca:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;
    20ce:	f4042423          	sw	zero,-184(s0)
    20d2:	a035                	j	20fe <schedule_lst+0x28e>
    } else if (thread_with_least_slack != NULL) {
    20d4:	fc043783          	ld	a5,-64(s0)
    20d8:	cf81                	beqz	a5,20f0 <schedule_lst+0x280>
        r.scheduled_thread_list_member = &thread_with_least_slack->thread_list;
    20da:	fc043783          	ld	a5,-64(s0)
    20de:	02878793          	addi	a5,a5,40
    20e2:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = a_time;
    20e6:	fa842783          	lw	a5,-88(s0)
    20ea:	f4f42423          	sw	a5,-184(s0)
    20ee:	a801                	j	20fe <schedule_lst+0x28e>
        // printf("%d, %d\n", thread_with_least_slack->current_deadline - args.current_time, thread_with_least_slack->remaining_time);
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    20f0:	649c                	ld	a5,8(s1)
    20f2:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = next_release; 
    20f6:	fac42783          	lw	a5,-84(s0)
    20fa:	f4f42423          	sw	a5,-184(s0)
    }
    return r;
    20fe:	f4043783          	ld	a5,-192(s0)
    2102:	f4f43823          	sd	a5,-176(s0)
    2106:	f4843783          	ld	a5,-184(s0)
    210a:	f4f43c23          	sd	a5,-168(s0)
    210e:	4701                	li	a4,0
    2110:	f5043703          	ld	a4,-176(s0)
    2114:	4781                	li	a5,0
    2116:	f5843783          	ld	a5,-168(s0)
    211a:	893a                	mv	s2,a4
    211c:	89be                	mv	s3,a5
    211e:	874a                	mv	a4,s2
    2120:	87ce                	mv	a5,s3
}
    2122:	853a                	mv	a0,a4
    2124:	85be                	mv	a1,a5
    2126:	70ea                	ld	ra,184(sp)
    2128:	744a                	ld	s0,176(sp)
    212a:	74aa                	ld	s1,168(sp)
    212c:	790a                	ld	s2,160(sp)
    212e:	69ea                	ld	s3,152(sp)
    2130:	6129                	addi	sp,sp,192
    2132:	8082                	ret

0000000000002134 <schedule_dm>:


/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    2134:	7171                	addi	sp,sp,-176
    2136:	f506                	sd	ra,168(sp)
    2138:	f122                	sd	s0,160(sp)
    213a:	ed26                	sd	s1,152(sp)
    213c:	e94a                	sd	s2,144(sp)
    213e:	e54e                	sd	s3,136(sp)
    2140:	1900                	addi	s0,sp,176
    2142:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    struct thread *thread_ddl = NULL, *thread_miss = NULL;
    2144:	fc043423          	sd	zero,-56(s0)
    2148:	fc043023          	sd	zero,-64(s0)
    struct thread *th = NULL;
    214c:	fa043c23          	sd	zero,-72(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    2150:	649c                	ld	a5,8(s1)
    2152:	639c                	ld	a5,0(a5)
    2154:	f8f43c23          	sd	a5,-104(s0)
    2158:	f9843783          	ld	a5,-104(s0)
    215c:	fd878793          	addi	a5,a5,-40
    2160:	faf43c23          	sd	a5,-72(s0)
    2164:	a041                	j	21e4 <schedule_dm+0xb0>
        if (thread_ddl == NULL || th->deadline < thread_ddl->deadline || (th->deadline == thread_ddl->deadline && th->ID < thread_ddl->ID))
    2166:	fc843783          	ld	a5,-56(s0)
    216a:	cb8d                	beqz	a5,219c <schedule_dm+0x68>
    216c:	fb843783          	ld	a5,-72(s0)
    2170:	47f8                	lw	a4,76(a5)
    2172:	fc843783          	ld	a5,-56(s0)
    2176:	47fc                	lw	a5,76(a5)
    2178:	02f74263          	blt	a4,a5,219c <schedule_dm+0x68>
    217c:	fb843783          	ld	a5,-72(s0)
    2180:	47f8                	lw	a4,76(a5)
    2182:	fc843783          	ld	a5,-56(s0)
    2186:	47fc                	lw	a5,76(a5)
    2188:	00f71e63          	bne	a4,a5,21a4 <schedule_dm+0x70>
    218c:	fb843783          	ld	a5,-72(s0)
    2190:	5fd8                	lw	a4,60(a5)
    2192:	fc843783          	ld	a5,-56(s0)
    2196:	5fdc                	lw	a5,60(a5)
    2198:	00f75663          	bge	a4,a5,21a4 <schedule_dm+0x70>
            thread_ddl = th;
    219c:	fb843783          	ld	a5,-72(s0)
    21a0:	fcf43423          	sd	a5,-56(s0)
        if (th->current_deadline <= args.current_time){
    21a4:	fb843783          	ld	a5,-72(s0)
    21a8:	4ff8                	lw	a4,92(a5)
    21aa:	409c                	lw	a5,0(s1)
    21ac:	02e7c163          	blt	a5,a4,21ce <schedule_dm+0x9a>
            if (thread_miss == NULL || th->ID < thread_miss->ID){
    21b0:	fc043783          	ld	a5,-64(s0)
    21b4:	cb89                	beqz	a5,21c6 <schedule_dm+0x92>
    21b6:	fb843783          	ld	a5,-72(s0)
    21ba:	5fd8                	lw	a4,60(a5)
    21bc:	fc043783          	ld	a5,-64(s0)
    21c0:	5fdc                	lw	a5,60(a5)
    21c2:	00f75663          	bge	a4,a5,21ce <schedule_dm+0x9a>
                thread_miss = th;
    21c6:	fb843783          	ld	a5,-72(s0)
    21ca:	fcf43023          	sd	a5,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    21ce:	fb843783          	ld	a5,-72(s0)
    21d2:	779c                	ld	a5,40(a5)
    21d4:	f6f43c23          	sd	a5,-136(s0)
    21d8:	f7843783          	ld	a5,-136(s0)
    21dc:	fd878793          	addi	a5,a5,-40
    21e0:	faf43c23          	sd	a5,-72(s0)
    21e4:	fb843783          	ld	a5,-72(s0)
    21e8:	02878713          	addi	a4,a5,40
    21ec:	649c                	ld	a5,8(s1)
    21ee:	f6f71ce3          	bne	a4,a5,2166 <schedule_dm+0x32>
            }
        }
    }

    int next_release = -1,\
    21f2:	57fd                	li	a5,-1
    21f4:	faf42a23          	sw	a5,-76(s0)
        a_time = min(thread_ddl->current_deadline - args.current_time, thread_ddl->remaining_time);
    21f8:	fc843783          	ld	a5,-56(s0)
    21fc:	4ff8                	lw	a4,92(a5)
    21fe:	409c                	lw	a5,0(s1)
    2200:	40f707bb          	subw	a5,a4,a5
    2204:	0007871b          	sext.w	a4,a5
    2208:	fc843783          	ld	a5,-56(s0)
    220c:	4fbc                	lw	a5,88(a5)
    220e:	85be                	mv	a1,a5
    2210:	853a                	mv	a0,a4
    2212:	fffff097          	auipc	ra,0xfffff
    2216:	7f6080e7          	jalr	2038(ra) # 1a08 <min>
    221a:	87aa                	mv	a5,a0
    221c:	faf42823          	sw	a5,-80(s0)
    th = NULL;
    2220:	fa043c23          	sd	zero,-72(s0)
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    2224:	689c                	ld	a5,16(s1)
    2226:	639c                	ld	a5,0(a5)
    2228:	f8f43823          	sd	a5,-112(s0)
    222c:	f9043783          	ld	a5,-112(s0)
    2230:	17e1                	addi	a5,a5,-8
    2232:	faf43423          	sd	a5,-88(s0)
    2236:	fa843783          	ld	a5,-88(s0)
    223a:	679c                	ld	a5,8(a5)
    223c:	f8f43423          	sd	a5,-120(s0)
    2240:	f8843783          	ld	a5,-120(s0)
    2244:	17e1                	addi	a5,a5,-8
    2246:	faf43023          	sd	a5,-96(s0)
    224a:	a84d                	j	22fc <schedule_dm+0x1c8>
        if(next_release == -1 || cur->release_time - args.current_time < next_release){ 
    224c:	fb442783          	lw	a5,-76(s0)
    2250:	0007871b          	sext.w	a4,a5
    2254:	57fd                	li	a5,-1
    2256:	00f70f63          	beq	a4,a5,2274 <schedule_dm+0x140>
    225a:	fa843783          	ld	a5,-88(s0)
    225e:	4f98                	lw	a4,24(a5)
    2260:	409c                	lw	a5,0(s1)
    2262:	40f707bb          	subw	a5,a4,a5
    2266:	0007871b          	sext.w	a4,a5
    226a:	fb442783          	lw	a5,-76(s0)
    226e:	2781                	sext.w	a5,a5
    2270:	00f75a63          	bge	a4,a5,2284 <schedule_dm+0x150>
            next_release = cur->release_time - args.current_time;
    2274:	fa843783          	ld	a5,-88(s0)
    2278:	4f98                	lw	a4,24(a5)
    227a:	409c                	lw	a5,0(s1)
    227c:	40f707bb          	subw	a5,a4,a5
    2280:	faf42a23          	sw	a5,-76(s0)
        }
        // printf("cur   #%d ddl = %d\n", cur->thrd->ID, cur->thrd->deadline);
        // printf("thddl #%d ddl = %d\n\n\n", thread_ddl->ID, thread_ddl->deadline);
        if(cur->release_time < args.current_time + a_time\
    2284:	fa843783          	ld	a5,-88(s0)
    2288:	4f94                	lw	a3,24(a5)
    228a:	409c                	lw	a5,0(s1)
    228c:	fb042703          	lw	a4,-80(s0)
    2290:	9fb9                	addw	a5,a5,a4
    2292:	2781                	sext.w	a5,a5
    2294:	8736                	mv	a4,a3
    2296:	04f75563          	bge	a4,a5,22e0 <schedule_dm+0x1ac>
        && (cur->thrd->deadline < thread_ddl->deadline || (cur->thrd->deadline == thread_ddl->deadline && cur->thrd->ID < thread_ddl->ID))){ 
    229a:	fa843783          	ld	a5,-88(s0)
    229e:	639c                	ld	a5,0(a5)
    22a0:	47f8                	lw	a4,76(a5)
    22a2:	fc843783          	ld	a5,-56(s0)
    22a6:	47fc                	lw	a5,76(a5)
    22a8:	02f74463          	blt	a4,a5,22d0 <schedule_dm+0x19c>
    22ac:	fa843783          	ld	a5,-88(s0)
    22b0:	639c                	ld	a5,0(a5)
    22b2:	47f8                	lw	a4,76(a5)
    22b4:	fc843783          	ld	a5,-56(s0)
    22b8:	47fc                	lw	a5,76(a5)
    22ba:	02f71363          	bne	a4,a5,22e0 <schedule_dm+0x1ac>
    22be:	fa843783          	ld	a5,-88(s0)
    22c2:	639c                	ld	a5,0(a5)
    22c4:	5fd8                	lw	a4,60(a5)
    22c6:	fc843783          	ld	a5,-56(s0)
    22ca:	5fdc                	lw	a5,60(a5)
    22cc:	00f75a63          	bge	a4,a5,22e0 <schedule_dm+0x1ac>
            a_time = cur->release_time - args.current_time;
    22d0:	fa843783          	ld	a5,-88(s0)
    22d4:	4f98                	lw	a4,24(a5)
    22d6:	409c                	lw	a5,0(s1)
    22d8:	40f707bb          	subw	a5,a4,a5
    22dc:	faf42823          	sw	a5,-80(s0)
    list_for_each_entry_safe(cur, nxt, args.release_queue, thread_list) { 
    22e0:	fa043783          	ld	a5,-96(s0)
    22e4:	faf43423          	sd	a5,-88(s0)
    22e8:	fa043783          	ld	a5,-96(s0)
    22ec:	679c                	ld	a5,8(a5)
    22ee:	f8f43023          	sd	a5,-128(s0)
    22f2:	f8043783          	ld	a5,-128(s0)
    22f6:	17e1                	addi	a5,a5,-8
    22f8:	faf43023          	sd	a5,-96(s0)
    22fc:	fa843783          	ld	a5,-88(s0)
    2300:	00878713          	addi	a4,a5,8
    2304:	689c                	ld	a5,16(s1)
    2306:	f4f713e3          	bne	a4,a5,224c <schedule_dm+0x118>
        }
    }

    struct threads_sched_result r;
    if (thread_miss != NULL) {
    230a:	fc043783          	ld	a5,-64(s0)
    230e:	cb91                	beqz	a5,2322 <schedule_dm+0x1ee>
        r.scheduled_thread_list_member = &thread_miss->thread_list;
    2310:	fc043783          	ld	a5,-64(s0)
    2314:	02878793          	addi	a5,a5,40
    2318:	f4f43c23          	sd	a5,-168(s0)
        r.allocated_time = 0;
    231c:	f6042023          	sw	zero,-160(s0)
    2320:	a035                	j	234c <schedule_dm+0x218>
    } else if (thread_ddl != NULL) {
    2322:	fc843783          	ld	a5,-56(s0)
    2326:	cf81                	beqz	a5,233e <schedule_dm+0x20a>
        r.scheduled_thread_list_member = &thread_ddl->thread_list;
    2328:	fc843783          	ld	a5,-56(s0)
    232c:	02878793          	addi	a5,a5,40
    2330:	f4f43c23          	sd	a5,-168(s0)
        r.allocated_time = a_time;
    2334:	fb042783          	lw	a5,-80(s0)
    2338:	f6f42023          	sw	a5,-160(s0)
    233c:	a801                	j	234c <schedule_dm+0x218>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    233e:	649c                	ld	a5,8(s1)
    2340:	f4f43c23          	sd	a5,-168(s0)
        r.allocated_time = next_release;
    2344:	fb442783          	lw	a5,-76(s0)
    2348:	f6f42023          	sw	a5,-160(s0)
    }
    return r;
    234c:	f5843783          	ld	a5,-168(s0)
    2350:	f6f43423          	sd	a5,-152(s0)
    2354:	f6043783          	ld	a5,-160(s0)
    2358:	f6f43823          	sd	a5,-144(s0)
    235c:	4701                	li	a4,0
    235e:	f6843703          	ld	a4,-152(s0)
    2362:	4781                	li	a5,0
    2364:	f7043783          	ld	a5,-144(s0)
    2368:	893a                	mv	s2,a4
    236a:	89be                	mv	s3,a5
    236c:	874a                	mv	a4,s2
    236e:	87ce                	mv	a5,s3
}
    2370:	853a                	mv	a0,a4
    2372:	85be                	mv	a1,a5
    2374:	70aa                	ld	ra,168(sp)
    2376:	740a                	ld	s0,160(sp)
    2378:	64ea                	ld	s1,152(sp)
    237a:	694a                	ld	s2,144(sp)
    237c:	69aa                	ld	s3,136(sp)
    237e:	614d                	addi	sp,sp,176
    2380:	8082                	ret
