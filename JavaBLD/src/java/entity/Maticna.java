package entity;
// Generated Oct 15, 2020 12:00:49 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Maticna generated by hbm2java
 */
public class Maticna  implements java.io.Serializable {


     private Integer maticnaId;
     private String naziv;
     private String socket;
     private String velicina;
     private int maxRam;
     private int memSlots;
     private String imgPath;
     private Set<Konfiguracije> konfiguracijes = new HashSet<Konfiguracije>(0);

    public Maticna() {
    }

	
    public Maticna(Integer maticnaId,String naziv, String socket, String velicina, int maxRam, int memSlots, String imgPath) {
        this.naziv = naziv;
        this.socket = socket;
        this.velicina = velicina;
        this.maxRam = maxRam;
        this.memSlots = memSlots;
        this.imgPath = imgPath;
        this.maticnaId = maticnaId;
    }
    public Maticna(String naziv, String socket, String velicina, int maxRam, int memSlots, String imgPath, Set<Konfiguracije> konfiguracijes) {
       this.naziv = naziv;
       this.socket = socket;
       this.velicina = velicina;
       this.maxRam = maxRam;
       this.memSlots = memSlots;
       this.imgPath = imgPath;
       this.konfiguracijes = konfiguracijes;
    }
   
    public Integer getMaticnaId() {
        return this.maticnaId;
    }
    
    public void setMaticnaId(Integer maticnaId) {
        this.maticnaId = maticnaId;
    }
    public String getNaziv() {
        return this.naziv;
    }
    
    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
    public String getSocket() {
        return this.socket;
    }
    
    public void setSocket(String socket) {
        this.socket = socket;
    }
    public String getVelicina() {
        return this.velicina;
    }
    
    public void setVelicina(String velicina) {
        this.velicina = velicina;
    }
    public int getMaxRam() {
        return this.maxRam;
    }
    
    public void setMaxRam(int maxRam) {
        this.maxRam = maxRam;
    }
    public int getMemSlots() {
        return this.memSlots;
    }
    
    public void setMemSlots(int memSlots) {
        this.memSlots = memSlots;
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


