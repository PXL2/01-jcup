import java_cup.runtime.Symbol;

%%

%cup
%line
%column

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

// Expressões Regulares
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
Integer        = [0-9]+

%%

<YYINITIAL> {
  {Integer}        { return symbol(sym.INTEIRO, new Integer(yytext())); }
  "+"              { return symbol(sym.MAIS); }
  "-"              { return symbol(sym.MENOS); }
  "*"              { return symbol(sym.VEZES); }
  "/"              { return symbol(sym.DIVISAO); }
  "%"              { return symbol(sym.RESTO); }
  "^"              { return symbol(sym.POTENCIA); }
  ";"              { return symbol(sym.PTVIRG); }
  "("              { return symbol(sym.PARENTESQ); }
  ")"              { return symbol(sym.PARENTDIR); }
  {WhiteSpace}     { /* ignora */ }
}

[^] { System.err.println("Caractere inválido: <" + yytext() + ">"); }