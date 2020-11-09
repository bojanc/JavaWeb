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
public class ServletAdminDodajIgricu extends HttpServlet {

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
        if(korisnik.getUloga().equals("Admin"))
        {
        
        
            ArrayList<Procesori> cpu = new ArrayList<Procesori>();
            ArrayList<Gpu> gpu = new ArrayList<Gpu>();
            ArrayList<Ram> ram = new ArrayList<Ram>();

            String poruka = "";
            String porukaPolja = "";

            if(request.getParameter("slika")!=null)
            {
                poruka = (String)request.getParameter("slika");
            }

            if(request.getParameter("polja")!=null)
            {
                porukaPolja = (String)request.getParameter("polja");
            }

            try
            {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction tr = s.beginTransaction();

                SQLQuery q = s.createSQLQuery("select * from procesori").addEntity(Procesori.class);
                List<Procesori> rows = q.list();

                SQLQuery q1=s.createSQLQuery("select * from gpu").addEntity(Gpu.class);
                List<Gpu> rows1 = q1.list();

                SQLQuery q2=s.createSQLQuery("select * from ram").addEntity(Ram.class);
                List<Ram> rows2 = q2.list();




                for(Procesori row:rows)
                {
                    cpu.add(new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath()));
                }

                for(Gpu row:rows1)
                {
                    gpu.add(new Gpu(row.getGpuId(),row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getTdp(),row.getImgPath()));
                }

                for(Ram row:rows2)
                {
                    ram.add(new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getTdp(),row.getImgPath()));
                }

                if(!poruka.equals(""))
                {
                    request.setAttribute("praznaSlika", "Morate izabrati sliku!");
                }

                if(!porukaPolja.equals(""))
                {
                    request.setAttribute("praznapolja", "Morate popuniti sva polja!");
                }


                request.setAttribute("cpu", cpu);
                request.setAttribute("gpu", gpu);
                request.setAttribute("ram", ram);

                s.close();
                request.getRequestDispatcher("AdminDodajIgricu.jsp").forward(request, response);
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
            response.sendRedirect("ServletIndex");
            return;
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
        
        
        
        for(int a = 0;a<podaci.size();a++)
        {
            if(podaci.get(a)==null || (podaci.get(a).equals("")))
            {
                response.sendRedirect("ServletAdminDodajIgricu?polja=da");
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
                        response.sendRedirect("ServletAdminDodajIgricu?slika=da");
                        return;
                    }
                    else
                    {
                        SQLQuery q=s.createSQLQuery("insert into igrice(igricaNaziv,cpuPreID,gpuPreID,ramPreID,imgPath)"
                            + "VALUES('"+podaci.get(0)+"', '"+podaci.get(1)+"', '"+podaci.get(2)+"', '"+podaci.get(3)+"', '"+imgpa+"')");
                        q.executeUpdate();
                        tr.commit();
                    }
                    
                    s.close();
                    response.sendRedirect("ServletAdminPrikazIgrica");
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
