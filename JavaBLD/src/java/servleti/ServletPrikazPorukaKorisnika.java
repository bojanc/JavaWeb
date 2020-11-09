/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Gpu;
import entity.Konfiguracije;
import entity.Korisnici;
import entity.Kuciste;
import entity.Kuleri;
import entity.Maticna;
import entity.Memorija;
import entity.Procesori;
import entity.Psu;
import entity.Ram;
import entity.Komentari;
import entity.Podkomentari;
import entity.Porukekorisnika;
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
public class ServletPrikazPorukaKorisnika extends HttpServlet {

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
        
            ArrayList<Porukekorisnika> poruke = new ArrayList<Porukekorisnika>();

            String poruka = "";
            if(request.getParameter("poslata")!=null)
            {
                poruka = (String)request.getParameter("poslata");
            }

            try
            {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();

                Transaction tr = s.beginTransaction();


                List<Porukekorisnika> rows = s.createSQLQuery("select {poruke.*}, {k.*} from PorukeKorisnika poruke, Korisnici k where poruke.poruke_korisnikID = k.korisnikID and poruke.odgovoreno = 'ne'")
                        .addEntity("poruke",Porukekorisnika.class)
                        .addJoin("k", "poruke.korisnici")
                        .addEntity("k",Korisnici.class)
                        .addEntity("poruke",Porukekorisnika.class)
                        .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                        .list();


                for(Porukekorisnika row:rows)
                {
                    poruke.add(new Porukekorisnika(row.getPorukaKorisnikaId(),row.getKorisnici(),row.getVreme(),row.getTekst(),row.getOdgovoreno()));
                }


                if(!poruka.equals(""))
                {
                    request.setAttribute("poslato", "da");
                }

                s.close();
                request.setAttribute("poruke", poruke);
                request.getRequestDispatcher("PorukeKorisnika.jsp").forward(request, response);



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
        
        int odgovorID = Integer.parseInt(request.getParameter("odgovorID"));
        int korID = Integer.parseInt(request.getParameter("korID"));
        String tekst = (String)request.getParameter("odgovorPoruka");
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
        LocalDateTime now = LocalDateTime.now();  
        String time = now.format(dtf);
        
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            
            Transaction tr = s.beginTransaction();
            
            
            SQLQuery q = s.createSQLQuery("insert into porukeurednika (porukaKorisnikaID,pu_korisnikID,vreme,tekst) VALUES('"+odgovorID+"','"+korID+"', '"+time+"', '"+tekst+"')");
            
            SQLQuery q1 = s.createSQLQuery("update porukekorisnika set odgovoreno = 'da' where porukaKorisnikaID = "+odgovorID+"");

            q.executeUpdate();
            q1.executeUpdate();
            tr.commit();
            s.close();
            
            
            response.sendRedirect("ServletPrikazPorukaKorisnika?poslata=da");
        
        
        
        }
        catch(HibernateException ex)
        {
            String errormsg = ex.getMessage();
            request.setAttribute("errormsg", errormsg);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        
        
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
