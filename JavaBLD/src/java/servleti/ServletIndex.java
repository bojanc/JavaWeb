/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;


import entity.Gpu;
import entity.Igrice;
import entity.Komentari;
import entity.Konfiguracije;
import entity.Korisnici;
import entity.Kuciste;
import entity.Kuleri;
import entity.Maticna;
import entity.Memorija;
import entity.Podkomentari;
import entity.Procesori;
import entity.Psu;
import entity.Ram;
import java.io.File;
import java.sql.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import net.sf.ehcache.hibernate.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.HibernateException;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Bojan
 */
@WebServlet("/Pocetna")
public class ServletIndex extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Konfiguracije> konfig = new ArrayList<Konfiguracije>();
        
        ArrayList<Komentari> komentar = new ArrayList<Komentari>();
        ArrayList<Podkomentari> podkom = new ArrayList<Podkomentari>();
        
        ArrayList<Igrice> igrice = new ArrayList<Igrice>();
        
        String novaP = "";
        
        if(request.getParameter("novaP")!=null)
        {
            novaP = (String)request.getParameter("novaP");
        }
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();
            
            
             List<Konfiguracije> rowsK = s.createSQLQuery(
            "select {k.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Konfiguracije k,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps, Ram ram, Korisnici kor where k.gpuID = g.gpuID and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.ramID = ram.ramID and k.korisnikID = kor.korisnikID and k.odobreno like 'da'")
              .addEntity("k", Konfiguracije.class)
              .addJoin("g", "k.gpu")
              .addEntity("g", Gpu.class)
              .addJoin("kuc", "k.kuciste")
              .addEntity("kuc", Kuciste.class)
                   .addJoin("kul", "k.kuleri")
              .addEntity("kul", Kuleri.class)
                   .addJoin("mat", "k.maticna")
              .addEntity("mat", Maticna.class)
                   .addJoin("mem", "k.memorija")
              .addEntity("mem", Memorija.class)
                   .addJoin("pro", "k.procesori")
              .addEntity("pro", Procesori.class)
                   .addJoin("ps", "k.psu")
              .addEntity("ps", Psu.class)
                   .addJoin("ram", "k.ram")
              .addEntity("ram", Ram.class)
                   .addJoin("kor", "k.korisnici")
              .addEntity("kor", Korisnici.class)
              .addEntity("k", Konfiguracije.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
             
             List<Komentari> komrows = s.createSQLQuery(
            "select {k.*}, {konfig.*}, {kor.*} from Komentari k,Konfiguracije konfig, Korisnici kor where k.komentari_konfiguracijaID = konfig.konfiguracijaID and k.komentari_korisnikID = kor.korisnikID")
              .addEntity("k", Komentari.class)
              .addJoin("konfig", "k.konfiguracije")
              .addEntity("konfig", Konfiguracije.class)
                   .addJoin("kor", "k.korisnici")
              .addEntity("kor", Korisnici.class)
              .addEntity("k", Komentari.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
           
           List<Podkomentari> podkomrows = s.createSQLQuery(
            "select {podk.*}, {k.*}, {kor.*} from Podkomentari podk left join Podkomentari podkk on podk.podkomentarID = podkk.odPodKomID,Komentari k, Korisnici kor where podk.komentarID = k.komentarID and podk.podkomentari_korisnikID = kor.korisnikID order by podk.PodkomentarID")
              .addEntity("podk", Podkomentari.class)
              .addJoin("k", "podk.komentari")
              .addEntity("k", Komentari.class)
                   .addJoin("kor", "k.korisnici")
              .addEntity("kor", Korisnici.class)
              .addEntity("podk", Podkomentari.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
           
           List<Igrice> rows = s.createSQLQuery(
            "select {i.*}, {cpu.*}, {gpu.*},{ram.*} from Igrice i,Procesori cpu, Gpu gpu, Ram ram where i.cpuPreID = cpu.procesorID and i.gpuPreID = gpu.gpuID and i.ramPreID = ram.ramID")
              .addEntity("i", Igrice.class)
              .addJoin("cpu", "i.procesori")
              .addEntity("cpu", Procesori.class)
                   .addJoin("gpu", "i.gpu")
              .addEntity("gpu", Gpu.class)
                   .addJoin("ram", "i.ram")
              .addEntity("ram", Ram.class)
              .addEntity("i", Igrice.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
           
           
            for(Igrice row:rows)
            {
                igrice.add(new Igrice(row.getIgricaId(), row.getGpu(), row.getProcesori(),row.getRam(),row.getIgricaNaziv(),row.getImgPath()));
            }
           
            for(Konfiguracije row:rowsK)
            {
                konfig.add(new Konfiguracije(row.getKonfiguracijaId(),row.getGpu(),row.getKorisnici(),row.getKuciste(),row.getKuleri(),row.getMaticna(),row.getMemorija(),row.getProcesori(),row.getPsu(),row.getRam(),row.getOpis(),row.getOdobreno(),row.getImgPath()));
            }
            
            for(Komentari row:komrows)
            {
                komentar.add(new Komentari(row.getKomentarId(),row.getKonfiguracije(),row.getKorisnici(),row.getVreme(),row.getTekst()));
            }
            
            for(Podkomentari row:podkomrows)
            {
                podkom.add(new Podkomentari(row.getPodkomentarId(),row.getKomentari(),row.getKorisnici(),row.getPodkomentari(),row.getVreme(),row.getTekst()));
            }
            
            if(!novaP.equals(""))
            {
                request.setAttribute("novaPoruka", "da");
            }
            
            request.setAttribute("konfig", konfig);
            request.setAttribute("komentar", komentar);
            request.setAttribute("podkom", podkom);
            request.setAttribute("igrice", igrice);
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        catch(HibernateException ex)
        {
            String errormsg = ex.getMessage();
            request.setAttribute("errormsg", errormsg);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
