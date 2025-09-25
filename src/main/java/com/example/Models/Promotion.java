package com.example.Models;

import java.util.Date;

public class Promotion {
    private Integer ticododi; // NUMBER(3)
    private Integer cococodi; // NUMBER(5)
    private Integer sucacodi; // NUMBER(2)
    private Integer conccodi; // NUMBER(4)
    private Integer tiposercodi; // NUMBER(3)
    private Integer pasecodi; // NUMBER(4)
    private String ticodex; // VARCHAR2(20)
    private String ticodesc; // VARCHAR2(200)
    private Integer ticodpto; // NUMBER(4)
    private String depadesc; // VARCHAR2(30)
    private Integer locacodi; // NUMBER(6)
    private String locandmb; // VARCHAR2(40)
    private Integer catecodi; // NUMBER(2)
    private String catedesc; // VARCHAR2(30)
    private Integer sucacate; // NUMBER(2)
    private String sucadesc; // VARCHAR2(30)
    private Integer plsucodi; // NUMBER(4)
    private String plsudesc; // VARCHAR2(30)
    private Date ticofech; // DATE
    private String ticouser; // VARCHAR2(20)
    private String ticoactive; // VARCHAR2(1)
    private Double cocoporc; // NUMBER(10,5) - Porcentaje de descuento con decimales
    private Integer cocoval; // NUMBER(10)
    private String ticoperiodicidad; // VARCHAR2(1)
    private Integer cocotiap; // NUMBER
    private Date cocofein; // DATE
    private Date cocofefi; // DATE
    private String cocodlco; // VARCHAR2(1)
    private String cocoacti; // VARCHAR2(1)
    private String concdesc; // VARCHAR2(30)
    private String paradesc; // VARCHAR2(30)
    private Integer tisscodi; // NUMBER(3)
    private String pasedesc; // VARCHAR2(60)

    // Getters and Setters
    public Integer getTicododi() {
        return ticododi;
    }

    public void setTicododi(Integer ticododi) {
        this.ticododi = ticododi;
    }

    public Integer getCococodi() {
        return cococodi;
    }

    public void setCococodi(Integer cococodi) {
        this.cococodi = cococodi;
    }

    public Integer getSucacodi() {
        return sucacodi;
    }

    public void setSucacodi(Integer sucacodi) {
        this.sucacodi = sucacodi;
    }

    public Integer getConccodi() {
        return conccodi;
    }

    public void setConccodi(Integer conccodi) {
        this.conccodi = conccodi;
    }

    public Integer getTiposercodi() {
        return tiposercodi;
    }

    public void setTiposercodi(Integer tiposercodi) {
        this.tiposercodi = tiposercodi;
    }

    public Integer getPasecodi() {
        return pasecodi;
    }

    public void setPasecodi(Integer pasecodi) {
        this.pasecodi = pasecodi;
    }

    public String getTicodex() {
        return ticodex;
    }

    public void setTicodex(String ticodex) {
        this.ticodex = ticodex;
    }

    public String getTicodesc() {
        return ticodesc;
    }

    public void setTicodesc(String ticodesc) {
        this.ticodesc = ticodesc;
    }

    public Integer getTicodpto() {
        return ticodpto;
    }

    public void setTicodpto(Integer ticodpto) {
        this.ticodpto = ticodpto;
    }

    public String getDepadesc() {
        return depadesc;
    }

    public void setDepadesc(String depadesc) {
        this.depadesc = depadesc;
    }

    public Integer getLocacodi() {
        return locacodi;
    }

    public void setLocacodi(Integer locacodi) {
        this.locacodi = locacodi;
    }

    public String getLocandmb() {
        return locandmb;
    }

    public void setLocandmb(String locandmb) {
        this.locandmb = locandmb;
    }

    public Integer getCatecodi() {
        return catecodi;
    }

    public void setCatecodi(Integer catecodi) {
        this.catecodi = catecodi;
    }

    public String getCatedesc() {
        return catedesc;
    }

    public void setCatedesc(String catedesc) {
        this.catedesc = catedesc;
    }

    public Integer getSucacate() {
        return sucacate;
    }

    public void setSucacate(Integer sucacate) {
        this.sucacate = sucacate;
    }

    public String getSucadesc() {
        return sucadesc;
    }

    public void setSucadesc(String sucadesc) {
        this.sucadesc = sucadesc;
    }

    public Integer getPlsucodi() {
        return plsucodi;
    }

    public void setPlsucodi(Integer plsucodi) {
        this.plsucodi = plsucodi;
    }

    public String getPlsudesc() {
        return plsudesc;
    }

    public void setPlsudesc(String plsudesc) {
        this.plsudesc = plsudesc;
    }

    public Date getTicofech() {
        return ticofech;
    }

    public void setTicofech(Date ticofech) {
        this.ticofech = ticofech;
    }

    public String getTicouser() {
        return ticouser;
    }

    public void setTicouser(String ticouser) {
        this.ticouser = ticouser;
    }

    public String getTicoactive() {
        return ticoactive;
    }

    public void setTicoactive(String ticoactive) {
        this.ticoactive = ticoactive;
    }

    public Double getCocoporc() {
        return cocoporc;
    }

    public void setCocoporc(Double cocoporc) {
        this.cocoporc = cocoporc;
    }

    public Integer getCocoval() {
        return cocoval;
    }

    public void setCocoval(Integer cocoval) {
        this.cocoval = cocoval;
    }

    public String getTicoperiodicidad() {
        return ticoperiodicidad;
    }

    public void setTicoperiodicidad(String ticoperiodicidad) {
        this.ticoperiodicidad = ticoperiodicidad;
    }

    public Integer getCocotiap() {
        return cocotiap;
    }

    public void setCocotiap(Integer cocotiap) {
        this.cocotiap = cocotiap;
    }

    public Date getCocofein() {
        return cocofein;
    }

    public void setCocofein(Date cocofein) {
        this.cocofein = cocofein;
    }

    public Date getCocofefi() {
        return cocofefi;
    }

    public void setCocofefi(Date cocofefi) {
        this.cocofefi = cocofefi;
    }

    public String getCocodlco() {
        return cocodlco;
    }

    public void setCocodlco(String cocodlco) {
        this.cocodlco = cocodlco;
    }

    public String getCocoacti() {
        return cocoacti;
    }

    public void setCocoacti(String cocoacti) {
        this.cocoacti = cocoacti;
    }

    public String getConcdesc() {
        return concdesc;
    }

    public void setConcdesc(String concdesc) {
        this.concdesc = concdesc;
    }

    public String getParadesc() {
        return paradesc;
    }

    public void setParadesc(String paradesc) {
        this.paradesc = paradesc;
    }

    public Integer getTisscodi() {
        return tisscodi;
    }

    public void setTisscodi(Integer tisscodi) {
        this.tisscodi = tisscodi;
    }

    public String getPasedesc() {
        return pasedesc;
    }

    public void setPasedesc(String pasedesc) {
        this.pasedesc = pasedesc;
    }
}