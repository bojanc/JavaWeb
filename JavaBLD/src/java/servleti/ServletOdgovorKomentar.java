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
public class ServletOdgovorKomentar extends HttpServlet {

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
        
        int komid = Integer.parseInt(request.getParameter("komID"));
        int podkomid = 0;
        if(request.getParameter("podkomID")!=null)
        {
            podkomid = Integer.parseInt(request.getParameter("podkomID"));
        }
        
        int konfigID = Integer.parseInt(request.getParameter("konfigID"));
        
        HttpSession session = request.getSession();
        String tekst = (String)request.getParameter("tekst");
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
        LocalDateTime now = LocalDateTime.now();  
        String time = now.format(dtf);
        
        Korisnici korisnik = (Korisnici)session.getAttribute("korisnik");
        try
        {
            
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Transaction tr = s.beginTransaction();
        if(podkomid!=0)
        {
            SQLQuery q = s.createSQLQuery("insert into podkomentari (podkomentari_korisnikID,odPodKomID,komentarID,vreme,tekst) "
                + "VALUES('"+korisnik.getKorisnikId()+"','"+podkomid+"','"+komid+"','"+time+"','"+tekst+"')");
            
            q.executeUpdate();
            tr.commit();
            s.close();

            response.sendRedirect("ServletPrikazKomentara?id="+konfigID+"");
        }
        else
        {
            SQLQuery q = s.createSQLQuery("insert into podkomentari (podkomentari_korisnikID,komentarID,vreme,tekst) "
                + "VALUES('"+korisnik.getKorisnikId()+"','"+komid+"','"+time+"','"+tekst+"')");
            
            q.executeUpdate();
            tr.commit();
            s.close();

            response.sendRedirect("ServletPrikazKomentara?id="+konfigID+"");
        }
        
        
        
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
