/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Gpu;
import entity.Korisnici;
import entity.Kuciste;
import entity.Kuleri;
import entity.Maticna;
import entity.Memorija;
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
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.HibernateException;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Bojan
 */
public class ServletAdminPrikazDelova extends HttpServlet {

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
        
        
        String deo=request.getParameter("deo");
        
        ArrayList<Gpu> gpu = new ArrayList<Gpu>();
        ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
        ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
        ArrayList<Maticna> maticna = new ArrayList<Maticna>();
        ArrayList<Memorija> memorija = new ArrayList<Memorija>();
        ArrayList<Procesori> cpu = new ArrayList<Procesori>();
        ArrayList<Psu> psu = new ArrayList<Psu>();
        ArrayList<Ram> ram = new ArrayList<Ram>();
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();

            if(deo.equals("gpu"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Gpu.class);
                List<Gpu> rows = q.list();
                
                for(Gpu row:rows)
                {
                    gpu.add(new Gpu(row.getGpuId(), row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("gpu", gpu);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("kuciste"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Kuciste.class);
                List<Kuciste> rows = q.list();
                
                for(Kuciste row:rows)
                {
                    kuciste.add(new Kuciste(row.getKucisteId(),row.getNaziv(),row.getDimenzije(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("kuciste", kuciste);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("kuleri"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Kuleri.class);
                List<Kuleri> rows = q.list();
                
                for(Kuleri row:rows)
                {
                    kuler.add(new Kuleri(row.getKulerId(),row.getNaziv(),row.getRpm(),row.getBuka(),row.getRadijatorDim(), row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("kuler", kuler);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("maticna"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Maticna.class);
                List<Maticna> rows = q.list();
                
                for(Maticna row:rows)
                {
                    maticna.add(new Maticna(row.getMaticnaId(),row.getNaziv(),row.getSocket(),row.getVelicina(),row.getMaxRam(),row.getMemSlots(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("maticna", maticna);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("memorija"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Memorija.class);
                List<Memorija> rows = q.list();
                
                for(Memorija row:rows)
                {
                    memorija.add(new Memorija(row.getMemorijaId(),row.getNaziv(),row.getKapacitet(),row.getTip(),row.getCache(),row.getDimenzije(),row.getInterfejs(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("memorija", memorija);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("procesori"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Procesori.class);
                List<Procesori> rows = q.list();
                
                for(Procesori row:rows)
                {
                    cpu.add(new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("cpu", cpu);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("psu"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Psu.class);
                List<Psu> rows = q.list();
                
                for(Psu row:rows)
                {
                    psu.add(new Psu(row.getPsuId(),row.getNaziv(),row.getEfikasnost(),row.getJacina(),row.getModularnost(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("psu", psu);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("ram"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Ram.class);
                List<Ram> rows = q.list();
                
                for(Ram row:rows)
                {
                    ram.add(new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("ram", ram);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
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
        
        String deo=request.getParameter("deo");
        String deo1=(String)request.getAttribute("deo");
        
        ArrayList<Gpu> gpu = new ArrayList<Gpu>();
        ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
        ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
        ArrayList<Maticna> maticna = new ArrayList<Maticna>();
        ArrayList<Memorija> memorija = new ArrayList<Memorija>();
        ArrayList<Procesori> cpu = new ArrayList<Procesori>();
        ArrayList<Psu> psu = new ArrayList<Psu>();
        ArrayList<Ram> ram = new ArrayList<Ram>();
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();

            if(deo.equals("gpu"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Gpu.class);
                List<Gpu> rows = q.list();
                
                for(Gpu row:rows)
                {
                    gpu.add(new Gpu(row.getGpuId(), row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("gpu", gpu);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("kuciste"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Kuciste.class);
                List<Kuciste> rows = q.list();
                
                for(Kuciste row:rows)
                {
                    kuciste.add(new Kuciste(row.getKucisteId(),row.getNaziv(),row.getDimenzije(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("kuciste", kuciste);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("kuleri"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Kuleri.class);
                List<Kuleri> rows = q.list();
                
                for(Kuleri row:rows)
                {
                    kuler.add(new Kuleri(row.getKulerId(),row.getNaziv(),row.getRpm(),row.getBuka(),row.getRadijatorDim(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("kuler", kuler);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("maticna"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Maticna.class);
                List<Maticna> rows = q.list();
                
                for(Maticna row:rows)
                {
                    maticna.add(new Maticna(row.getMaticnaId(),row.getNaziv(),row.getSocket(),row.getVelicina(),row.getMaxRam(),row.getMemSlots(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("maticna", maticna);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("memorija"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Memorija.class);
                List<Memorija> rows = q.list();
                
                for(Memorija row:rows)
                {
                    memorija.add(new Memorija(row.getMemorijaId(),row.getNaziv(),row.getKapacitet(),row.getTip(),row.getCache(),row.getDimenzije(),row.getInterfejs(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("memorija", memorija);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("procesori"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Procesori.class);
                List<Procesori> rows = q.list();
                
                for(Procesori row:rows)
                {
                    cpu.add(new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("cpu", cpu);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("psu"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Psu.class);
                List<Psu> rows = q.list();
                
                for(Psu row:rows)
                {
                    psu.add(new Psu(row.getPsuId(),row.getNaziv(),row.getEfikasnost(),row.getJacina(),row.getModularnost(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("psu", psu);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
            }
            else if(deo.equals("ram"))
            {
                SQLQuery q=s.createSQLQuery("select * from "+deo+"").addEntity(Ram.class);
                List<Ram> rows = q.list();
                
                for(Ram row:rows)
                {
                    ram.add(new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getImgPath()));
                }
                
                request.setAttribute("deo", deo);
                request.setAttribute("ram", ram);
                s.close();
                request.getRequestDispatcher("AdminPrikazDelova.jsp").forward(request, response);
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
