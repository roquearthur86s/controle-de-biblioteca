package br.edu.ifpr.foz.ifprstore.models;

public enum BookStatus {
    disponivel(1), emprestado(2), indisponivel(3);

    private final int codigo;
    
    BookStatus(int codigo) {
        this.codigo = codigo;
    }
    public int getCodigo() {
        return codigo;
    }
}
