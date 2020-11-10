<%@page import="entity.Igrice"%>
<%@page import="entity.Podkomentari"%>
<%@page import="entity.Komentari"%>
<%@page import="entity.Konfiguracije"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="javax.servlet.http.*" %>
<%@page import="entity.Korisnici" %>
<%@page import="java.util.Random" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
                                            <h1><a href="Pocetna" style="color:white;font-size: 20px;"><img style="filter: drop-shadow(1px 1px 1px rgba(46,186,174,1));" class="logo" src="images/logo2.png" width="50" height="50"></a></h1>
                                            <style>
                                                .logo:hover{
                                                    filter: drop-shadow(3px 4px 11px rgba(46,186,174,1)) !important;
                                                }
                                            </style>
						<nav class="links">
							<ul>
                                                            <%
                                                                    HttpSession sesija = request.getSession();
                                                                    Korisnici korisnik = (Korisnici)sesija.getAttribute("korisnik");
                                                                    if(korisnik!=null)
                                                                    {
                                                                    if(!korisnik.getUloga().equals("Admin"))
                                                                    {
                                                            %>
								<li><a href="PrikazDelova.jsp" style="color: #ffffff">Računarski delovi</a></li>
                                                                <%
                                                                }else{
                                                                %>
                                                                <li><a href="AdminPrikazDelova.jsp" style="color: #ffffff">Računarski delovi</a></li>
                                                                <% }}else{
                                                                %>
                                                                <li><a href="PrikazDelova.jsp" style="color: #ffffff">Računarski delovi</a></li>
                                                                <%}%>
								<li><a href="Igrice" style="color: #ffffff">Igrice</a></li>
								<li><a href="ServletAdminPrikazKonfiguracija" style="color: #ffffff">Konfiguracije</a></li>
                                                                
                                                                
                                                                    <%
                                                                        
                                                                        if(korisnik!=null)
                                                                        {
                                                                            %> 
                                                                            <li><a href="ServletMojeKonfiguracije?id=<%= korisnik.getKorisnikId() %>" style="color: #ffffff">Moje konfiguracije</a></li>
                                                                            <li style="color: #d4d4d6;">
                                                                            Dobro došli <%= korisnik.getUsername()%>
                                                                            
                                                                            <img src="<%= korisnik.getImgPath()  %>" height="40" width="40" style="border-radius: 50%;vertical-align: middle;">

                                                                    <%
                                                                    }

                                                                    %>
                                                                </li>
							</ul>
                                                    
						</nav>
						<nav class="main">
							<ul>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section style="text-align:center;padding:0;">
                                                            <img src="images/logo2.png" width="250" height="225" style="filter: drop-shadow(1px 1px 5px rgba(46,186,174,1));">
                                                            <h1 style="color:#2ebaae;font-size: 30px;">BLD</h1>
							</section>
                                                                    <%
                                                                        if(korisnik!=null)
                                                                        {%>
                                                        <section>
								<ul class="links">
                                                <%
                                                                            if(korisnik.getUloga().equals("Admin"))
                                                                            {
                                                                    %>
						<!-- Links -->
							
                                                                    
									<li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazKorisnika">
                                                                                    <p style="font-size:0.8em;">Korisnici</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
                                                                            <a href="ServletIzmenaProfila?id=<%= korisnik.getKorisnikId() %>">
                                                                                    <p style="font-size:0.8em;">Vaš profil</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="AdminPrikazDelova.jsp">
                                                                                    <p style="font-size:0.8em;">Računarski delovi</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazIgrica">
                                                                                    <p style="font-size:0.8em;">Igrice</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazKonfiguracija">
                                                                                    <p style="font-size:0.8em;">Konfiguracije</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazDelovaKonfig">
                                                                                    <p style="font-size:0.8em;">Dodaj konfiguraciju</p>
										</a>
									</li>
                                                                        <%
                                                                                }

                                                                                if(korisnik.getUloga().equals("Urednik"))
                                                                                {%>
                                                                        <li style="color: #d4d4d6;">
                                                                            <a href="ServletIzmenaProfila?id=<%= korisnik.getKorisnikId() %>">
                                                                                <p style="font-size:0.8em;">Vaš profil</p>
                                                                            </a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletPrikazPorukaKorisnika">
                                                                                    <p style="font-size:0.8em;">Poruke</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazKonfiguracija">
                                                                                    <p style="font-size:0.8em;">Konfiguracije</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazDelovaKonfig">
                                                                                    <p style="font-size:0.8em;">Dodaj konfiguraciju</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletUrednikOdobravanjeKonfig">
                                                                                    <p style="font-size:0.8em;">Odobri konfiguraciju</p>
										</a>
									</li>
                                                                                <%}
                                                                                if(korisnik.getUloga().equals("Klijent"))
                                                                                {%>
                                                                        <li style="color: #d4d4d6;">
                                                                            <a href="ServletIzmenaProfila?id=<%= korisnik.getKorisnikId() %>">
                                                                                <p style="font-size:0.8em;">Vaš profil</p>
                                                                            </a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletPrikazPorukaUrednika?id=<%= korisnik.getKorisnikId() %>">
                                                                                    <p style="font-size:0.8em;">Poruke</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazKonfiguracija">
                                                                                    <p style="font-size:0.8em;">Konfiguracije</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletAdminPrikazDelovaKonfig">
                                                                                    <p style="font-size:0.8em;">Dodaj konfiguraciju</p>
										</a>
									</li>
                                                                            
								
                                                                            <%}%>
                                                        </ul>
							</section>
                                                                        <%
                                                                            }
                                                                        %>
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
                                                        
                                                        <style>
                                    .modal {
                                        display: none; 
                                        position: fixed; 
                                        z-index: 1; 
                                        left: 0;
                                        top: 0;
                                        width: 100%; 
                                        height: 100%; 
                                        overflow: auto; 
                                        background-color: rgb(0,0,0); 
                                        background-color: rgba(0,0,0,0.4); 
                                      }

                                      
                                      .modal-content {
                                        background-color: #fefefe;
                                        margin: 15% auto; 
                                        padding: 30px;
                                        border: 2px solid #2ebaae;
                                        width: 17.5%; 
                                        text-align: center;
                                      }

                                      
                                      .close {
                                        text-align: center;
                                        color: #aaa;
                                        font-size: 32px;
                                        font-weight: bold;
                                        float:right;
                                      }

                                      .close:hover,
                                      .close:focus {
                                        color: black;
                                        text-decoration: none;
                                        cursor: pointer;
                                      }
                                </style>
                                
                                <%
                                    ArrayList<Konfiguracije> konfig = (ArrayList<Konfiguracije>)request.getAttribute("konfig");
                                    ArrayList<Komentari> komentar = new ArrayList<Komentari>();
                                    ArrayList<Igrice> igrice = new ArrayList<Igrice>();
                                    if(((ArrayList<Komentari>)request.getAttribute("komentar")).size()>0)
                                    {
                                        komentar = (ArrayList<Komentari>)request.getAttribute("komentar");
                                    }
                                    
                                    if(((ArrayList<Igrice>)request.getAttribute("igrice")).size()>0)
                                    {
                                        igrice = (ArrayList<Igrice>)request.getAttribute("igrice");
                                    }

                                    ArrayList<Podkomentari> podkom = (ArrayList<Podkomentari>)request.getAttribute("podkom");
                                %>

                                
                                <div id="myModalP" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeP">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Izmene su uspešno sačuvane!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalP = document.getElementById("myModalP");
                                    var spanP = document.getElementById("closeP");
                                    <%
                                        if(request.getAttribute("uspesno")!=null)
                                        {
                                    %>
                                    $(document).ready(function(){
                                        modalP.style.display = "block";
                                    })
                                    <%
                                        }
                                    %>
                                        spanP.onclick = function() {
                                  modalP.style.display = "none";
                                }
                                </script>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
                                                <%
                                                    if(!konfig.isEmpty())
                                                    {
                                                        for(int a = 0; a<3;a++)
                                                        {
                                                    
                                                %>
							<article class="post">
								<header>
									<div class="meta" style="width: 40%;height: 10%;padding:10px;text-align: center;margin-left: 70%;">
                                                                            <p class="name" style="display: inline-block;margin-right: 15px;"><%= konfig.get(a).getKorisnici().getIme() %> <%= konfig.get(a).getKorisnici().getPrezime()%></p><img src="<%= konfig.get(a).getKorisnici().getImgPath()%>" alt="" height="60" width="60" style="border-radius: 50%;vertical-align: middle;">
									</div>
								</header>
                                                                        <div style="display:inline-block;">
                                                                            <img src="<%= konfig.get(a).getImgPath() %>"  alt="" heigth="220" width="220" />
                                                                            
                                                                        </div>
                                                                        <div style="display:inline-block;float:right;width: 50%;">
                                                                            <p style="margin-bottom:0;"><b>Grafička kartica:</b> &nbsp; <%= konfig.get(a).getGpu().getNaziv() %></p>
                                                                            <p style="margin-bottom:0;"><b>Procesor:</b> &nbsp; <%= konfig.get(a).getProcesori().getNaziv() %></p>
                                                                            <p style="margin-bottom:0;"><b>RAM:</b> &nbsp; <%= konfig.get(a).getRam().getNaziv() %></p>
                                                                            <p style="margin-bottom:0;"><b>Matična ploča:</b> &nbsp; <%= konfig.get(a).getMaticna().getNaziv() %></p>
                                                                            <p style="margin-bottom:0;"><b>Napajanje:</b> &nbsp; <%= konfig.get(a).getPsu().getNaziv() %></p>
                                                                            <p style="margin-bottom:0;"><b>Kučište:</b> &nbsp; <%= konfig.get(a).getKuciste().getNaziv() %></p>
                                                                            <p style="margin-bottom:0;"><b>Kuler:</b> &nbsp; <%= konfig.get(a).getKuleri().getNaziv() %></p>
                                                                        </div>
                                                                        <br><br>
								<footer style="width:100%;">
									<ul class="actions">
                                                                            <li><a href="ServletKonfigDetalji?id=<%= konfig.get(a).getKonfiguracijaId() %>" class="button">Detalji</a></li>
									</ul>
									<ul class="stats">
                                                                            <li><a href="ServletPrikazKomentara?id=<%= konfig.get(a).getKonfiguracijaId() %>" class="icon solid fa-comment" style="font-size:150% !important;">
                                                                                <% int x = 0;
                                                                                        for(Komentari kom:komentar)
                                                                                        {
                                                                                            if(kom.getKonfiguracije().getKonfiguracijaId() == konfig.get(a).getKonfiguracijaId())
                                                                                            {
                                                                                                x++;
                                                                                                
                                                                                                for(Podkomentari pkom:podkom)
                                                                                                {
                                                                                                    if(pkom.getKomentari().getKomentarId() == kom.getKomentarId())
                                                                                                    {
                                                                                                        x++;
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            
                                                                                        }
                                                                                        
                                                                                        
                                                                                    %><%= x %>
                                                                                </a></li>
									</ul>
								</footer>
							</article>
                                                        <%
                                                            }}
                                                        %>

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<header>
                                                                    <h2><img style="margin-left:-90px;" src="images/logo.png"></h2>
									<p style="text-align:center;">Kreirajte svoju konfiguraciju</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<div class="mini-posts">

									<!-- Mini Post -->
                                                                        <%
                                                                            if(!igrice.isEmpty())
                                                                            {
                                                                                for(Igrice pom:igrice)
                                                                                {
                                                                                    
                                                                                
                                                                                
                                                                                
                                                                        %>
                                                                                
                                                                                <article class="mini-post" style="box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.75);border:none;width: 80%;margin:0 auto; margin-bottom: 30px;">
                                                                                    <header style="text-align:center;padding:0;padding-top: 20px;">
                                                                                        <h3 style="width:100%;"><%= pom.getIgricaNaziv() %></h3>
                                                                                        
                                                                                    </header>
                                                                                        <img src="<%= pom.getImgPath() %>"  alt="" height="350"/>
										</article>
                                                                        <%
                                                                            }}
                                                                        %>
								</div>
							</section>

						<!-- About -->
							<section class="blurb">
								<h2>O nama</h2>
								<p>BLD Vam omogućava da sklopite konfiguraciju po svojoj želji, da kreirate svoju konfiguraciju i da testirate njene sposobosti u nekim od igricama.</p>
								
							</section>

						<!-- Footer -->
							<section id="footer">
								<p class="copyright">&copy; BLD by Bojan Ćulibrk</p>
							</section>

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