package entity;
// Generated Sep 23, 2020 12:34:30 PM by Hibernate Tools 4.3.1



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
     private String imgPath;

    public Memorija() {
    }

    public Memorija(Integer memorijaId,String naziv, String kapacitet, String tip, String cache, String dimenzije, String interfejs, String imgPath) {
       this.memorijaId = memorijaId;
       this.naziv = naziv;
       this.kapacitet = kapacitet;
       this.tip = tip;
       this.cache = cache;
       this.dimenzije = dimenzije;
       this.interfejs = interfejs;
       this.imgPath = imgPath;
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
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }




}


