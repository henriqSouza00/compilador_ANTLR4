# COMPILADORES_ANTLR4
Trabalho em grupo - Teoria de computação e compiladores

# DOWNLOAD E INSTALAÇÃO
Efetuar o download do AntLR-4.7.1
http://www.antlr.org/download.html

Coloque o arquivo antlr-4.7.1-complete.jar na variavel de ambiente CLASSPATH
- O caminho completo do arquivo, com o nome do arquivo, deve estar no CLASSPATH
- Ao final da linha do CLASSPATH, colocar ";."

A pasta bin do jdk deve estar na variavel de ambiente PATH

# ARQUIVOS BATCH

Para executarr um arquivo no AntLR, crie dois arquivos batch para facilitar:
- Um arquivo chamado antlr4.bat.
  > java org.antlr.v4.Tool %*
- Um arquivo chamado grun.bat
  > java org.antlr.v4.gui.TestRig %*
- Coloque os arquivos bat em um diretório diferente ao do AntLR
  > Sugestão: Um subdiretório na raiz do ANtLR com nome bin


# COMPILAÇÃO E EXECUÇÃO
Para compilar, digite no prompt:
antlr4 <nome_arquivo>.g4
A extensão de um arquivo no AntLR4 é .g4

A compilação irá gerar alguns arquivos .Java
Para compilar os arquivos JAva, digite:
 > javac *.java
A compilação dos arquivos Java irá gerar os arquivos com extensão .class

Para executar, digite no prompt
- > grun >nome_arquivo> <símbolo_inicial_gramática> [options] <arquivo_entrada>

- > <nome_arquivo>: nome do arquivo sem a extensão .g4
- > <símbolo_inicial_gramática>: símbolo inicial da gramática em que iniciará a execução
- > [options]: opções para a execução.
- > Exemplos: -tree e -gui
- > <arquivo_entrada>: arquivo que será a entrada para a
execução da sua linguagem
