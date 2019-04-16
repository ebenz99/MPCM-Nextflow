#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/mman.h>

#define _GNU_SOURCE
#define SECTOR_SIZE 512
#define FAT_SIZE 9



int main(int arc, char *argv[]){
	int f = open("./floppys/simple.img", O_RDWR, S_IRUSR | S_IWUSR);
	struct stat fstats;

	fstat(f,&fstats);

	int sz = fstats.st_size;
	printf("size is %d\n", sz);

	char *fileStart = mmap(NULL, sz, PROT_READ, MAP_SHARED, f, 0);
	char *fileCursor = fileStart;


	fileCursor+=SECTOR_SIZE;

	int first;
	int second;
	int counter;

	int FAT1[SECTOR_SIZE*FAT_SIZE*2/3];


	while(fileCursor<fileStart+(512*10)){
		first = 0;
		second = 0;
		first+= (((*(fileCursor)))&0xf);				//second niblet
		first+= (((*(fileCursor)))&0xf0);  			//isolates the first niblet 4 displaced
		fileCursor+=1;
		first += ((((*(fileCursor)))&0xf)<<8);		//the second niblet 8 displaced
		FAT1[counter] = first;
		counter+=1;
		second += (((*(fileCursor))>>4)&0xf);  		//isolates the first niblet
		fileCursor+=1;
		second += ((((*(fileCursor)))&0xf0)<<4);  	//isolates the first niblet 8 displaced
		second += ((((*(fileCursor)))&0xf)<<4);		//the second niblet 4 displaced
		fileCursor+=1;
		FAT1[counter] = second;
		counter+=1;
	
	}

	//printf("%d\n",fileCursor-fileStart);

	int FAT2[SECTOR_SIZE*FAT_SIZE*2/3];
	counter = 0;


	while(fileCursor<fileStart+(512*18)){
		first = 0;
		second = 0;
		first+= (((*(fileCursor)))&0xf);				//second niblet
		first+= (((*(fileCursor)))&0xf0);  			//isolates the first niblet 4 displaced
		fileCursor+=1;
		first += ((((*(fileCursor)))&0xf)<<8);		//the second niblet 8 displaced
		FAT2[counter] = first;
		counter+=1;
		second += (((*(fileCursor))>>4)&0xf);  		//isolates the first niblet
		fileCursor+=1;
		second += ((((*(fileCursor)))&0xf0)<<4);  	//isolates the first niblet 8 displaced
		second += ((((*(fileCursor)))&0xf)<<4);		//the second niblet 4 displaced
		fileCursor+=1;
		FAT2[counter] = second;
		counter+=1;
	
	}




	return 0;

}