package entity;
// Generated Oct 25, 2020 3:28:51 PM by Hibernate Tools 4.3.1



/**
 * Igricefps generated by hbm2java
 */
public class Igricefps  implements java.io.Serializable {


     private Integer igricaFpsid;
     private Igrice igrice;
     private Konfiguracije konfiguracije;
     private int fps;

    public Igricefps() {
    }

    public Igricefps(Integer igricaFpsid,Igrice igrice, Konfiguracije konfiguracije, int fps) {
       this.igrice = igrice;
       this.konfiguracije = konfiguracije;
       this.fps = fps;
       this.igricaFpsid = igricaFpsid;
    }
   
    public Integer getIgricaFpsid() {
        return this.igricaFpsid;
    }
    
    public void setIgricaFpsid(Integer igricaFpsid) {
        this.igricaFpsid = igricaFpsid;
    }
    public Igrice getIgrice() {
        return this.igrice;
    }
    
    public void setIgrice(Igrice igrice) {
        this.igrice = igrice;
    }
    public Konfiguracije getKonfiguracije() {
        return this.konfiguracije;
    }
    
    public void setKonfiguracije(Konfiguracije konfiguracije) {
        this.konfiguracije = konfiguracije;
    }
    public int getFps() {
        return this.fps;
    }
    
    public void setFps(int fps) {
        this.fps = fps;
    }




}


