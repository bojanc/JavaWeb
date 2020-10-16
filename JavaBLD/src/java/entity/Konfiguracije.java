package entity;
// Generated Oct 15, 2020 12:00:49 PM by Hibernate Tools 4.3.1



/**
 * Konfiguracije generated by hbm2java
 */
public class Konfiguracije  implements java.io.Serializable {


     private Integer konfiguracijaId;
     private Gpu gpu;
     private Korisnici korisnici;
     private Kuciste kuciste;
     private Kuleri kuleri;
     private Maticna maticna;
     private Memorija memorija;
     private Procesori procesori;
     private Psu psu;
     private Ram ram;
     private String opis;
     private String imgPath;

    public Konfiguracije() {
    }

    public Konfiguracije(Integer konfiguracijaId,Gpu gpu, Korisnici korisnici, Kuciste kuciste, Kuleri kuleri, Maticna maticna, Memorija memorija, Procesori procesori, Psu psu, Ram ram, String opis, String imgPath) {
       this.gpu = gpu;
       this.korisnici = korisnici;
       this.kuciste = kuciste;
       this.kuleri = kuleri;
       this.maticna = maticna;
       this.memorija = memorija;
       this.procesori = procesori;
       this.psu = psu;
       this.ram = ram;
       this.opis = opis;
       this.imgPath = imgPath;
       this.konfiguracijaId = konfiguracijaId;
    }
   
    public Integer getKonfiguracijaId() {
        return this.konfiguracijaId;
    }
    
    public void setKonfiguracijaId(Integer konfiguracijaId) {
        this.konfiguracijaId = konfiguracijaId;
    }
    public Gpu getGpu() {
        return this.gpu;
    }
    
    public void setGpu(Gpu gpu) {
        this.gpu = gpu;
    }
    public Korisnici getKorisnici() {
        return this.korisnici;
    }
    
    public void setKorisnici(Korisnici korisnici) {
        this.korisnici = korisnici;
    }
    public Kuciste getKuciste() {
        return this.kuciste;
    }
    
    public void setKuciste(Kuciste kuciste) {
        this.kuciste = kuciste;
    }
    public Kuleri getKuleri() {
        return this.kuleri;
    }
    
    public void setKuleri(Kuleri kuleri) {
        this.kuleri = kuleri;
    }
    public Maticna getMaticna() {
        return this.maticna;
    }
    
    public void setMaticna(Maticna maticna) {
        this.maticna = maticna;
    }
    public Memorija getMemorija() {
        return this.memorija;
    }
    
    public void setMemorija(Memorija memorija) {
        this.memorija = memorija;
    }
    public Procesori getProcesori() {
        return this.procesori;
    }
    
    public void setProcesori(Procesori procesori) {
        this.procesori = procesori;
    }
    public Psu getPsu() {
        return this.psu;
    }
    
    public void setPsu(Psu psu) {
        this.psu = psu;
    }
    public Ram getRam() {
        return this.ram;
    }
    
    public void setRam(Ram ram) {
        this.ram = ram;
    }
    public String getOpis() {
        return this.opis;
    }
    
    public void setOpis(String opis) {
        this.opis = opis;
    }
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }




}


