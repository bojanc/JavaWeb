package entity;
// Generated Oct 16, 2020 5:10:00 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Memorija generated by hbm2java
 */
public class Memorija  implements java.io.Serializable {


     private Integer memorijaId;
     private String naziv;
     private String kapacitet;
     private String tip;
     private String cache;
     private String dimenzije;
     private String interfejs;
     private int tdp;
     private String imgPath;
     private Set<Konfiguracije> konfiguracijes = new HashSet<Konfiguracije>(0);

    public Memorija() {
    }

	
    public Memorija(Integer memorijaId,String naziv, String kapacitet, String tip, String cache, String dimenzije, String interfejs, int tdp, String imgPath) {
        this.naziv = naziv;
        this.kapacitet = kapacitet;
        this.tip = tip;
        this.cache = cache;
        this.dimenzije = dimenzije;
        this.interfejs = interfejs;
        this.tdp = tdp;
        this.imgPath = imgPath;
        this.memorijaId = memorijaId;
    }
    public Memorija(String naziv, String kapacitet, String tip, String cache, String dimenzije, String interfejs, int tdp, String imgPath, Set<Konfiguracije> konfiguracijes) {
       this.naziv = naziv;
       this.kapacitet = kapacitet;
       this.tip = tip;
       this.cache = cache;
       this.dimenzije = dimenzije;
       this.interfejs = interfejs;
       this.tdp = tdp;
       this.imgPath = imgPath;
       this.konfiguracijes = konfiguracijes;
    }
   
    public Integer getMemorijaId() {
        return this.memorijaId;
    }
    
    public void setMemorijaId(Integer memorijaId) {
        this.memorijaId = memorijaId;
    }
    public String getNaziv() {
        return this.naziv;
    }
    
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public String getKapacitet() {
        return this.kapacitet;
    }
    
    public void setKapacitet(String kapacitet) {
        this.kapacitet = kapacitet;
    }
    public String getTip() {
        return this.tip;
    }
    
    public void setTip(String tip) {
        this.tip = tip;
    }
    public String getCache() {
        return this.cache;
    }
    
    public void setCache(String cache) {
        this.cache = cache;
    }
    public String getDimenzije() {
        return this.dimenzije;
    }
    
    public void setDimenzije(String dimenzije) {
        this.dimenzije = dimenzije;
    }
    public String getInterfejs() {
        return this.interfejs;
    }
    
    public void setInterfejs(String interfejs) {
        this.interfejs = interfejs;
    }
    public int getTdp() {
        return this.tdp;
    }
    
    public void setTdp(int tdp) {
        this.tdp = tdp;
    }
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    public Set<Konfiguracije> getKonfiguracijes() {
        return this.konfiguracijes;
    }
    
    public void setKonfiguracijes(Set<Konfiguracije> konfiguracijes) {
        this.konfiguracijes = konfiguracijes;
    }




}


