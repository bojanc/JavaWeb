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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.HibernateException;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Bojan
 */
public class ServletRegistracija extends HttpServlet {

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
        
        HttpSession sesija = request.getSession();
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

                        item.write(uploadedFile);
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
                request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                request.getRequestDispatcher("registracija.jsp").forward(request, response);
                return;
            }
            else
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
                        if(row.getUsername().equals(podaci.get(2)))
                        {
                            request.setAttribute("zauzetoIme", "Korisničko ime je zauzeto.");
                            request.getRequestDispatcher("registracija.jsp").forward(request, response);
                            return;
                        }
                    }
                }
                catch(HibernateException ex)
                {
                    String errormsg = ex.getMessage();
                    request.setAttribute("errormsg", errormsg);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                
                
                try
                {
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction tr = s.beginTransaction();

                    SQLQuery q=s.createSQLQuery("insert into korisnici(imgPath,ime,prezime,username,password,uloga)"
                            + "VALUES('"+imgpa+"', '"+podaci.get(0)+"', '"+podaci.get(1)+"', '"+podaci.get(2)+"', '"+podaci.get(3)+"', 'klijent')");
                    q.executeUpdate();
                    tr.commit();
                    s.close();
                    
                    Korisnici korisnik = new Korisnici();
                    korisnik.setIme(podaci.get(0));
                    korisnik.setPrezime(podaci.get(1));
                    korisnik.setUsername(podaci.get(2));
                    korisnik.setPassword(podaci.get(3));
                    korisnik.setUloga("klijent");
                    korisnik.setImgPath(imgpa);
                    
                    sesija.setAttribute("korisnik", korisnik);
                    
                    response.sendRedirect("index.jsp");
                    return;
                }
                catch(HibernateException ex)
                {
                    String errormsg = ex.getMessage();
                    request.setAttribute("errormsg", errormsg);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
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
