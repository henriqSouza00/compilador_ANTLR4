import java.util.ArrayList;

public class operacaoVariavel {
    private ArrayList<Variavel> listaVariaveis;

    public operacaoVariavel() {
        listaVariaveis = new ArrayList<Variavel>();
    }

    public boolean adicionaVariavel(Variavel var) {
        for (int i = 0; i < listaVariaveis.size(); i++) {
            if (listaVariaveis.get(i).getNomenclatura().equals(var.getNomenclatura())
                && listaVariaveis.get(i).getContexto() == var.getContexto()) 
            {
                return false;
            }
        }
        listaVariaveis.add(var);
        return true;
    }

    public Variavel buscaVariavel(String nomenclatura) {
        for (int i = listaVariaveis.size() - 1; i >= 0; i--) {
            if (listaVariaveis.get(i).
                    getNomenclatura().
                equals(nomenclatura)
                ) 
            {

                return listaVariaveis.get(i);
            }
        }
        return null;
    }

    public boolean verificaExistencia(String nome) {
        for (int i = listaVariaveis.size() - 1; i >= 0; i--) {
            if (listaVariaveis.get(i).getNomenclatura().equals(nome)) {
                return true;
            }
        }
        return false;
    }

    public void imprime() {
        for (int i = 0; i < listaVariaveis.size(); i++) {
            listaVariaveis.get(i).print();
            System.out.println("\n\n");
        }
    }
}
