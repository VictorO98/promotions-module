package com.example.Models;

public class Subcategoria {
    private String sucacodi; // Código de subcategoría
    private String sucadesc; // Descripción de subcategoría
    private String sucacate; // Código de categoría padre

    // Constructor vacío
    public Subcategoria() {
    }

    // Constructor con parámetros
    public Subcategoria(String sucacodi, String sucadesc, String sucacate) {
        this.sucacodi = sucacodi;
        this.sucadesc = sucadesc;
        this.sucacate = sucacate;
    }

    // Getters y Setters
    public String getSucacodi() {
        return sucacodi;
    }

    public void setSucacodi(String sucacodi) {
        this.sucacodi = sucacodi;
    }

    public String getSucadesc() {
        return sucadesc;
    }

    public void setSucadesc(String sucadesc) {
        this.sucadesc = sucadesc;
    }

    public String getSucacate() {
        return sucacate;
    }

    public void setSucacate(String sucacate) {
        this.sucacate = sucacate;
    }

    @Override
    public String toString() {
        return "Subcategoria{" +
                "sucacodi='" + sucacodi + '\'' +
                ", sucadesc='" + sucadesc + '\'' +
                ", sucacate='" + sucacate + '\'' +
                '}';
    }
}