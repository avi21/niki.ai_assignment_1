%{
    FILE *output_file;
    void numbers(char array[], FILE *output_file);
%}

%%
\+91\-[0-9][0-9][0-9][0-9][0-9]\-[0-9][0-9][0-9][0-9][0-9] {numbers(yytext, output_file);}
\+91[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] {numbers(yytext, output_file);}
\+91\ [0-9][0-9][0-9][0-9][0-9]\ [0-9][0-9][0-9][0-9][0-9] {numbers(yytext, output_file);}
\+91\ [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] {numbers(yytext, output_file);}
\+91\-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] {numbers(yytext, output_file);}
%%
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
void numbers(char array[], FILE* output_file)
    {
        // char final[10];
        int i=3;
        int j=0;
        while(array[i]!='\0')
        {
            if(array[i]>47&&array[i]<58)
            fprintf(output_file,"%c",array[i]);   
            i++;     
            
        }
        fprintf(output_file,"\n");
        
        
        // return final;
    }
int main(int argc, char **argv)
{
        DIR  *d;
        struct dirent *dir;
        d = opendir(".");
        output_file = fopen("outputfile.txt", "w");
         if (d)
            {
                while ((dir = readdir(d)) != NULL)
                {
                if(dir->d_name[0] == '.'){
                    continue;
                }
                yyin = fopen(dir->d_name, "r");
                yylex();
                fclose(yyin);
                }
                closedir(d);
  }
    return 0;
}