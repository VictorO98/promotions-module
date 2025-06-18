package com.example.Models;

public class TipoServicio {
    private Integer tiposervcodi; // TIPOSERVCODI - PRIMARY KEY
    private String paradesc; // PARADESC - Descripción del servicio

    public TipoServicio() {
    }

    public TipoServicio(Integer tiposervcodi, String paradesc) {
        this.tiposervcodi = tiposervcodi;
        this.paradesc = paradesc;
    }

    // Getters and Setters
    public Integer getTiposervcodi() {
        return tiposervcodi;
    }

    public void setTiposervcodi(Integer tiposervcodi) {
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
        return "TipoServicio{" +
                "tiposervcodi=" + tiposervcodi +
                ", paradesc='" + paradesc + '\'' +
                '}';
    }
}