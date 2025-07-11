package com.example.Models;

public class PlanSuscripcion {
    private String plsucodi; // Código del plan
    private String plsudesc; // Descripción del plan

    // Constructor vacío
    public PlanSuscripcion() {
    }

    // Constructor con parámetros
    public PlanSuscripcion(String plsucodi, String plsudesc) {
        this.plsucodi = plsucodi;
        this.plsudesc = plsudesc;
    }

    // Getters y Setters
    public String getPlsucodi() {
        return plsucodi;
    }

    public void setPlsucodi(String plsucodi) {
        this.plsucodi = plsucodi;
    }

    public String getPlsudesc() {
        return plsudesc;
    }

    public void setPlsudesc(String plsudesc) {
        this.plsudesc = plsudesc;
    }

    @Override
    public String toString() {
        return "PlanSuscripcion{" +
                "plsucodi='" + plsucodi + '\'' +
                ", plsudesc='" + plsudesc + '\'' +
                '}';
    }
}