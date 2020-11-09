/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Gpu;
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
public class ServletUrednikOdobravanjeKonfig extends HttpServlet {

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
        
        HttpSession sesija = request.getSession();
        Korisnici korisnik = new Korisnici();
        if(sesija.getAttribute("korisnik")!=null)
        {
            korisnik = (Korisnici)sesija.getAttribute("korisnik");
        }
        else
        {
            response.sendRedirect("ServletIndex");
            return;
        }
        if(korisnik.getUloga().equals("Urednik"))
        {
        
            ArrayList<Konfiguracije> konfig = new ArrayList<Konfiguracije>();

            String poruka = "";
            String obrisano = "";

            if(request.getParameter("poruka")!=null)
            {
                poruka = (String)request.getParameter("poruka");
            }



            if(request.getParameter("obrisano")!=null)
            {
                obrisano = (String)request.getParameter("obrisano");
            }

            try
            {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction tr = s.beginTransaction();
                
               List<Konfiguracije> rows = s.createSQLQuery(
                "select {k.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Konfiguracije k,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps, Ram ram, Korisnici kor where k.gpuID = g.gpuID and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.ramID = ram.ramID and k.korisnikID = kor.korisnikID and k.odobreno = 'ne'")
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

                for(Konfiguracije row:rows)
                {
                    konfig.add(new Konfiguracije(row.getKonfiguracijaId(),row.getGpu(),row.getKorisnici(),row.getKuciste(),row.getKuleri(),row.getMaticna(),row.getMemorija(),row.getProcesori(),row.getPsu(),row.getRam(),row.getOpis(),row.getOdobreno(),row.getImgPath()));
                }

                if(!poruka.equals(""))
                {
                    request.setAttribute("odobreno", "da");
                }

                if(!obrisano.equals(""))
                {
                    request.setAttribute("obrisano", "da");
                }

                request.setAttribute("konfig", konfig);
                s.close();
                request.getRequestDispatcher("UrednikPrikazKonfiguracija.jsp").forward(request, response);
            }
            catch(HibernateException ex)
            {
                String errormsg = ex.getMessage();
                request.setAttribute("errormsg", errormsg);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        else
        {
            response.sendRedirect("ServletIndex");
            return;
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
        processRequest(request, response);
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
