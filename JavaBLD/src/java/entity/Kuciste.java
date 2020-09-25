package entity;
// Generated Sep 25, 2020 8:49:52 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Kuciste generated by hbm2java
 */
public class Kuciste  implements java.io.Serializable {


     private Integer kucisteId;
     private String naziv;
     private String dimenzije;
     private String imgPath;
     private Set<Konfiguracije> konfiguracijes = new HashSet<Konfiguracije>(0);

    public Kuciste() {
    }

	
    public Kuciste(Integer kucisteId,String naziv, String dimenzije, String imgPath) {
        this.naziv = naziv;
        this.dimenzije = dimenzije;
        this.imgPath = imgPath;
        this.kucisteId = kucisteId;
    }
    public Kuciste(String naziv, String dimenzije, String imgPath, Set<Konfiguracije> konfiguracijes) {
       this.naziv = naziv;
       this.dimenzije = dimenzije;
       this.imgPath = imgPath;
       this.konfiguracijes = konfiguracijes;
    }
   
    public Integer getKucisteId() {
        return this.kucisteId;
    }
    
    public void setKucisteId(Integer kucisteId) {
        this.kucisteId = kucisteId;
    }
    public String getNaziv() {
        return this.naziv;
    }
    
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public String getDimenzije() {
        return this.dimenzije;
    }
    
    public void setDimenzije(String dimenzije) {
        this.dimenzije = dimenzije;
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


