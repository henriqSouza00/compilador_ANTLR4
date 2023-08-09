grammar Gramatica;

@header {
      import java.util.*;
      import java.util.Scanner;
      import java.io.FileWriter;
      import java.io.IOException;
}
@members {
      Variavel x = new Variavel();
      operacaoVariavel ov = new operacaoVariavel();
      String output="";
      int escopo;
      int tipo;
      String nome;
}

programa: declarar 'start' AB {
                        output += "import java.util.Scanner;\n";
                        output += "import java.io.IOException;\n";
                        output += "import java.io.FileWriter;\n";
                        output += "public class Saida  {\n";
                        }
                        {
                            output += "private static Scanner sc = new Scanner(System.in);\n";
                            output += "\tpublic static void main(String args[]) throws IOException {\n";
                        }
            declarar
            snippet
            FB
            'end' {output += "\n\t}\n";}
                        {output += "}\n";}
                        {
                            try {
                                FileWriter writer = new FileWriter("output/Saida.java");
                                writer.write(output);
                                writer.close();
                                System.out.println("Compilado com sucesso");
                            } catch (IOException e) {
                                System.out.println("Ocorreu um erro na compilação");
                                e.printStackTrace();
                            }
                        };

declarar:    (type
                  ID {output += $ID.text;
                        x = new Variavel($ID.text, tipo, 0);
                        boolean resultado = ov.adicionaVariavel(x);
                        if(!resultado){
                              System.out.println("A variavel "+x.getNomenclatura()+" ja foi declarada");
                              System.exit(0);
                        }
                     }

                  PV {output += ";\n";}
                  )*;


type:( 'int' {output += "\tint ";
                          tipo = 1;
                         }
       | 'char'{output += "\tchar ";
                          tipo = 2;
                          }
       | 'float'{output += "\tfloat ";
                          tipo = 3;
                          }
       )
       | 'string'{output += "\tString ";
                         tipo = 4;
                         }
      ;

snippet: (command)*;

command: commandatribuicao 
        | commandif 
        | commandprint 
        | commandread 
        | commandwhile 
        | commandfor
        | expr
        ;

commandif: 'if'
      {
      output += "\n\tif (";
      } comparacao
      {
      output += ")";
      }'them' AB
      {
      output += "{\n\t";
      } snippet FB
      {
      output += "\n\t}\n";
      }('else'
      {
      output += "else";
      } AB
      {
      output += "{\n\t";
      } snippet FB
      {
      output += "\n\t}\n";
      })?;

comparacao: (ID {output += $ID.text;}| NUM{output += $NUM.text;}) oprelacional (ID {output += $ID.text;}| NUM{output += $NUM.text;});

commandatribuicao:      ID {
            Variavel var1 = ov.buscaVariavel($ID.text); output += $ID.text;
            }
            Op_atrib {output += " = ";}
            (ID {Variavel var2 = ov.buscaVariavel($ID.text);
                   if(var1.getTipo()!=var2.getTipo()){
                        System.out.println("Atribuição invalida");
                        System.exit(0);
                   }
                output += $ID.text+";";}
            | NUM{output += $NUM.text;}PV{output += ";";}
            | STRING{output += $STRING.text;}PV{output += ";\n";}
            | expr PV{output += ";\n";})
            ;

commandprint: 'print'
      {
      output += "\t\tSystem.out.println(";
      } (ID{
      output+=$ID.text+")";
      }|STRING{
        output+=$STRING.text+")";})
      PV
      {
      output += ";\n";
      };

commandread: 'read'
            ID
            {
            Variavel var = ov.buscaVariavel($ID.text);
            int tipo = var.getTipo();
            if(tipo == 1) {
              output += $ID.text + " = Saida.sc.nextInt()";
            }

            if(tipo == 2) {
              output += $ID.text + " = Saida.sc.next().charAt(1)";
            }

            if(tipo == 3) {
              output += $ID.text + " = Saida.sc.nextFloat()";
            }

            if(tipo == 4) {
                output += $ID.text + " = Saida.sc.nextLine()";
            }
            }PV {output+=";\n";};

commandwhile: 'while' AP
      {
      output += "\twhile (";
      }
      comparacao
      FP AB
      {
      output += ") {\n\t";
      } snippet FB
      {
      output += "\n\t}";
      };

commandfor: 'for' AP
      {
      output += "\tfor (";
      } commandatribuicao 
      {
      output += "";
      } comparacao ';'
      {
      output += ";";
      } ID
      {
      output+=$ID.text;
      } operacao (ID {output += $ID.text;}| NUM{output += $NUM.text;}) FP AB
      {
      output += ") {\n\t";
      } snippet FB
      {
      output += "\n\t}";
      };



operacao: ('+'{output += " + ";}
    | '-'{output += " - ";}
    | '/'{output += " / ";}
    | '*'{output += " * ";}
    | '->'{output += " += ";}
    );

expr: expr '+' {output += " + ";} termo | expr '-' {output += " - ";} termo | termo;

termo: termo '*'{output += " * ";} fator | termo '/'{output += " / ";} fator |fator;

//rt
fator: NUM {output += $NUM.text;} | 
       ID {output += $ID.text;} | 
       ('('{output+= "(";} expr ')'{output+= ")";});


oprelacional: ('>'{output += " > ";}
        | '<'{output += " < ";}
        | '>='{output += " >= ";}
        | '<='{output += " <= ";}
        | '=='{output += " == ";}
        | '!='{output += " != ";});

ID: [A-Za-z]+;

NUM: INT | FLOAT;

INT : [0-9]+ ;

FLOAT
    :   '-'? INT '.' INT EXP?   // 1.35, 1.35E-9, 0.3, -4.5
    |   '-'? INT EXP            // 1e10 -3e4
    |   '-'? INT                // -3, 45
    ;


fragment EXP :   [Ee] [+\-]? INT ;

PV: ';';

AC: '{' ;

FC: '}' ;

AP: '(' ;

FP: ')' ;

AB: '[';

FB: ']';

Op_atrib: '=';

STRING : '"' (~'"'|'\\"')* '"'  ;

WS: [ \t\r\n]+ -> skip;
