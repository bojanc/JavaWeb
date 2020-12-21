/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Korisnici;
import entity.Porukekorisnika;
import entity.Porukeurednika;
import java.io.File;
import java.sql.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.time.Duration;
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
public class ServletPrijava extends HttpServlet {

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
        processRequest(request, response);
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
        
        Korisnici korisnik = new Korisnici();
        ArrayList<Porukekorisnika> poruke = new ArrayList<Porukekorisnika>();
        ArrayList<Porukeurednika> porukeU = new ArrayList<Porukeurednika>();
        HttpSession sesija = request.getSession();
        
        String user = request.getParameter("korisnicko");
        String pass = request.getParameter("sifra");
        String sha1="";
        
        if(user!=null && pass!=null)
        {
            try
            {
                MessageDigest digest = MessageDigest.getInstance("SHA-1");
                digest.reset();
                digest.update(pass.getBytes("utf8"));
                sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
            }
            catch(Exception e)
            {
                    e.printStackTrace();
            }
            
            try
                {
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction tr = s.beginTransaction();

                    SQLQuery q1=s.createSQLQuery("select * from korisnici where username='"+user+"' and password='"+sha1+"'").addEntity("korisnici",Korisnici.class);

                    List<Korisnici> rows = q1.list();
                    
                    if(rows.size()!=0)
                    {
                        for(Korisnici kor:rows)
                        {
                            korisnik.setKorisnikId(kor.getKorisnikId());
                            korisnik.setIme(kor.getIme());
                            korisnik.setPrezime(kor.getPrezime());
                            korisnik.setPassword(kor.getPassword());
                            korisnik.setUloga(kor.getUloga());
                            korisnik.setUsername(kor.getUsername());
                            korisnik.setImgPath(kor.getImgPath());
                        }
                        
                        if(korisnik.getUloga().equals("Urednik"))
                        {
                            List<Porukekorisnika> rowsP = s.createSQLQuery("select {poruke.*}, {k.*} from PorukeKorisnika poruke, Korisnici k where poruke.poruke_korisnikID = k.korisnikID and poruke.odgovoreno = 'ne'")
                            .addEntity("poruke",Porukekorisnika.class)
                            .addJoin("k", "poruke.korisnici")
                            .addEntity("k",Korisnici.class)
                            .addEntity("poruke",Porukekorisnika.class)
                            .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                            .list();


                            for(Porukekorisnika row:rowsP)
                            {
                                poruke.add(new Porukekorisnika(row.getPorukaKorisnikaId(),row.getKorisnici(),row.getVreme(),row.getTekst(),row.getOdgovoreno()));
                            }
                            
                            for(Porukekorisnika row:poruke)
                            {
                                if(row.getOdgovoreno().equals("ne"))
                                {
                                    s.close();
                            
                                    sesija.setAttribute("korisnik", korisnik);
                                    response.sendRedirect("Pocetna?novaP=da");
                                    return;
                                }
                            }
                        }
                        else if(korisnik.getUloga().equals("Klijent"))
                        {
                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
                            LocalDateTime now = LocalDateTime.now();  
                            String time = now.format(dtf);
                            
                            List<Porukeurednika> rowsU = s.createSQLQuery("select {porukeu.*}, {k.*}, {kor.*} from Porukeurednika porukeu, Porukekorisnika k, Korisnici kor where porukeu.porukaKorisnikaID = k.porukaKorisnikaID and porukeu.pu_korisnikID = kor.korisnikID and k.poruke_KorisnikID = "+korisnik.getKorisnikId()+"")
                                .addEntity("porukeu",Porukeurednika.class)
                                .addJoin("k", "porukeu.porukekorisnika")
                                .addEntity("k",Porukekorisnika.class)
                                .addJoin("kor", "porukeu.korisnici")
                                .addEntity("kor", Korisnici.class)
                                .addEntity("porukeu",Porukeurednika.class)
                                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                                .list();
                            
                            for(Porukeurednika row:rowsU)
                            {
                                porukeU.add(new Porukeurednika(row.getPorukaUrednikId(),row.getKorisnici(),row.getPorukekorisnika(),row.getVreme(),row.getTekst()));
                            }
                            
                            for(Porukeurednika row:porukeU)
                            {
                                LocalDateTime vreme = LocalDateTime.parse(row.getVreme(), dtf);
                                long days = Duration.between(vreme, now).toDays();
                                
                                if(days == 0)
                                {
                                    s.close();
                            
                                    sesija.setAttribute("korisnik", korisnik);
                                    response.sendRedirect("Pocetna?novaP=da");
                                    return;
                                }
                            }
                        }
                        
                        
                        s.close();
                            
                        sesija.setAttribute("korisnik", korisnik);
                        response.sendRedirect("Pocetna");
                        return;
                    }
                    else
                    {
                        s.close();
                        request.setAttribute("nepostoji", "Nalog sa ovim podacima ne postoji!");
                        request.getRequestDispatcher("prijava.jsp").forward(request, response);
                        return;
                    }
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
            request.setAttribute("polja", "Morate popuniti sva polja!");
            request.getRequestDispatcher("prijava.jsp").forward(request, response);
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
