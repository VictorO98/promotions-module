package com.example.Models;

public class Localidad {
    private String locadepa;
    private String locacodi;
    private String locanomb;
    private String locacmv;
    private String locaorde;
    private String locacdx;
    private String locanci;
    private String locaead;
    private String locanqab;
    private String locafeis;

    public Localidad() {
    }

    public Localidad(String locadepa, String locacodi, String locanomb) {
        this.locadepa = locadepa;
        this.locacodi = locacodi;
        this.locanomb = locanomb;
    }

    public String getLocadepa() {
        return locadepa;
    }

    public void setLocadepa(String locadepa) {
        this.locadepa = locadepa;
    }

    public String getLocacodi() {
        return locacodi;
    }

    public void setLocacodi(String locacodi) {
        this.locacodi = locacodi;
    }

    public String getLocanomb() {
        return locanomb;
    }

    public void setLocanomb(String locanomb) {
        this.locanomb = locanomb;
    }

    public String getLocacmv() {
        return locacmv;
    }

    public void setLocacmv(String locacmv) {
        this.locacmv = locacmv;
    }

    public String getLocaorde() {
        return locaorde;
    }

    public void setLocaorde(String locaorde) {
        this.locaorde = locaorde;
    }

    public String getLocacdx() {
        return locacdx;
    }

    public void setLocacdx(String locacdx) {
        this.locacdx = locacdx;
    }

    public String getLocanci() {
        return locanci;
    }

    public void setLocanci(String locanci) {
        this.locanci = locanci;
    }

    public String getLocaead() {
        return locaead;
    }

    public void setLocaead(String locaead) {
        this.locaead = locaead;
    }

    public String getLocanqab() {
        return locanqab;
    }

    public void setLocanqab(String locanqab) {
        this.locanqab = locanqab;
    }

    public String getLocafeis() {
        return locafeis;
    }

    public void setLocafeis(String locafeis) {
        this.locafeis = locafeis;
    }

    @Override
    public String toString() {
        return "Localidad{" +
                "locadepa='" + locadepa + '\'' +
                ", locacodi='" + locacodi + '\'' +
                ", locanomb='" + locanomb + '\'' +
                ", locacmv='" + locacmv + '\'' +
                ", locaorde='" + locaorde + '\'' +
                ", locacdx='" + locacdx + '\'' +
                ", locanci='" + locanci + '\'' +
                ", locaead='" + locaead + '\'' +
                ", locanqab='" + locanqab + '\'' +
                ", locafeis='" + locafeis + '\'' +
                '}';
    }
}