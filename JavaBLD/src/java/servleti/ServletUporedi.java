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
import java.util.Arrays;
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
public class ServletUporedi extends HttpServlet {

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
        
        
        String[] gpup = null;
        List<String> gpul = new ArrayList<String>();
        if(request.getParameterValues("gpu")!=null)
        {
            gpup = request.getParameterValues("gpu");
            gpul = Arrays.asList(gpup);
        }
        
        
        String[] kucistep = null;
        List<String> kucistel = new ArrayList<String>();
        if(request.getParameterValues("kuc")!=null)
        {
            kucistep = request.getParameterValues("kuc");
            kucistel = Arrays.asList(kucistep);
        }
        
        String[] kulerip = null;
        List<String> kuleril = new ArrayList<String>();
        if(request.getParameterValues("kul")!=null)
        {
            kulerip = request.getParameterValues("kul");
            kuleril = Arrays.asList(kulerip);
        }
        
        String[] maticnap = null;
        List<String> maticnal = new ArrayList<String>();
        if(request.getParameterValues("mb")!=null)
        {
            maticnap = request.getParameterValues("mb");
            maticnal = Arrays.asList(maticnap);
        }
        
        String[] memorijap = null;
        List<String> memorijal = new ArrayList<String>();
        if(request.getParameterValues("mem")!=null)
        {
            memorijap = request.getParameterValues("mem");
            memorijal = Arrays.asList(memorijap);
        }
        
        String[] procesorp = null;
        List<String> procesorl = new ArrayList<String>();
        if(request.getParameterValues("cpu")!=null)
        {
            procesorp = request.getParameterValues("cpu");
            procesorl = Arrays.asList(procesorp);
        }
        
        String[] napajanjep = null;
        List<String> napajanjel = new ArrayList<String>();
        if(request.getParameterValues("psu")!=null)
        {
            napajanjep = request.getParameterValues("psu");
            napajanjel = Arrays.asList(napajanjep);
        }
        
        String[] ramp = null;
        List<String> raml = new ArrayList<String>();
        if(request.getParameterValues("ram")!=null)
        {
            ramp = request.getParameterValues("ram");
            raml = Arrays.asList(ramp);
        }
        
        ArrayList<Gpu> gpu = new ArrayList<Gpu>();
        ArrayList<Gpu> gpusve = new ArrayList<Gpu>();
        ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
        ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
        ArrayList<Maticna> maticna = new ArrayList<Maticna>();
        ArrayList<Memorija> memorija = new ArrayList<Memorija>();
        ArrayList<Procesori> cpu = new ArrayList<Procesori>();
        ArrayList<Procesori> cpusve = new ArrayList<Procesori>();
        ArrayList<Psu> psu = new ArrayList<Psu>();
        ArrayList<Ram> ram = new ArrayList<Ram>();
        ArrayList<Ram> ramsve = new ArrayList<Ram>();
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();
            
            if(gpul.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from gpu where gpuID in ('"+gpul.get(0)+"','"+gpul.get(1)+"')").addEntity(Gpu.class);
                List<Gpu> rows = q.list();
                
                SQLQuery q1=s.createSQLQuery("select * from gpu").addEntity(Gpu.class);
                List<Gpu> rows1 = q1.list();
                
                for(Gpu row:rows)
                {
                    gpu.add(new Gpu(row.getGpuId(), row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getTdp(),row.getImgPath()));
                }
                
                for(Gpu row:rows1)
                {
                    gpusve.add(new Gpu(row.getGpuId(), row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getTdp(),row.getImgPath()));
                }
                
                request.setAttribute("gpu", gpu);
                request.setAttribute("gpusve", gpusve);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(kucistel.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from kuciste where kucisteID in ('"+kucistel.get(0)+"','"+kucistel.get(1)+"')").addEntity(Kuciste.class);
                List<Kuciste> rows = q.list();
                
                for(Kuciste row:rows)
                {
                    kuciste.add(new Kuciste(row.getKucisteId(),row.getNaziv(),row.getDimenzije(),row.getImgPath()));
                }
                
                request.setAttribute("kuciste", kuciste);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(kuleril.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from kuleri where kulerID in ('"+kuleril.get(0)+"','"+kuleril.get(1)+"')").addEntity(Kuleri.class);
                List<Kuleri> rows = q.list();
                
                for(Kuleri row:rows)
                {
                    kuler.add(new Kuleri(row.getKulerId(),row.getNaziv(),row.getRpm(),row.getBuka(),row.getRadijatorDim(), row.getImgPath()));
                }
                
                request.setAttribute("kuler", kuler);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(maticnal.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from maticna where maticnaID in ('"+maticnal.get(0)+"','"+maticnal.get(1)+"')").addEntity(Maticna.class);
                List<Maticna> rows = q.list();
                
                for(Maticna row:rows)
                {
                    maticna.add(new Maticna(row.getMaticnaId(),row.getNaziv(),row.getSocket(),row.getVelicina(),row.getMaxRam(),row.getMemSlots(),row.getImgPath()));
                }
                
                request.setAttribute("maticna", maticna);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(memorijal.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from memorija where memorijaID in ('"+memorijal.get(0)+"','"+memorijal.get(1)+"')").addEntity(Memorija.class);
                List<Memorija> rows = q.list();
                
                for(Memorija row:rows)
                {
                    memorija.add(new Memorija(row.getMemorijaId(),row.getNaziv(),row.getKapacitet(),row.getTip(),row.getCache(),row.getDimenzije(),row.getInterfejs(),row.getTdp(),row.getImgPath()));
                }
                
                request.setAttribute("memorija", memorija);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(procesorl.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from procesori where procesorID in ('"+procesorl.get(0)+"','"+procesorl.get(1)+"')").addEntity(Procesori.class);
                List<Procesori> rows = q.list();
                
                SQLQuery q1=s.createSQLQuery("select * from procesori").addEntity(Procesori.class);
                List<Procesori> rows1 = q1.list();
                
                for(Procesori row:rows)
                {
                    cpu.add(new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath()));
                }
                
                for(Procesori row:rows1)
                {
                    cpusve.add(new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath()));
                }
                
                request.setAttribute("cpu", cpu);
                request.setAttribute("cpusve", cpusve);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(napajanjel.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from psu where psuID in ('"+napajanjel.get(0)+"','"+napajanjel.get(1)+"')").addEntity(Psu.class);
                List<Psu> rows = q.list();
                
                for(Psu row:rows)
                {
                    psu.add(new Psu(row.getPsuId(),row.getNaziv(),row.getEfikasnost(),row.getJacina(),row.getModularnost(),row.getImgPath()));
                }
                
                request.setAttribute("psu", psu);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
            }
            
            if(raml.size()>0)
            {
                SQLQuery q=s.createSQLQuery("select * from ram where ramID in ('"+raml.get(0)+"','"+raml.get(1)+"')").addEntity(Ram.class);
                List<Ram> rows = q.list();
                
                SQLQuery q1=s.createSQLQuery("select * from ram").addEntity(Ram.class);
                List<Ram> rows1 = q1.list();
                
                for(Ram row:rows)
                {
                    ram.add(new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getTdp(),row.getImgPath()));
                }
                
                for(Ram row:rows1)
                {
                    ramsve.add(new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getTdp(),row.getImgPath()));
                }
                
                request.setAttribute("ram", ram);
                request.setAttribute("ramsve", ramsve);
                s.close();
                request.getRequestDispatcher("UporedjivanjeDelova.jsp").forward(request, response);
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
