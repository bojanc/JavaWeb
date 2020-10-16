package entity;
// Generated Oct 15, 2020 12:00:49 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Kuleri generated by hbm2java
 */
public class Kuleri  implements java.io.Serializable {


     private Integer kulerId;
     private String naziv;
     private int rpm;
     private String buka;
     private String radijatorDim;
     private String imgPath;
     private Set<Konfiguracije> konfiguracijes = new HashSet<Konfiguracije>(0);

    public Kuleri() {
    }

	
    public Kuleri(Integer kulerId,String naziv, int rpm, String buka,String radijatorDim, String imgPath) {
        this.naziv = naziv;
        this.rpm = rpm;
        this.buka = buka;
        this.imgPath = imgPath;
        this.radijatorDim = radijatorDim;
        this.kulerId = kulerId;
    }
    public Kuleri(String naziv, int rpm, String buka, String radijatorDim, String imgPath, Set<Konfiguracije> konfiguracijes) {
       this.naziv = naziv;
       this.rpm = rpm;
       this.buka = buka;
       this.radijatorDim = radijatorDim;
       this.imgPath = imgPath;
       this.konfiguracijes = konfiguracijes;
    }
   
    public Integer getKulerId() {
        return this.kulerId;
    }
    
    public void setKulerId(Integer kulerId) {
        this.kulerId = kulerId;
    }
    public String getNaziv() {
        return this.naziv;
    }
    
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public int getRpm() {
        return this.rpm;
    }
    
    public void setRpm(int rpm) {
        this.rpm = rpm;
    }
    public String getBuka() {
        return this.buka;
    }
    
    public void setBuka(String buka) {
        this.buka = buka;
    }
    public String getRadijatorDim() {
        return this.radijatorDim;
    }
    
    public void setRadijatorDim(String radijatorDim) {
        this.radijatorDim = radijatorDim;
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


