package com.example.Models;

public class PromocionActiva {
    private Long placa; // NUMBER(10,10)
    private Integer codPromo; // NUMBER(3)
    private String promocion; // VARCHAR2(200)
    private Integer codDepartamento; // NUMBER(4)
    private String departamento; // VARCHAR2(30)
    private Integer codMunicipio; // NUMBER(6,6)
    private String municipio; // VARCHAR2(40)

    // Constructors
    public PromocionActiva() {
    }

    public PromocionActiva(Long placa, Integer codPromo, String promocion, Integer codDepartamento,
            String departamento, Integer codMunicipio, String municipio) {
        this.placa = placa;
        this.codPromo = codPromo;
        this.promocion = promocion;
        this.codDepartamento = codDepartamento;
        this.departamento = departamento;
        this.codMunicipio = codMunicipio;
        this.municipio = municipio;
    }

    // Getters and Setters
    public Long getPlaca() {
        return placa;
    }

    public void setPlaca(Long placa) {
        this.placa = placa;
    }

    public Integer getCodPromo() {
        return codPromo;
    }

    public void setCodPromo(Integer codPromo) {
        this.codPromo = codPromo;
    }

    public String getPromocion() {
        return promocion;
    }

    public void setPromocion(String promocion) {
        this.promocion = promocion;
    }

    public Integer getCodDepartamento() {
        return codDepartamento;
    }

    public void setCodDepartamento(Integer codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public Integer getCodMunicipio() {
        return codMunicipio;
    }

    public void setCodMunicipio(Integer codMunicipio) {
        this.codMunicipio = codMunicipio;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    @Override
    public String toString() {
        return "PromocionActiva{" +
                "placa=" + placa +
                ", codPromo=" + codPromo +
                ", promocion='" + promocion + '\'' +
                ", codDepartamento=" + codDepartamento +
                ", departamento='" + departamento + '\'' +
                ", codMunicipio=" + codMunicipio +
                ", municipio='" + municipio + '\'' +
                '}';
    }
}