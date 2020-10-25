package entity;
// Generated Oct 25, 2020 3:28:51 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Ram generated by hbm2java
 */
public class Ram  implements java.io.Serializable {


     private Integer ramId;
     private String naziv;
     private String brzina;
     private int casLat;
     private int tdp;
     private String imgPath;
     private Set<Konfiguracije> konfiguracijes = new HashSet<Konfiguracije>(0);
     private Set<Igrice> igrices = new HashSet<Igrice>(0);

    public Ram() {
    }

	
    public Ram(Integer ramId,String naziv, String brzina, int casLat, int tdp, String imgPath) {
        this.naziv = naziv;
        this.brzina = brzina;
        this.casLat = casLat;
        this.tdp = tdp;
        this.imgPath = imgPath;
        this.ramId = ramId;
    }
    public Ram(String naziv, String brzina, int casLat, int tdp, String imgPath, Set<Konfiguracije> konfiguracijes, Set<Igrice> igrices) {
       this.naziv = naziv;
       this.brzina = brzina;
       this.casLat = casLat;
       this.tdp = tdp;
       this.imgPath = imgPath;
       this.konfiguracijes = konfiguracijes;
       this.igrices = igrices;
    }
   
    public Integer getRamId() {
        return this.ramId;
    }
    
    public void setRamId(Integer ramId) {
        this.ramId = ramId;
    }
    public String getNaziv() {
        return this.naziv;
    }
    
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public String getBrzina() {
        return this.brzina;
    }
    
    public void setBrzina(String brzina) {
        this.brzina = brzina;
    }
    public int getCasLat() {
        return this.casLat;
    }
    
    public void setCasLat(int casLat) {
        this.casLat = casLat;
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
    public Set<Igrice> getIgrices() {
        return this.igrices;
    }
    
    public void setIgrices(Set<Igrice> igrices) {
        this.igrices = igrices;
    }




}


