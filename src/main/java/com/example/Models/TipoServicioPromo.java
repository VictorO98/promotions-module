package com.example.Models;

public class TipoServicioPromo {
    private String tiposervcodi; // Código del tipo de servicio
    private String paradesc; // Descripción del tipo de servicio

    // Constructor vacío
    public TipoServicioPromo() {
    }

    // Constructor con parámetros
    public TipoServicioPromo(String tiposervcodi, String paradesc) {
        this.tiposervcodi = tiposervcodi;
        this.paradesc = paradesc;
    }

    // Getters y Setters
    public String getTiposervcodi() {
        return tiposervcodi;
    }

    public void setTiposervcodi(String tiposervcodi) {
        this.tiposervcodi = tiposervcodi;
    }

    public String getParadesc() {
        return paradesc;
    }

    public void setParadesc(String paradesc) {
        this.paradesc = paradesc;
    }

    @Override
    public String toString() {
        return "TipoServicioPromo{" +
                "tiposervcodi='" + tiposervcodi + '\'' +
                ", paradesc='" + paradesc + '\'' +
                '}';
    }
}