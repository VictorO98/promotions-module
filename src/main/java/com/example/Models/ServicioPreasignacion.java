package com.example.Models;

public class ServicioPreasignacion {
    private String placa;
    private String suscripcion;
    private String departamento;
    private String municipio;
    private String categoria;
    private String subcategoria;
    private String plan;

    // Campos adicionales para consultas (no se muestran en web)
    private String codDepartamento;
    private String codMunicipio;
    private String codCategoria;
    private String codSubcategoria;
    private String codPlan; // Código del plan (ej: 7575)

    // Constructor vacío
    public ServicioPreasignacion() {
    }

    // Constructor completo
    public ServicioPreasignacion(String placa, String suscripcion, String departamento,
            String municipio, String categoria, String subcategoria, String plan,
            String codDepartamento, String codMunicipio, String codCategoria, String codSubcategoria) {
        this.placa = placa;
        this.suscripcion = suscripcion;
        this.departamento = departamento;
        this.municipio = municipio;
        this.categoria = categoria;
        this.subcategoria = subcategoria;
        this.plan = plan;
        this.codDepartamento = codDepartamento;
        this.codMunicipio = codMunicipio;
        this.codCategoria = codCategoria;
        this.codSubcategoria = codSubcategoria;
    }

    // Getters y Setters
    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getSuscripcion() {
        return suscripcion;
    }

    public void setSuscripcion(String suscripcion) {
        this.suscripcion = suscripcion;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getSubcategoria() {
        return subcategoria;
    }

    public void setSubcategoria(String subcategoria) {
        this.subcategoria = subcategoria;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getCodDepartamento() {
        return codDepartamento;
    }

    public void setCodDepartamento(String codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public String getCodMunicipio() {
        return codMunicipio;
    }

    public void setCodMunicipio(String codMunicipio) {
        this.codMunicipio = codMunicipio;
    }

    public String getCodCategoria() {
        return codCategoria;
    }

    public void setCodCategoria(String codCategoria) {
        this.codCategoria = codCategoria;
    }

    public String getCodSubcategoria() {
        return codSubcategoria;
    }

    public void setCodSubcategoria(String codSubcategoria) {
        this.codSubcategoria = codSubcategoria;
    }

    public String getCodPlan() {
        return codPlan;
    }

    public void setCodPlan(String codPlan) {
        this.codPlan = codPlan;
    }

    @Override
    public String toString() {
        return "ServicioPreasignacion{" +
                "placa='" + placa + '\'' +
                ", suscripcion='" + suscripcion + '\'' +
                ", departamento='" + departamento + '\'' +
                ", municipio='" + municipio + '\'' +
                ", categoria='" + categoria + '\'' +
                ", subcategoria='" + subcategoria + '\'' +
                ", plan='" + plan + '\'' +
                '}';
    }
}