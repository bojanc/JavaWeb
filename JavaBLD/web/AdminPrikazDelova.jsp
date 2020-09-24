<%@page import="entity.Ram"%>
<%@page import="entity.Psu"%>
<%@page import="entity.Procesori"%>
<%@page import="entity.Memorija"%>
<%@page import="entity.Maticna"%>
<%@page import="entity.Kuleri"%>
<%@page import="entity.Kuciste"%>
<%@page import="entity.Gpu"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="javax.servlet.http.*" %>
<%@page import="entity.Korisnici" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Single - Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="single is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="index.jsp" style="color:white;">BLD</a></h1>
						<nav class="links">
							<ul>
                                                            <li><a href="#" style="color: #ffffff">Lorem</a></li>
								<li><a href="#" style="color: #ffffff">Ipsum</a></li>
								<li><a href="#" style="color: #ffffff">Feugiat</a></li>
								<li><a href="#" style="color: #ffffff">Tempus</a></li>
								<li><a href="#" style="color: #ffffff">Adipiscing</a></li>
                                                                <li style="color: #d4d4d6;">
                                                                    <%
                                                                        HttpSession sesija = request.getSession();
                                                                        Korisnici korisnik = (Korisnici)sesija.getAttribute("korisnik");
                                                                        if(korisnik!=null)
                                                                        {
                                                                            %> Dobro došli <%= korisnik.getUsername()%>
                                                                            
                                                                            <img src="<%= korisnik.getImgPath()  %>" height="40" width="40" style="border-radius: 50%;vertical-align: middle;">

                                                                    <%
                                                                    }

                                                                    %>
                                                                </li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
                                                                    <%
                                                                        if(korisnik!=null)
                                                                        {
                                                                            if(korisnik.getUloga().equals("admin"))
                                                                            {
                                                                    %>
									<li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazKorisnika">
                                                                                    <p style="font-size:0.8em;">Korisnici</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="#">
                                                                                    <p style="font-size:0.8em;">Računarski delovi</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="#">
                                                                                    <p style="font-size:0.8em;">Software i igrice</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="#">
                                                                                    <p style="font-size:0.8em;">Konfiguracije</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="#">
                                                                                    <p style="font-size:0.8em;">Korisničke konfiguracije</p>
										</a>
									</li>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
								</ul>
							</section>

						<!-- Actions -->
							<section>
                                                            <%
                                                            if(korisnik==null){
                                                            %>
								<ul class="actions stacked">
									<li><a href="prijava.jsp" class="button large fit"style="color:#fff;">Prijava</a></li>
								</ul>
                                                            
                                                                <ul class="actions stacked">
									<li><a href="registracija.jsp" class="button large fit"style="color:#fff;">Registracija</a></li>
								</ul>
                                                                <%
                                                                }
                                                                %>
                                                                <%
                                                                if(korisnik!=null){
                                                                %>
                                                                <ul class="actions stacked">
									<li><a href="ServletOdjava" class="button large fit"style="color:#fff;">Odjava</a></li>
								</ul>
                                                                <%
                                                                }
                                                                %>
							</section>

					</section>
                                                        
                                                        <%
                                                            ArrayList<Korisnici> kl = (ArrayList<Korisnici>)request.getAttribute("korisnici");
                                                            String deo = "";
                                                            if(request.getAttribute("deo")!=null)
                                                            {
                                                                deo = (String)request.getAttribute("deo");
                                                            }
                                                        %>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header style="margin: auto; text-align: center; padding-left: 60px;">
                                                                        <h2>Spisak delova</h2>
                                                                        <a href="AdminDodajDeo.jsp" class="button" style="margin-left: 70%; padding-bottom: 10px;">DODAJ</a>
                                                                        
                                                                </header>
                                                            <form method="post" action="ServletAdminPrikazDelova">
                                                                <select name="deo" style="width:16%;margin-top: 10px;" onchange="this.form.submit()">
                                                                    <option value="" disabled selected="">Delovi</option>
                                                                    <optgroup>
                                                                        <option value="gpu" <% if(!(deo.equals(""))){if(deo.equals("gpu")){ %> selected<%}}%>>Grafičke kartice</option>
                                                                        <option value="kuciste" <% if(!(deo.equals(""))){if(deo.equals("kuciste")){ %> selected<%}}%>>Kučišta</option>
                                                                        <option value="kuleri" <% if(!(deo.equals(""))){if(deo.equals("kuleri")){ %> selected<%}}%>>Kuleri</option>
                                                                        <option value="maticna" <% if(!(deo.equals(""))){if(deo.equals("maticna")){ %> selected<%}}%>>Matične</option>
                                                                        <option value="memorija" <% if(!(deo.equals(""))){if(deo.equals("memorija")){ %> selected<%}}%>>Memorije</option>
                                                                        <option value="procesori" <% if(!(deo.equals(""))){if(deo.equals("procesori")){ %> selected<%}}%>>Procesori</option>
                                                                        <option value="psu" <% if(!(deo.equals(""))){if(deo.equals("psu")){ %> selected<%}}%>>Napajanja</option>
                                                                        <option value="ram" <% if(!(deo.equals(""))){if(deo.equals("ram")){ %> selected<%}}%>>RAM</option>
                                                                    </optgroup>
                                                                </select>
                                                            </form>
                                                            
                                                            <%
                                                                
                                                                
                                                                ArrayList<Gpu> gpu = new ArrayList<Gpu>();
                                                                ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
                                                                ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
                                                                ArrayList<Maticna> maticna = new ArrayList<Maticna>();
                                                                ArrayList<Memorija> memorija = new ArrayList<Memorija>();
                                                                ArrayList<Procesori> cpu = new ArrayList<Procesori>();
                                                                ArrayList<Psu> psu = new ArrayList<Psu>();
                                                                ArrayList<Ram> ram = new ArrayList<Ram>();
                                                                
                                                                if(!(deo.equals("")))
                                                                {
                                                                    if(deo.equals("gpu"))
                                                                    {
                                                                        gpu = (ArrayList<Gpu>)request.getAttribute("gpu");
                                                                    }
                                                                    else if(deo.equals("kuciste"))
                                                                    {
                                                                        kuciste = (ArrayList<Kuciste>)request.getAttribute("kuciste");
                                                                    }
                                                                    else if(deo.equals("kuleri"))
                                                                    {
                                                                        kuler = (ArrayList<Kuleri>)request.getAttribute("kuler");
                                                                    }
                                                                    else if(deo.equals("maticna"))
                                                                    {
                                                                        maticna = (ArrayList<Maticna>)request.getAttribute("maticna");
                                                                    }
                                                                    else if(deo.equals("memorija"))
                                                                    {
                                                                        memorija = (ArrayList<Memorija>)request.getAttribute("memorija");
                                                                    }
                                                                    else if(deo.equals("procesori"))
                                                                    {
                                                                        cpu = (ArrayList<Procesori>)request.getAttribute("cpu");
                                                                    }
                                                                    else if(deo.equals("psu"))
                                                                    {
                                                                        psu = (ArrayList<Psu>)request.getAttribute("psu");
                                                                    }
                                                                    else if(deo.equals("ram"))
                                                                    {
                                                                        ram = (ArrayList<Ram>)request.getAttribute("ram");
                                                                    }
                                                                }
                                                                
                                                            %>
                                                            
                                                            <%
                                                                if(!(deo.equals("")))
                                                                {
                                                                if(deo.equals("gpu"))
                                                                {
                                                                    if(gpu.size()>0)
                                                                    {
                                                                
                                                            %>
                                                            <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>GPU ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Memorija</th>
                                                                    <th>Core clock</th>
                                                                    <th>Boost Clock</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Gpu pom:gpu){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getGpuId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getMemorija()%></td>
                                                                        <td><%= pom.getCoreCl()%></td>
                                                                        <td><%= pom.getBoostCl()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getGpuId()%>&deo=<%= deo %>&naziv=gpuID"" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getGpuId() %>&deo=<%= deo %>&naziv=gpuID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema grafičkih kartica.</h2>
                                                                    <%
                                                                        }
                                                                        }
                                                                        else if(deo.equals("kuciste"))
                                                                        {
                                                                            if(kuciste.size()>0)
                                                                            {
                                                                    %>
                                                                     <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Kučište ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Dimenzije</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Kuciste pom:kuciste){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getKucisteId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getDimenzije()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getKucisteId()%>&deo=<%= deo %>&naziv=kucisteID"" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getKucisteId()%>&deo=<%= deo %>&naziv=kucisteID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema kučišta.</h2>
                                                                    
                                                                    
                                                                    <%
                                                                    }}
                                                                    else if(deo.equals("kuleri"))
                                                                    {
                                                                        if(kuler.size()>0)
                                                                        {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Kuler ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>RPM</th>
                                                                    <th>Buka</th>
                                                                    <th>Dimenzije</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Kuleri pom:kuler){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getKulerId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getRpm()%> rpm</td>
                                                                        <td><%= pom.getBuka()%></td>
                                                                        <td><%= pom.getRadijatorDim()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getKulerId()%>&deo=<%= deo %>&naziv=kulerID"class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getKulerId()%>&deo=<%= deo %>&naziv=kulerID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema kulera.</h2>
                                                                    
                                                                    <%
                                                                    }}
                                                                    else if (deo.equals("maticna"))
                                                                    {
                                                                    if(maticna.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Matična ploča ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Socket</th>
                                                                    <th>Veličina</th>
                                                                    <th>Podržan ram</th>
                                                                    <th>Ram slotovi</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Maticna pom:maticna){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getMaticnaId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getSocket()%></td>
                                                                        <td><%= pom.getVelicina()%></td>
                                                                        <td><%= pom.getMaxRam()%></td>
                                                                        <td><%= pom.getMemSlots()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getMaticnaId()%>&deo=<%= deo %>&naziv=maticnaID" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getMaticnaId()%>&deo=<%= deo %>&naziv=maticnaID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema matičnih ploča.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("memorija"))
                                                                    {
                                                                    if(memorija.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Memorija ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Kapacitet</th>
                                                                    <th>Tip</th>
                                                                    <th>Cache</th>
                                                                    <th>Dimenzije</th>
                                                                    <th>Interfejs</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Memorija pom:memorija){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getMemorijaId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getKapacitet()%></td>
                                                                        <td><%= pom.getTip()%></td>
                                                                        <td><%= pom.getCache()%></td>
                                                                        <td><%= pom.getDimenzije()%></td>
                                                                        <td><%= pom.getInterfejs()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getMemorijaId()%>&deo=<%= deo %>&naziv=memorijaID" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getMemorijaId()%>&deo=<%= deo %>&naziv=memorijaID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema memorija.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("procesori"))
                                                                    {
                                                                    if(cpu.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Procesor ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Broj jezgara</th>
                                                                    <th>Frekvencija</th>
                                                                    <th>Boost</th>
                                                                    <th>TDP</th>
                                                                    <th>iGPU</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Procesori pom:cpu){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getProcesorId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getBrojJezgara()%></td>
                                                                        <td><%= pom.getFrekvencija()%></td>
                                                                        <td><%= pom.getBoost()%></td>
                                                                        <td><%= pom.getTdp()%></td>
                                                                        <td><%= pom.getIgpu()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getProcesorId()%>&deo=<%= deo %>&naziv=procesorID" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getProcesorId()%>&deo=<%= deo %>&naziv=procesorID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema procesora.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("psu"))
                                                                    {
                                                                    if(psu.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Napajanje ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Efikasnost</th>
                                                                    <th>Jačina</th>
                                                                    <th>Modularnost</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Psu pom:psu){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getPsuId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getEfikasnost()%></td>
                                                                        <td><%= pom.getJacina()%></td>
                                                                        <td><%= pom.getModularnost()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getPsuId()%>&deo=<%= deo %>&naziv=psuID" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getPsuId()%>&deo=<%= deo %>&naziv=psuID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema napajanja.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("ram"))
                                                                    {
                                                                    if(ram.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>RAM ID</th>
                                                                    <th>Naziv</th>
                                                                    <th>Brzina</th>
                                                                    <th>CAS latency</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Ram pom:ram){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getRamId()%></td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getBrzina()%> MHz</td>
                                                                        <td><%= pom.getCasLat()%></td>
                                                                        <td>
                                                                            <a href="ServletAdminIzmeniDeo?id=<%= pom.getRamId()%>&deo=<%= deo %>&naziv=ramID" class="button">IZMENI</a>
                                                                            <a href="ServletAdminDeoObrisi?id=<%= pom.getRamId()%>&deo=<%= deo %>&naziv=ramID" class="button">OBRIŠI</a>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema RAM memorije.</h2>
                                                                    
                                                                    <%
                                                                        }}}
                                                                    %>
							</article>

					</div>

				<!-- Footer -->
					<section id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
							<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>