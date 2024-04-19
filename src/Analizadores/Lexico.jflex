package Analizadores;

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

{ID}        { return symbol(ParserSym.ID, Integer.valueOf(yytext())); }
{NOMBRE}    { return symbol(ParserSym.nombre, yytext()); }
"("         { return symbol(ParserSym.pareni, yytext()); }
")"         { return symbol(ParserSym.parend, yytext()); }
";"         { return symbol(ParserSym.pcoma, yytext()); }
","         { return symbol(ParserSym.coma, yytext()); }

<YYINITIAL> "CURSO"             {   System.out.println("Reconocido: <<"+yytext()+">>, rvoid");
                                return symbol(ParserSym.curso, yytext());}

<YYINITIAL> "ESTUDIANTE"             {   System.out.println("Reconocido: <<"+yytext()+">>, rvoid");
                                return symbol(ParserSym.estudiante, yytext());}

<YYINITIAL> "BUSCAR_ESTUDIANTE"             {   System.out.println("Reconocido: <<"+yytext()+">>, rvoid");
                                return symbol(ParserSym.bestudiante, yytext());}

<YYINITIAL> "ELIMINAR_ESTUDIANTE"             {   System.out.println("Reconocido: <<"+yytext()+">>, rvoid");
                                return symbol(ParserSym.eestudiante, yytext());}

<YYINITIAL> "MOSTRAR_ESTUDIANTE"             {   System.out.println("Reconocido: <<"+yytext()+">>, rvoid");
                                return symbol(ParserSym.mestudiante, yytext());}

<YYINITIAL> "MOSTRAR_CURSOS"             {   System.out.println("Reconocido: <<"+yytext()+">>, rvoid");
                                return symbol(ParserSym.mcurso, yytext());}

{whitespace}+ { /* skip white spaces */ }
[^]                             {throw new Error("Cadena ilegal <"+
                                                        yytext()+">"); }

