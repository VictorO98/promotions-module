package com.example.Models;

public class Categoria {
    private String catecodi;
    private String catedesc;
    private String cateevlco;

    public Categoria() {
    }

    public Categoria(String catecodi, String catedesc, String cateevlco) {
        this.catecodi = catecodi;
        this.catedesc = catedesc;
        this.cateevlco = cateevlco;
    }

    public String getCatecodi() {
        return catecodi;
    }

    public void setCatecodi(String catecodi) {
        this.catecodi = catecodi;
    }

    public String getCatedesc() {
        return catedesc;
    }

    public void setCatedesc(String catedesc) {
        this.catedesc = catedesc;
    }

    public String getCateevlco() {
        return cateevlco;
    }

    public void setCateevlco(String cateevlco) {
        this.cateevlco = cateevlco;
    }

    @Override
    public String toString() {
        return "Categoria{" +
                "catecodi='" + catecodi + '\'' +
                ", catedesc='" + catedesc + '\'' +
                ", cateevlco='" + cateevlco + '\'' +
                '}';
    }
}