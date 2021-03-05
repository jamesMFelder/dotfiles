#include <stdio.h>

int main(){
	int i, j;
	printf(" ");
	for(i=0;i<10;i++){
		printf(" %d", i);
	}
	printf("\n");
	for(i=0;i<10;i++){
		printf("--");
	}
	printf("\n");
	for(i=0;i<13;i++){
		printf("%d|", i);
		for(j=0;j<10;j++){
			printf(" %c", i*10+j);
		}
		printf("\n");
	}
	return 0;
}
