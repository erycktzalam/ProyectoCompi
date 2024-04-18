package Analizadores

import java_cup.runtime.*;

%%
%public
%class Lexer
%cup

ID = [0-9]
NOMBRE = [A-Z]
whitespace = [ \t\n]

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

%%

{ID}+ { return symbol(ParserSym.NUMBER, Integer.valueOf(yytext())); }
"(" {return symbol(ParserSym.pareni, yytext()); }
")" {return symbol(ParserSym.parend, yytext()); }
";" {return symbol(ParserSym.pcoma, yytext()); }
"," {return symbol(ParserSym.coma, yytext()); }

{whitespace}+ { /* skip white spaces */ }
[^]                             {throw new Error("Cadena ilegal <"+
                                                        yytext()+">"); }

