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
@WebServlet("/Igrice")
public class ServletAdminPrikazIgrica extends HttpServlet {

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
        
        ArrayList<Igrice> igrice = new ArrayList<Igrice>();
        
        String poruka = "";
        String porukaI = "";
        String porukaFPS = "";
        String naziv = "";
        String obrisanFPS = "";
        
        if(request.getParameter("obrisano")!=null)
        {
            poruka = (String)request.getParameter("obrisano");
        }
        
        if(request.getParameter("izmenjeno")!=null)
        {
            porukaI = (String)request.getParameter("izmenjeno");
        }
        
        if(request.getParameter("fpsok")!=null)
        {
            porukaFPS = (String)request.getParameter("fpsok");
        }
        
        if(request.getParameter("name")!=null)
        {
            naziv = (String)request.getParameter("name");
        }
        
        if(request.getParameter("obrisanFPS")!=null)
        {
            obrisanFPS = (String)request.getParameter("obrisanFPS");
        }
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();
           
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
            
            if(!poruka.equals(""))
            {
                request.setAttribute("obrisano", "da");
            }
            
            if(!porukaI.equals(""))
            {
                request.setAttribute("izmenjeno", "da");
            }
            
            if(!porukaFPS.equals(""))
            {
                request.setAttribute("fpsOK", "da");
            }
            
            if(!naziv.equals(""))
            {
                request.setAttribute("nazivFPS", naziv);
            }
            
            if(!obrisanFPS.equals(""))
            {
                request.setAttribute("obrisanFPS", "da");
            }
            
            request.setAttribute("igrice", igrice);
            s.close();
            request.getRequestDispatcher("AdminPrikazIgrica.jsp").forward(request, response);
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
