%{
#include <iostream>
#include <cstdio>
using namespace std;

extern "C" int yylex ();
extern "C" int yyparse (void);
extern "C" FILE *yyin;

void yyerror(const char *s);
%}

%union{
	float bpval;
	char *mval;
}

%token <bpval>	BP
%token <mval>	Material
%token		Ignore

%%
material:
	material BP		{ cout << "Boiling Point Added : " << $2 << endl; }
	| material Material	{ cout << "Material Added : " << $2 << endl;}
	| material Ignore	{ }
	| BP			{ cout << "Boiling Point Added" << $1 << endl; }
	| Material 		{ cout << "Material Added : " << $1 << endl; }
	| Ignore		{ }
	;
%%

main() {
//	std::string f_name;
//	cout << "Enter the name of the file you want to fetch data" << endl;
//	cin >> f_name;

	FILE *myfile = fopen("material.json", "r");
	// make sure it is valid:
	if (!myfile) {
		cout << "I can't open file" << endl;
		return -1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = myfile;

	do{
		yyparse();
	} while (!feof(yyin));
}

void yyerror(const char *s){
	exit(-1);
}
