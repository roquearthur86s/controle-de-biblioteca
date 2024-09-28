package br.edu.ifpr.foz.ifprstore.models;

public enum BookStatus {
    disponivel(1), emprestado(2), indisponivel(3);

    private final int code;
    
    BookStatus(int code) {
        this.code = code;
    }
    public int getCode() {
        return code;
    }
}
