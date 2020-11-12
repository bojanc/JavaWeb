/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Igrice;
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
public class ServletIzracunajFPS extends HttpServlet {

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
        
        String igricaGPUMEM = (String)request.getParameter("igricaGPUMEM");
        String igricaGPUMhz = (String)request.getParameter("igricaGPUMhz");
        String igricaCPUMhz = (String)request.getParameter("igricaCPUMhz");
        String igricaCPUCore = (String)request.getParameter("igricaCPUCore");
        String igricaRAMMem = (String)request.getParameter("igricaRAMMem");
        String igricaID = (String)request.getParameter("igricaID");
        int konfigID = Integer.parseInt((request.getParameter("konfig")));
        
        Konfiguracije konfig = new Konfiguracije();
        
        igricaGPUMhz = igricaGPUMhz.substring(0, igricaGPUMhz.length() - 4);
        igricaCPUMhz = igricaCPUMhz.substring(0, igricaCPUMhz.length() - 4);
        igricaGPUMEM = igricaGPUMEM.substring(0,2);
        
        String igricaRAMMemorija = igricaRAMMem.substring(0,2);
        String igricaRAMMhz = igricaRAMMem.substring(igricaRAMMem.length()-4);
        
        if(igricaGPUMEM.indexOf("G")>-1)
        {
            igricaGPUMEM = igricaGPUMEM.substring(0,1);
        }
        
        if(igricaRAMMemorija.indexOf("G")>-1)
        {
            igricaRAMMemorija = igricaRAMMem.substring(0,1);
        }
        
        int gameGpuMem = Integer.parseInt(igricaGPUMEM);
        int gameGpuMhz = Integer.parseInt(igricaGPUMhz);
        float gameCpuMhz = Float.parseFloat(igricaCPUMhz);
        int gameCpuCore = Integer.parseInt(igricaCPUCore);
        int gameRamMem = Integer.parseInt(igricaRAMMemorija);
        int gameRamMhz = Integer.parseInt(igricaRAMMhz);
        
        
        try
        {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();
            
             List<Konfiguracije> rowsK = s.createSQLQuery(
            "select {k.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Konfiguracije k,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps, Ram ram, Korisnici kor where k.gpuID = g.gpuID and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.ramID = ram.ramID and k.korisnikID = kor.korisnikID and k.konfiguracijaID='"+konfigID+"'")
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
           
            for(Konfiguracije row:rowsK)
            {
                konfig = new Konfiguracije(row.getKonfiguracijaId(),row.getGpu(),row.getKorisnici(),row.getKuciste(),row.getKuleri(),row.getMaticna(),row.getMemorija(),row.getProcesori(),row.getPsu(),row.getRam(),row.getOpis(),row.getOdobreno(),row.getImgPath());
            }
            
            int konfigGpuMhz = Integer.parseInt(konfig.getGpu().getBoostCl().substring(0, konfig.getGpu().getBoostCl().length() - 4));
            float konfigCpuMhz = Float.parseFloat(konfig.getProcesori().getBoost().substring(0, konfig.getProcesori().getBoost().length() - 4));
            int konfigCpuCore = konfig.getProcesori().getBrojJezgara();
            int konfigRamMhz = Integer.parseInt(konfig.getRam().getBrzina().substring(konfig.getRam().getBrzina().length()-4));
            
            int konfigGpuMem = 0;
            int konfigRamMem = 0;
            
            String gpumem = konfig.getGpu().getMemorija();
            gpumem = gpumem.substring(0,2);
            
            if(gpumem.indexOf("G")>-1)
            {
                gpumem = gpumem.substring(0,1);
            }
            
            String rammem = konfig.getRam().getBrzina();
            rammem = rammem.substring(0,2);
            
            if(rammem.indexOf("G")>-1)
            {
               rammem =  rammem.substring(0,1);
            }
            
            konfigGpuMem = Integer.parseInt(gpumem);
            konfigRamMem = Integer.parseInt(rammem);
            
            float fps = 0;
            
            if(gameGpuMem<=konfigGpuMem && gameCpuMhz<=konfigCpuMhz && gameCpuCore<=konfigCpuCore && gameRamMem<=konfigRamMem && gameRamMhz<=konfigRamMhz)
            {
                fps = 60;
            }
            
            float gpuMemDif = 0;
            float gpuMhzDif = 0;
            float cpuMhzDif = 0;
            float ramMhzDif = 0;
            float ramMemDif = 0;
            
            
            if(konfigGpuMem!=gameGpuMem)
            {
                gpuMemDif = (float)(((float)konfigGpuMem/gameGpuMem)/10)*60;
                fps += gpuMemDif;
            }
            
            if(konfigGpuMhz!=gameGpuMhz)
            {
                if(konfigGpuMhz > gameGpuMhz)
                {
                    gpuMhzDif = (float)(((float)konfigGpuMhz/gameGpuMhz)/10)*60;
                    fps+= gpuMhzDif;
                }
            }
            
            if(konfigCpuMhz!=gameCpuMhz)
            {
                cpuMhzDif = (float)(((float)konfigCpuMhz/gameCpuMhz)/10)*60;
                fps+= cpuMhzDif;
            }
            
            if(konfigRamMhz!=gameRamMhz)
            {
                ramMhzDif = (float)(((float)konfigRamMhz/gameRamMhz)/20)*60;
                fps+= ramMhzDif;
            }
            
            if(konfigRamMem!=gameRamMem)
            {
                ramMemDif = (float)(((float)konfigRamMem/gameRamMem)/20)*60;
                fps+=ramMemDif;
            }
            int fpsINT = Math.round(fps);
            int a = 0;
            response.sendRedirect("ServletAdminDodajFPS?id="+igricaID+"&konfigID="+konfigID+"&fps="+fpsINT+"");
            
            
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
