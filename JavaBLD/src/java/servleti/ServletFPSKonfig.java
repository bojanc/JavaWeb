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
public class ServletFPSKonfig extends HttpServlet {

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
        
        ArrayList<Igricefps> igricefps = new ArrayList<Igricefps>();
        ArrayList<Igrice> igrica = new ArrayList<Igrice>();
        int id = 0;
        
        if(request.getParameter("id")!=null)
        {
            id = Integer.parseInt(request.getParameter("id"));
        }
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Session s1 = sf.openSession();
            Transaction tr = s.beginTransaction();
           
           List<Igricefps> rows = s.createSQLQuery(
            "select {ifps.*}, {k.*}, {i.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Igricefps ifps,Konfiguracije k, Igrice i,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps,Korisnici kor, Ram ram where k.gpuID = g.gpuID  and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.korisnikID = kor.korisnikID and k.ramID = ram.ramID and ifps.igricaID = i.igricaID and ifps.konfiguracijaID = k.konfiguracijaID and ifps.igricaID = "+id+"")
              .addEntity("ifps", Igricefps.class)
              .addJoin("k", "ifps.konfiguracije")
              .addEntity("k", Konfiguracije.class)
                   .addJoin("i", "ifps.igrice")
              .addEntity("i", Igrice.class)
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
              .addEntity("ifps", Igricefps.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
           
           List<Igrice> rows1 = s1.createSQLQuery(
            "select {i.*}, {cpu.*}, {gpu.*},{ram.*} from Igrice i,Procesori cpu, Gpu gpu, Ram ram where i.cpuPreID = cpu.procesorID and i.gpuPreID = gpu.gpuID and i.ramPreID = ram.ramID and i.igricaID = "+id+"")
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
           
           
            for(Igricefps row1:rows)
            {
                igricefps.add(new Igricefps(row1.getIgricaFpsid(),row1.getIgrice(),row1.getKonfiguracije(),row1.getFps()));
            }
            
            for(Igrice row:rows1)
            {
                igrica.add(new Igrice(row.getIgricaId(),row.getGpu(),row.getProcesori(),row.getRam(),row.getIgricaNaziv(),row.getImgPath()));
            }
            
            request.setAttribute("igricefps", igricefps);
            request.setAttribute("igrica", igrica);
            s.close();
            s1.close();
            request.getRequestDispatcher("FPSKonfig.jsp").forward(request, response);
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
        
        ArrayList<Igricefps> igricefps = new ArrayList<Igricefps>();
        ArrayList<Igricefps> igricefps1 = new ArrayList<Igricefps>();
        ArrayList<Igrice> igrica = new ArrayList<Igrice>();
        int id = Integer.parseInt(request.getParameter("konfig"));
        int igid = Integer.parseInt(request.getParameter("igricaID"));
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Session s1 = sf.openSession();
            Session s2 = sf.openSession();
            Transaction tr = s.beginTransaction();
            
            List<Igricefps> rows2 = s2.createSQLQuery(
            "select {ifps.*}, {k.*}, {i.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Igricefps ifps,Konfiguracije k, Igrice i,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps,Korisnici kor, Ram ram where k.gpuID = g.gpuID  and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.korisnikID = kor.korisnikID and k.ramID = ram.ramID and ifps.igricaID = i.igricaID and ifps.konfiguracijaID = k.konfiguracijaID and ifps.konfiguracijaID = "+id+"")
              .addEntity("ifps", Igricefps.class)
              .addJoin("k", "ifps.konfiguracije")
              .addEntity("k", Konfiguracije.class)
                   .addJoin("i", "ifps.igrice")
              .addEntity("i", Igrice.class)
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
              .addEntity("ifps", Igricefps.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
           
           List<Igricefps> rows = s.createSQLQuery(
            "select {ifps.*}, {k.*}, {i.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Igricefps ifps,Konfiguracije k, Igrice i,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps,Korisnici kor, Ram ram where k.gpuID = g.gpuID  and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.korisnikID = kor.korisnikID and k.ramID = ram.ramID and ifps.igricaID = i.igricaID and ifps.konfiguracijaID = k.konfiguracijaID and ifps.igricaID = "+igid+"")
              .addEntity("ifps", Igricefps.class)
              .addJoin("k", "ifps.konfiguracije")
              .addEntity("k", Konfiguracije.class)
                   .addJoin("i", "ifps.igrice")
              .addEntity("i", Igrice.class)
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
              .addEntity("ifps", Igricefps.class)
              .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
              .list();
           
           List<Igrice> rows1 = s1.createSQLQuery(
            "select {i.*}, {cpu.*}, {gpu.*},{ram.*} from Igrice i,Procesori cpu, Gpu gpu, Ram ram where i.cpuPreID = cpu.procesorID and i.gpuPreID = gpu.gpuID and i.ramPreID = ram.ramID and i.igricaID = "+igid+"")
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
           
           
            for(Igricefps row1:rows)
            {
                igricefps.add(new Igricefps(row1.getIgricaFpsid(),row1.getIgrice(),row1.getKonfiguracije(),row1.getFps()));
            }
            
            for(Igricefps row1:rows2)
            {
                igricefps1.add(new Igricefps(row1.getIgricaFpsid(),row1.getIgrice(),row1.getKonfiguracije(),row1.getFps()));
            }
            
            for(Igrice row:rows1)
            {
                igrica.add(new Igrice(row.getIgricaId(),row.getGpu(),row.getProcesori(),row.getRam(),row.getIgricaNaziv(),row.getImgPath()));
            }
            
            request.setAttribute("igricefps", igricefps);
            request.setAttribute("igricefps1", igricefps1);
            request.setAttribute("igrica", igrica);
            request.setAttribute("izabrano", "da");
            request.setAttribute("konfig", id);
            s.close();
            s1.close();
            request.getRequestDispatcher("FPSKonfig.jsp").forward(request, response);
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
