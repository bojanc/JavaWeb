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
import javax.servlet.annotation.WebServlet;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Bojan
 */
@WebServlet("/IzmeniKonfiguraciju")
public class ServletAdminIzmenaKonfiguracije extends HttpServlet {

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
        
            ArrayList<Gpu> gpu = new ArrayList<Gpu>();
            ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
            ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
            ArrayList<Maticna> maticna = new ArrayList<Maticna>();
            ArrayList<Memorija> memorija = new ArrayList<Memorija>();
            ArrayList<Procesori> cpu = new ArrayList<Procesori>();
            ArrayList<Psu> psu = new ArrayList<Psu>();
            ArrayList<Ram> ram = new ArrayList<Ram>();
            Konfiguracije konfig = new Konfiguracije();

            int id = 0;
            id = Integer.parseInt(request.getParameter("id"));

            String polja="";
            String slika = "";
            String socket = "";
            String lowpsu = "";

            if(request.getParameter("polja")!=null)
            {
                polja = request.getParameter("polja");
            }

            if(request.getParameter("slika")!=null)
            {
                slika = request.getParameter("slika");
            }

            if(request.getParameter("socket")!=null)
            {
                socket = request.getParameter("socket");
            }

            if(request.getParameter("lowpsu")!=null)
            {
                lowpsu = request.getParameter("lowpsu");
            }

            try
            {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction tr = s.beginTransaction();

                    SQLQuery q=s.createSQLQuery("select * from gpu").addEntity(Gpu.class);
                    List<Gpu> rows = q.list();

                    for(Gpu row:rows)
                    {
                        gpu.add(new Gpu(row.getGpuId(), row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getTdp(),row.getImgPath()));
                    }

                    SQLQuery q1=s.createSQLQuery("select * from kuciste").addEntity(Kuciste.class);
                    List<Kuciste> rows1 = q1.list();

                    for(Kuciste row:rows1)
                    {
                        kuciste.add(new Kuciste(row.getKucisteId(),row.getNaziv(),row.getDimenzije(),row.getImgPath()));
                    }

                    SQLQuery q2=s.createSQLQuery("select * from kuleri").addEntity(Kuleri.class);
                    List<Kuleri> rows2 = q2.list();

                    for(Kuleri row:rows2)
                    {
                        kuler.add(new Kuleri(row.getKulerId(),row.getNaziv(),row.getRpm(),row.getBuka(),row.getRadijatorDim(), row.getImgPath()));
                    }

                    SQLQuery q3=s.createSQLQuery("select * from maticna").addEntity(Maticna.class);
                    List<Maticna> rows3 = q3.list();

                    for(Maticna row:rows3)
                    {
                        maticna.add(new Maticna(row.getMaticnaId(),row.getNaziv(),row.getSocket(),row.getVelicina(),row.getMaxRam(),row.getMemSlots(),row.getImgPath()));
                    }

                    SQLQuery q4=s.createSQLQuery("select * from memorija").addEntity(Memorija.class);
                    List<Memorija> rows4 = q4.list();

                    for(Memorija row:rows4)
                    {
                        memorija.add(new Memorija(row.getMemorijaId(),row.getNaziv(),row.getKapacitet(),row.getTip(),row.getCache(),row.getDimenzije(),row.getInterfejs(),row.getTdp(),row.getImgPath()));
                    }

                    SQLQuery q5=s.createSQLQuery("select * from procesori").addEntity(Procesori.class);
                    List<Procesori> rows5 = q5.list();

                    for(Procesori row:rows5)
                    {
                        cpu.add(new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath()));
                    }

                    SQLQuery q6=s.createSQLQuery("select * from psu").addEntity(Psu.class);
                    List<Psu> rows6 = q6.list();

                    for(Psu row:rows6)
                    {
                        psu.add(new Psu(row.getPsuId(),row.getNaziv(),row.getEfikasnost(),row.getJacina(),row.getModularnost(),row.getImgPath()));
                    }

                    SQLQuery q7=s.createSQLQuery("select * from ram").addEntity(Ram.class);
                    List<Ram> rows7 = q7.list();

                    for(Ram row:rows7)
                    {
                        ram.add(new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getTdp(),row.getImgPath()));
                    }

                    List<Konfiguracije> rowsK = s.createSQLQuery(
                "select {k.*}, {g.*}, {kuc.*},{kul.*}, {mat.*}, {mem.*}, {pro.*}, {ps.*}, {ram.*}, {kor.*} from Konfiguracije k,Gpu g, Kuciste kuc,Kuleri kul, Maticna mat, Memorija mem, Procesori pro, Psu ps, Ram ram, Korisnici kor where k.gpuID = g.gpuID and k.kucisteID = kuc.kucisteID and k.kulerID = kul.kulerID  and k.maticnaID = mat.maticnaID and k.memorijaID = mem.memorijaID and k.procesorID = pro.procesorID and k.psuID = ps.psuID and k.ramID = ram.ramID and k.korisnikID = kor.korisnikID and k.konfiguracijaID='"+id+"'")
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

                    request.setAttribute("gpu", gpu);
                    request.setAttribute("kuciste", kuciste);
                    request.setAttribute("kuler", kuler);
                    request.setAttribute("maticna", maticna);
                    request.setAttribute("memorija", memorija);
                    request.setAttribute("cpu", cpu);
                    request.setAttribute("psu", psu);
                    request.setAttribute("ram", ram);
                    request.setAttribute("konfig", konfig);

                    if(polja.equals("da"))
                    {
                        request.setAttribute("praznaPolja", "Morate izabrati sve delove!");
                    }

                    if(slika.equals("da"))
                    {
                        request.setAttribute("praznaSlika", "Morate izabrati sliku!");
                    }

                    if(socket.equals("da"))
                    {
                        request.setAttribute("socket", "Socketi za procesor i matičnu ploču se ne poklapaju!");
                    }

                    if(lowpsu.equals("da"))
                    {
                        request.setAttribute("lowpsu", "Potrošnja konfiguracije je veća od jačine napajanja!");
                    }

                    s.close();
                    request.getRequestDispatcher("AdminIzmenaKonfiguracije.jsp").forward(request, response);
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
        
        String filePath = "";
        String nazivF = "";
        ArrayList<String> podaci = new ArrayList<String>();
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart)
        {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try
            {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext())
                {
                    FileItem item = (FileItem) iterator.next();

                    if (!item.isFormField())
                    {
                        String fileName = item.getName();
                        
                        
                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
                            LocalDateTime now = LocalDateTime.now();  
                            String time = now.format(dtf);
                            String str = time.replace("/", "");
                            String str0 = str.replace(":", "");
                            String str1 = str0.replaceAll("\\s+","");
                            str1+=fileName;

                            String root = getServletContext().getRealPath("/");
                            File path = new File(root + "/images");
                            if (!path.exists())
                            {
                                boolean status = path.mkdirs();
                            }

                            File uploadedFile = new File(path + "/" + str1);
                            filePath = uploadedFile.getCanonicalPath();
                            nazivF = uploadedFile.getName();
                            
                            if(!item.getName().equals(""))
                            {
                                item.write(uploadedFile);
                            }
                    }
                    else
                    {
                        podaci.add(item.getString());
                    }
                }
            }
            catch (FileUploadException e)
            {
                String errormsg = e.getMessage();
                request.setAttribute("errormsg", errormsg);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            catch (Exception e) {
                String errormsg = e.getMessage();
                request.setAttribute("errormsg", errormsg);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        
        String imgpa = "images/";
        
        if(!(nazivF.equals("images")))
        {
            
            imgpa+=nazivF;
        }
        String socket1="";
        String socket2="";
        
        
        for(int a = 0;a<podaci.size();a++)
        {
            if(podaci.get(a)==null || (podaci.get(a).equals("")))
            {
                response.sendRedirect("ServletAdminIzmenaKonfiguracije?polja=da&id="+podaci.get(12));
                return;
            }
        }
                try
                {
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction tr = s.beginTransaction();
                    
                    if(imgpa.length()==21)
                    {
                        /*
                        response.sendRedirect("ServletAdminIzmenaKonfiguracije?slika=da&id="+podaci.get(10));
                        */
                        imgpa = podaci.get(13);
                        /*
                        return;
                        */
                    }
                    else
                    {
                        SQLQuery q=s.createSQLQuery("SELECT m.socket as socketm,p.socket as socketp from maticna m, procesori p where m.maticnaID='"+podaci.get(3)+"' and p.procesorID='"+podaci.get(5)+"'");
                        List<Object[]> socket = q.list();
                        for(Object[] o:socket)
                        {
                            socket1 = (String)o[0];
                            socket2 =(String)o[1];
                        }
                        tr.commit();
                    }
                    
                    s.close();
                    if(!socket1.equals(socket2))
                    {
                        response.sendRedirect("ServletAdminIzmenaKonfiguracije?socket=da&id="+podaci.get(12));
                        return;
                    }
                }
                catch(HibernateException ex)
                {
                    String errormsg = ex.getMessage();
                    request.setAttribute("errormsg", errormsg);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                
                if(Integer.parseInt((podaci.get(9)))>= Integer.parseInt((podaci.get(7))))
                {
                    response.sendRedirect("ServletAdminIzmenaKonfiguracije?lowpsu=da&id="+podaci.get(12));
                    return;
                }
        
                try
                {
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction tr = s.beginTransaction();
                    
                    if(imgpa.length()==21)
                    {
                        request.setAttribute("praznaSlika", "Morate izabrati sliku!");
                        response.sendRedirect("ServletAdminIzmenaKonfiguracije?slika=da&id="+podaci.get(12));
                        return;
                    }
                    else
                    {/*
                        SQLQuery q=s.createSQLQuery("insert into konfiguracije(gpuID,kucisteID,kulerID,maticnaID,memorijaID,procesorID,psuID,ramID,opis,imgPath,korisnikID)"
                            + "VALUES('"+podaci.get(0)+"', '"+podaci.get(1)+"', '"+podaci.get(2)+"', '"+podaci.get(3)+"', '"+podaci.get(4)+"','"+podaci.get(5)+"','"+podaci.get(6)+"','"+podaci.get(7)+"','"+podaci.get(8)+"','"+imgpa+"','"+podaci.get(9)+"')");
                        */
                        SQLQuery q1=s.createSQLQuery("update konfiguracije set gpuID = '"+podaci.get(0)+"', kucisteID='"+podaci.get(1)+"', kulerID='"+podaci.get(2)+"', maticnaID='"+podaci.get(3)+"', memorijaID='"+podaci.get(4)+"', procesorID='"+podaci.get(5)+"', psuID='"+podaci.get(6)+"', ramID='"+podaci.get(8)+"', opis='"+podaci.get(10)+"', imgPath='"+imgpa+"', korisnikID='"+podaci.get(11)+"' where konfiguracijaID = '"+podaci.get(12)+"'");
                        q1.executeUpdate();
                        tr.commit();
                    }
                    
                    s.close();
                    response.sendRedirect("ServletAdminPrikazKonfiguracija");
                    return;
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
