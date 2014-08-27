%{
#include <iostream>
#include <cstdio>

#define YY_DECL extern "C" int yylex()

#include "material.tab.h"

using namespace std;


%}

%%
[\t\n]			;
[0-9]+\.[0-9]+		{ yylval.bpval = atof(yytext); return BP; }
(?:Material)		{ yylval.mval = strdup(yytext); return Material; }
("[, ], (, ), ;")+	{ return Ignore; }
.			;
%%
