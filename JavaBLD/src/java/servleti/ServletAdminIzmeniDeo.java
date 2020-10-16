/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import entity.Gpu;
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
public class ServletAdminIzmeniDeo extends HttpServlet {

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
        
        
        String deo = (String)request.getParameter("deo");
        String naziv = (String)request.getParameter("naziv");
        int id = Integer.parseInt((String)request.getParameter("id"));
        
        Gpu gpu = new Gpu();
        Kuciste kuciste = new Kuciste();
        Kuleri kuler = new Kuleri();
        Maticna maticna = new Maticna();
        Psu psu = new Psu();
        Ram ram = new Ram();
        Procesori cpu = new Procesori();
        Memorija memorija= new Memorija();
        
        if(id!=0 && !(deo.equals("")) && !(naziv.equals("")))
        {
            try
            {
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction tr = s.beginTransaction();
                
                if(deo.equals("gpu"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Gpu.class);
                    List<Gpu> rows = q.list();

                    for(Gpu row:rows)
                    {
                        gpu = new Gpu(row.getGpuId(), row.getNaziv(),row.getMemorija(),row.getCoreCl(),row.getBoostCl(),row.getTdp(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("gpu", gpu);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniGpu.jsp").forward(request, response);
                }
                else if(deo.equals("kuciste"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Kuciste.class);
                    List<Kuciste> rows = q.list();

                    for(Kuciste row:rows)
                    {
                        kuciste = new Kuciste(row.getKucisteId(),row.getNaziv(),row.getDimenzije(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("kuciste", kuciste);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniKuciste.jsp").forward(request, response);
                }
                else if(deo.equals("kuleri"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Kuleri.class);
                    List<Kuleri> rows = q.list();

                    for(Kuleri row:rows)
                    {
                        kuler = new Kuleri(row.getKulerId(),row.getNaziv(),row.getRpm(),row.getBuka(),row.getRadijatorDim(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("kuler", kuler);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniKuler.jsp").forward(request, response);
                }
                else if(deo.equals("maticna"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Maticna.class);
                    List<Maticna> rows = q.list();

                    for(Maticna row:rows)
                    {
                        maticna = new Maticna(row.getMaticnaId(),row.getNaziv(),row.getSocket(),row.getVelicina(),row.getMaxRam(),row.getMemSlots(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("maticna", maticna);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniMaticnu.jsp").forward(request, response);
                }
                else if(deo.equals("memorija"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Memorija.class);
                    List<Memorija> rows = q.list();

                    for(Memorija row:rows)
                    {
                        memorija = new Memorija(row.getMemorijaId(),row.getNaziv(),row.getKapacitet(),row.getTip(),row.getCache(),row.getDimenzije(),row.getInterfejs(),row.getTdp(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("memorija", memorija);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniMemoriju.jsp").forward(request, response);
                }
                else if(deo.equals("procesori"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Procesori.class);
                    List<Procesori> rows = q.list();

                    for(Procesori row:rows)
                    {
                        cpu = new Procesori(row.getProcesorId(),row.getBrojJezgara(),row.getFrekvencija(),row.getBoost(),row.getTdp(),row.getIgpu(),row.getNaziv(),row.getSocket(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("cpu", cpu);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniCpu.jsp").forward(request, response);
                }
                else if(deo.equals("psu"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Psu.class);
                    List<Psu> rows = q.list();

                    for(Psu row:rows)
                    {
                        psu = new Psu(row.getPsuId(),row.getNaziv(),row.getEfikasnost(),row.getJacina(),row.getModularnost(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("psu", psu);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniPsu.jsp").forward(request, response);
                }
                else if(deo.equals("ram"))
                {
                    SQLQuery q=s.createSQLQuery("select * from "+deo+" where "+naziv+"='"+id+"'").addEntity(Ram.class);
                    List<Ram> rows = q.list();

                    for(Ram row:rows)
                    {
                        ram = new Ram(row.getRamId(),row.getNaziv(),row.getBrzina(),row.getCasLat(),row.getTdp(),row.getImgPath());
                    }

                    request.setAttribute("deo", deo);
                    request.setAttribute("ram", ram);
                    if(request.getParameter("prazna")!=null)
                    {
                       if(request.getParameter("prazna").equals("da"))
                        {
                            request.setAttribute("praznaPolja", "Morate popuniti sva polja!");
                        } 
                    }
                    s.close();
                    request.getRequestDispatcher("AdminIzmeniRam.jsp").forward(request, response);
                }
            }
            catch(HibernateException ex)
            {
                String errormsg = ex.getMessage();
                request.setAttribute("errormsg", errormsg);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
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
        
        String deo = (String)request.getParameter("deo");
        String naziv = (String)request.getParameter("naziv");
        int id = Integer.parseInt((String)request.getParameter("id"));
        
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
        
        
        if(deo.equals("gpu"))
        {
            
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    //request.getRequestDispatcher("AdminIzmeniGpu.jsp").forward(request, response);
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                    SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', coreCl='"+podaci.get(1)+"', boostCl='"+podaci.get(2)+"',TDP='"+podaci.get(3)+"', memorija='"+podaci.get(4)+"'"
                        + "where "+naziv+"='"+id+"'");
                    q.executeUpdate();
                    tr.commit();
                }
                else
                {
                    SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', coreCl='"+podaci.get(1)+"', boostCl='"+podaci.get(2)+"',TDP='"+podaci.get(3)+"', memorija='"+podaci.get(4)+"'"
                        + "where "+naziv+"='"+id+"'");
                    q.executeUpdate();
                    tr.commit();
                }

                s.close();
                response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                return;
            }
            catch(HibernateException ex)
            {
                String errormsg = ex.getMessage();
                request.setAttribute("errormsg", errormsg);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            
        }
        else if(deo.equals("kuciste"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', dimenzije='"+podaci.get(1)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', dimenzije='"+podaci.get(1)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                        return;
                    }
                    catch(HibernateException ex)
                    {
                        String errormsg = ex.getMessage();
                        request.setAttribute("errormsg", errormsg);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
        }
        else if(deo.equals("kuleri"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', rpm='"+Integer.parseInt(podaci.get(1))+"', buka='"+podaci.get(2)+"', radijatorDim='"+podaci.get(3)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', rpm='"+Integer.parseInt(podaci.get(1))+"', buka='"+podaci.get(2)+"', radijatorDim='"+podaci.get(3)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                        return;
                    }
                    catch(HibernateException ex)
                    {
                        String errormsg = ex.getMessage();
                        request.setAttribute("errormsg", errormsg);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
        }
        else if(deo.equals("maticna"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', socket='"+podaci.get(1)+"', velicina='"+podaci.get(2)+"', maxRam='"+ Integer.parseInt(podaci.get(3))+"', memSlots='"+ Integer.parseInt(podaci.get(4))+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', socket='"+podaci.get(1)+"', velicina='"+podaci.get(2)+"', maxRam='"+ Integer.parseInt(podaci.get(3))+"', memSlots='"+ Integer.parseInt(podaci.get(4))+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                        return;
                    }
                    catch(HibernateException ex)
                    {
                        String errormsg = ex.getMessage();
                        request.setAttribute("errormsg", errormsg);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
        }
        else if(deo.equals("memorija"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', kapacitet='"+podaci.get(1)+"', tip='"+podaci.get(2)+"', cache='"+podaci.get(3)+"', dimenzije='"+podaci.get(4)+"', interfejs='"+podaci.get(5)+"', TDP='"+podaci.get(6)+"' "
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', kapacitet='"+podaci.get(1)+"', tip='"+podaci.get(2)+"', cache='"+podaci.get(3)+"', dimenzije='"+podaci.get(4)+"', interfejs='"+podaci.get(5)+"', TDP='"+podaci.get(6)+"' "
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                        return;
                    }
                    catch(HibernateException ex)
                    {
                        String errormsg = ex.getMessage();
                        request.setAttribute("errormsg", errormsg);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
        } 
        else if(deo.equals("procesori"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', brojJezgara='"+ Integer.parseInt(podaci.get(1))+"',socket='"+podaci.get(2)+"', frekvencija='"+podaci.get(3)+"', boost='"+podaci.get(4)+"', tdp='"+podaci.get(5)+"', iGPU='"+podaci.get(6)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', brojJezgara='"+ Integer.parseInt(podaci.get(1))+"',socket='"+podaci.get(2)+"', frekvencija='"+podaci.get(3)+"', boost='"+podaci.get(4)+"', tdp='"+podaci.get(5)+"', iGPU='"+podaci.get(6)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                        return;
                    }
                    catch(HibernateException ex)
                    {
                        String errormsg = ex.getMessage();
                        request.setAttribute("errormsg", errormsg);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
        }
        else if(deo.equals("psu"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', efikasnost='"+ podaci.get(1)+"', jacina='"+podaci.get(2)+"', modularnost='"+podaci.get(3)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', efikasnost='"+ podaci.get(1)+"', jacina='"+podaci.get(2)+"', modularnost='"+podaci.get(3)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
                        return;
                    }
                    catch(HibernateException ex)
                    {
                        String errormsg = ex.getMessage();
                        request.setAttribute("errormsg", errormsg);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
        }
        else if(deo.equals("ram"))
        {
            for(int a = 0;a<podaci.size();a++)
            {
                if(podaci.get(a)==null || (podaci.get(a).equals("")))
                {
                    response.sendRedirect("ServletAdminIzmeniDeo?id="+id+"&deo="+deo+"&naziv="+naziv+"&prazna=da");
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
                            SQLQuery q=s.createSQLQuery("update "+deo+" set naziv='"+podaci.get(0)+"', brzina='"+ podaci.get(1)+"', casLat='"+Integer.parseInt(podaci.get(2))+"', TDP='"+podaci.get(3)+"' "
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }
                        else
                        {
                            SQLQuery q=s.createSQLQuery("update "+deo+" set imgPath='"+imgpa+"', naziv='"+podaci.get(0)+"', brzina='"+ podaci.get(1)+"', casLat='"+Integer.parseInt(podaci.get(2))+"', TDP='"+podaci.get(3)+"'"
                                + "where "+naziv+"='"+id+"'");
                            q.executeUpdate();
                            tr.commit();
                        }

                        s.close();
                        response.sendRedirect("ServletAdminPrikazDelova?deo="+deo);
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
