package entity;
// Generated Oct 22, 2020 6:02:38 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Korisnici generated by hbm2java
 */
public class Korisnici  implements java.io.Serializable {


     private Integer korisnikId;
     private String imgPath;
     private String ime;
     private String prezime;
     private String username;
     private String password;
     private String uloga;
     private Set<Komentari> komentaris = new HashSet<Komentari>(0);
     private Set<Konfiguracije> konfiguracijes = new HashSet<Konfiguracije>(0);
     private Set<Porukekorisnika> porukekorisnikas = new HashSet<Porukekorisnika>(0);
     private Set<Podkomentari> podkomentaris = new HashSet<Podkomentari>(0);

    public Korisnici() {
    }

	
    public Korisnici(Integer korisnikId,String imgPath, String ime, String prezime, String username, String password, String uloga) {
        this.imgPath = imgPath;
        this.ime = ime;
        this.prezime = prezime;
        this.username = username;
        this.password = password;
        this.uloga = uloga;
        this.korisnikId = korisnikId;
    }
    public Korisnici(String imgPath, String ime, String prezime, String username, String password, String uloga, Set<Komentari> komentaris, Set<Konfiguracije> konfiguracijes, Set<Porukekorisnika> porukekorisnikas, Set<Podkomentari> podkomentaris) {
       this.imgPath = imgPath;
       this.ime = ime;
       this.prezime = prezime;
       this.username = username;
       this.password = password;
       this.uloga = uloga;
       this.komentaris = komentaris;
       this.konfiguracijes = konfiguracijes;
       this.porukekorisnikas = porukekorisnikas;
       this.podkomentaris = podkomentaris;
    }
   
    public Integer getKorisnikId() {
        return this.korisnikId;
    }
    
    public void setKorisnikId(Integer korisnikId) {
        this.korisnikId = korisnikId;
    }
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    public String getIme() {
        return this.ime;
    }
    
    public void setIme(String ime) {
        this.ime = ime;
    }
    public String getPrezime() {
        return this.prezime;
    }
    
    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUloga() {
        return this.uloga;
    }
    
    public void setUloga(String uloga) {
        this.uloga = uloga;
    }
    public Set<Komentari> getKomentaris() {
        return this.komentaris;
    }
    
    public void setKomentaris(Set<Komentari> komentaris) {
        this.komentaris = komentaris;
    }
    public Set<Konfiguracije> getKonfiguracijes() {
        return this.konfiguracijes;
    }
    
    public void setKonfiguracijes(Set<Konfiguracije> konfiguracijes) {
        this.konfiguracijes = konfiguracijes;
    }
    public Set<Porukekorisnika> getPorukekorisnikas() {
        return this.porukekorisnikas;
    }
    
    public void setPorukekorisnikas(Set<Porukekorisnika> porukekorisnikas) {
        this.porukekorisnikas = porukekorisnikas;
    }
    public Set<Podkomentari> getPodkomentaris() {
        return this.podkomentaris;
    }
    
    public void setPodkomentaris(Set<Podkomentari> podkomentaris) {
        this.podkomentaris = podkomentaris;
    }




}


