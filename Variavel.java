
public class Variavel {
    private String nomenclatura;
    private int tipo;
    private int contexto;

    public Variavel(String nomeclatura, int tipo, int contexto) {
        this.contexto = contexto; // Contexto = Escopo da variável
        this.tipo = tipo;
        this.nomenclatura = nomeclatura;
    }

    public Variavel() {
    }

    public String getNomenclatura() {
        return nomenclatura;
    }

    public void setNomenclatura(String nomenclatura) {
        this.nomenclatura = nomenclatura;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getContexto() {
        return contexto;
    }

    public void setContexto(int contexto) {
        this.contexto = contexto;
    }

    public void print(){
        System.out.println("Nomenclatura: "+ nomenclatura +
                           "\nTipo: "+tipo+
                           "\ncontexto: "+contexto);
    }
}
