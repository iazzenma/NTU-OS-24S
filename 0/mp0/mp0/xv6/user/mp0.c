#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"

int dir_num, file_num;
char *key;
char *str1 = ".", *str2 = "..";
int first_time;

int strncmp(const char *str1, const char *str2, int n) {
    while (n--) {
        if (*str1 != *str2) {
            return (*str1 - *str2);
        }

        if (*str1 == '\0') {
            // If we reach the end of str1 before n characters, return 0
            return 0;
        }

        str1++;
        str2++;
    }

    return 0;  // Strings are equal up to the first n characters
}

int countOccurrences(const char *str) {
    int count = 0;
    int patternLength = strlen(key);
    int strLength = strlen(str);

    for (int i = 0; i <= strLength - patternLength; i++) {
        if (strncmp(str + i, key, patternLength) == 0) {
            count++;
        }
    }

    return count;
}

void tree(char *path){
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st;

    if ((fd = open(path, 0)) < 0) {
        printf("%s [error opening dir]\n", path);
        return;
    }
    
    if(fstat(fd, &st) < 0){
        fprintf(2, "ls: cannot stat %s\n", path);
        close(fd);
        return;
    }

    if(first_time == 0 && st.type != T_DIR){
        printf("%s [error opening dir]\n", path);
        return;
    }
    first_time++;
    int count = countOccurrences(path); 
    printf("%s %d\n", path, count);
    switch (st.type) {
        case T_FILE:
            file_num++;
            break;

        case T_DIR:
            dir_num++;
            while (read(fd, &de, sizeof(de)) == sizeof(de)) {
                strcpy(buf, path);
                p = buf + strlen(buf);
                *p++ = '/';
                // printf("///buf = [%s]\n", buf);
                if(de.inum == 0) continue;
                // printf("///in %s, there is [%s]\n", path, de.name);
                if(strncmp(de.name, str1, strlen(de.name)) == 0 ||
                strncmp(de.name, str2, strlen(de.name)) == 0) continue;
                memmove(p, de.name, DIRSIZ);
                p[DIRSIZ] = 0;
                // printf("///entering [%s]\n", buf);
                tree(buf); 
            }
            break;
    }
    close(fd);
}

int main(int argc, char *argv[]){
    char *root_dir = argv[1];
    key = argv[2];
    // printf("///running mp0, root = %s and key = %s\n", root_dir, key);

    int pid, p[2];
    if (pipe(p) == -1){
		exit(1);
	}

    if((pid = fork()) == 0){ //child
        close(p[0]); //writing
        tree(root_dir);
        if(dir_num > 0) --dir_num;
        write(p[1], &dir_num, sizeof(int));
        write(p[1], &file_num, sizeof(int));
        close(p[1]);
        exit(0);
    }
    else{ //parent
        close(p[1]); //reading
        wait(&pid);
        read(p[0], &dir_num, sizeof(int));
        read(p[0], &file_num, sizeof(int));
        close(p[0]);
        printf("\n%d directories, %d files\n", dir_num, file_num);
    }
    exit(0);
}