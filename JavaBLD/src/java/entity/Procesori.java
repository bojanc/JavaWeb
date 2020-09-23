package entity;
// Generated Sep 23, 2020 12:34:30 PM by Hibernate Tools 4.3.1



/**
 * Procesori generated by hbm2java
 */
public class Procesori  implements java.io.Serializable {


     private Integer procesorId;
     private int brojJezgara;
     private String frekvencija;
     private String boost;
     private String tdp;
     private String igpu;
     private String naziv;
     private String imgPath;

    public Procesori() {
    }

    public Procesori(Integer procesorId,int brojJezgara, String frekvencija, String boost, String tdp, String igpu, String naziv, String imgPath) {
       this.procesorId = procesorId;
       this.brojJezgara = brojJezgara;
       this.frekvencija = frekvencija;
       this.boost = boost;
       this.tdp = tdp;
       this.igpu = igpu;
       this.naziv = naziv;
       this.imgPath = imgPath;
    }
   
    public Integer getProcesorId() {
        return this.procesorId;
    }
    
    public void setProcesorId(Integer procesorId) {
        this.procesorId = procesorId;
    }
    public int getBrojJezgara() {
        return this.brojJezgara;
    }
    
    public void setBrojJezgara(int brojJezgara) {
        this.brojJezgara = brojJezgara;
    }
    public String getFrekvencija() {
        return this.frekvencija;
    }
    
    public void setFrekvencija(String frekvencija) {
        this.frekvencija = frekvencija;
    }
    public String getBoost() {
        return this.boost;
    }
    
    public void setBoost(String boost) {
        this.boost = boost;
    }
    public String getTdp() {
        return this.tdp;
    }
    
    public void setTdp(String tdp) {
        this.tdp = tdp;
    }
    public String getIgpu() {
        return this.igpu;
    }
    
    public void setIgpu(String igpu) {
        this.igpu = igpu;
    }
    public String getNaziv() {
        return this.naziv;
    }
    
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }




}


