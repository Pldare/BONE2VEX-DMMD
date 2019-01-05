#include <stdio.h>
#include <string.h>
int main(){
	char fist[2000]="ruby 3.rb add.csv";
	char last[2000]={0};
	char steup[2000]="ruby 1.rb";
	char steup2[2000]={0};
	//char log[2000]=">facial.csv"; 
	printf("ready start!\n");
	FILE * fp=fopen("NEW1.csv","r");
	if (fp==NULL){
	system("ruby 1.rb 1.csv");
	}
	printf("edit face file name?\n");
	scanf("%s",steup2);
	char *othername=(char *) malloc(strlen(steup)+strlen(steup2));
	sprintf(othername,"%s %s",steup,steup2); 
	system(othername);
	
	//system("ruby 1.rb 2.csv");
	printf("预处理 done!\n");
	system("2.exe");
	printf("数据合并 done!\n");
	printf("facial name?\n");
	scanf("%s",last);
	char *othername2=(char *) malloc(strlen(fist)+strlen(last));
	sprintf(othername2,"%s %s",fist,last); 
	system(othername2);
	//system("3.exe add.csv face1>facial.csv");
	printf("数值计算 done!\n");
	system("del NEW1.csv");
	system("del NEW2.csv");
	system("del add.csv");
	system("pause");
}
