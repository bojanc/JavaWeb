/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Igrice;
import entity.Gpu;
import entity.Igricefps;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.HibernateException;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Bojan
 */
public class ServletUnesiFPS extends HttpServlet {

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
        
        int fps = Integer.parseInt(request.getParameter("fps"));
        int igricaID = Integer.parseInt(request.getParameter("igricaID"));
        int konfigID = Integer.parseInt(request.getParameter("konfigID"));
        String naziv = request.getParameter("name");
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();
            
            List<Igricefps> rowsfps = s.createSQLQuery(
            "select {ifps.*}, {i.*}, {konfig.*} from Igricefps ifps,Igrice i, Konfiguracije konfig where ifps.igricaID = i.igricaID and ifps.konfiguracijaID = konfig.konfiguracijaID and ifps.igricaID = "+igricaID+" and ifps.konfiguracijaID ="+konfigID+"")
              .addEntity("ifps", Igricefps.class)
              .addJoin("i", "ifps.igrice")
              .addEntity("i", Igrice.class)
                   .addJoin("konfig", "ifps.konfiguracije")
              .addEntity("konfig", Konfiguracije.class)
              .addEntity("ifps", Igricefps.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
            
            if(rowsfps.size()>0)
            {
                int fpsid = rowsfps.get(0).getIgricaFpsid();
                response.sendRedirect("ServletAdminDodajFPS?id="+igricaID+"&vecpostoji=da&fpsid="+fpsid+"");
                return;
            }
            
            SQLQuery q = s.createSQLQuery("insert into igricefps(konfiguracijaID,igricaID,fps) values ('"+konfigID+"','"+igricaID+"','"+fps+"')");
            
            q.executeUpdate();
            tr.commit();
            s.close();
            
            response.sendRedirect("ServletAdminPrikazIgrica?fpsok=ok&name="+naziv+"");
            
            
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
