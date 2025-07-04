package com.example.Models;

public class Departamento {
    private String depacodi;
    private String depadesc;
    private String depagere;

    public Departamento() {
    }

    public Departamento(String depacodi, String depadesc, String depagere) {
        this.depacodi = depacodi;
        this.depadesc = depadesc;
        this.depagere = depagere;
    }

    public String getDepacodi() {
        return depacodi;
    }

    public void setDepacodi(String depacodi) {
        this.depacodi = depacodi;
    }

    public String getDepadesc() {
        return depadesc;
    }

    public void setDepadesc(String depadesc) {
        this.depadesc = depadesc;
    }

    public String getDepagere() {
        return depagere;
    }

    public void setDepagere(String depagere) {
        this.depagere = depagere;
    }

    @Override
    public String toString() {
        return "Departamento{" +
                "depacodi='" + depacodi + '\'' +
                ", depadesc='" + depadesc + '\'' +
                ", depagere='" + depagere + '\'' +
                '}';
    }
}