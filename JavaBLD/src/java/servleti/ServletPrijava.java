/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Korisnici;
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
        
        
        HttpSession sesija = request.getSession();
        
        String user = request.getParameter("korisnicko");
        String pass = request.getParameter("sifra");
        
        if(user!=null && pass!=null)
        {
            try
                {
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction tr = s.beginTransaction();

                    SQLQuery q=s.createSQLQuery("select * from korisnici").addEntity("korisnici",Korisnici.class);

                    List<Korisnici> rows = q.list();
                    for(Korisnici row:rows)
                    {
                        if(row.getUsername().equals(user) && row.getPassword().equals(pass))
                        {
                            SQLQuery q1=s.createSQLQuery("select * from korisnici where username='"+user+"' and password='"+pass+"'").addEntity("korisnici",Korisnici.class);
                            List<Korisnici> korisnikLi = q1.list();
                            
                            for(Korisnici kor:korisnikLi)
                            {
                                korisnik.setKorisnikId(kor.getKorisnikId());
                                korisnik.setIme(kor.getIme());
                                korisnik.setPrezime(kor.getPrezime());
                                korisnik.setPassword(kor.getPassword());
                                korisnik.setUloga(kor.getUloga());
                                korisnik.setUsername(kor.getUsername());
                                korisnik.setImgPath(kor.getImgPath());
                                
                                sesija.setAttribute("korisnik", korisnik);
                                response.sendRedirect("index.jsp");
                            }
                            
                            return;
                        }
                        else
                        {
                            request.setAttribute("nepostoji", "Nalog sa ovim podacima ne postoji.");
                            request.getRequestDispatcher("prijava.jsp").forward(request, response);
                        }
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
