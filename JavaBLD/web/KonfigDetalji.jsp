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
								<li><a href="Konfiguracije" style="color: #ffffff">Konfiguracije</a></li>
                                                                
                                                                
                                                                    <%
                                                                        
                                                                        if(korisnik!=null)
                                                                        {
                                                                            %> 
                                                                            <li><a href="MojeKonfiguracije?id=<%= korisnik.getKorisnikId() %>" style="color: #ffffff">Moje konfiguracije</a></li>
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

						<!-- Links -->
							<%
                                                                        if(korisnik!=null)
                                                                        {%>
                                                        <section>
								<ul class="links">
                                                <%
                                                                            if(korisnik.getUloga().equals("Admin"))
                                                                            {
                                                                    %>
                                                                    
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
                                                                            <a href="IzmenaProfila?id=<%= korisnik.getKorisnikId() %>">
                                                                                <p style="font-size:0.8em;">Vaš profil</p>
                                                                            </a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="Poruke?id=<%= korisnik.getKorisnikId() %>">
                                                                                    <p style="font-size:0.8em;">Poruke</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="Konfiguracije">
                                                                                    <p style="font-size:0.8em;">Konfiguracije</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="DodajKonfiguraciju">
                                                                                    <p style="font-size:0.8em;">Dodaj konfiguraciju</p>
										</a>
									</li>
                                                                            
								
                                                                            <%}%>
                                                        </ul>
							</section>
                                                                        <%
                                                                            }
                                                                        %>
                                                                <%
                                                                    Konfiguracije konfig = (Konfiguracije)request.getAttribute("konfig");
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
							<article class="post" style="height:100%;">
								<header>
									<div class="title">
										<h2>
                                                                                    <%= konfig.getKorisnici().getIme() %> <%= konfig.getKorisnici().getPrezime()%> 
                                                                                    <img src="<%= konfig.getKorisnici().getImgPath() %>" height="60" width="60" style="border-radius: 50%;vertical-align: middle;"/>
                                                                                </h2>
										<p><%= konfig.getOpis() %></p>
									</div>
									<div class="meta" style="padding: 0;width: 20em;">
										<img src="<%= konfig.getImgPath() %>" style="width:100%;height: 100%;box-shadow: 3px 3px 6px 1px rgba(0,0,0,0.75);"/>
									</div>
								</header>
                                                                        
                                                                        <style>
                                                                                    #buttonobrisi:hover {
                                                                                        box-shadow: inset 0 0 0 1px red;
                                                                                        color: red !important;
                                                                                    }
                                                                        </style>
                                                                        <h3 style="width:25%;">Detalji o konfiguraciji</h3>
                                                                        <table style="width:40%;display: inline-block;float: left;">
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td  style='padding-bottom: 1px;'>
                                                                        <label style="margin-bottom:5px;">Procesor:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getProcesori().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td  style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">Grafička kartica:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getGpu().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">Matična ploča:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getMaticna().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">RAM:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getRam().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">Kuler:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getKuleri().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">Kučište:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getKuciste().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">Napajanje:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfig.getPsu().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td style='padding-bottom: 2px;'>
                                                                        <label style="margin-bottom:5px;">Memorija:</label>
                                                                        <p style="margin-bottom:2px;"><%= konfig.getMemorija().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                        </table>
                                                                                
                                                                        <table style="width:40%;display: inline-block;float: right;margin-right: 100px;">
                                                                            <tr style="background-color:transparent;border:none;"> 
                                                                                <td>

                                                                                </td>
                                                                                <td style="width:20%;">
                                                                                    <img class="slikedelova" src="<%= konfig.getMaticna().getImgPath() %>" alt="" style="float:left;" width="150" height="150">
                                                                                </td>
                                                                                <td>
                                                                                    <img  class="slikedelova" src="<%= konfig.getRam().getImgPath() %>" alt="" style="float:right;" width="150" height="150">
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="background-color:transparent;border:none;"> 
                                                                                <td style="width:20%;">
                                                                                    <img class="slikedelova" src="<%= konfig.getProcesori().getImgPath() %>" alt="" width="150" height="150">
                                                                                </td>
                                                                                <td style="padding:0;">
                                                                                    <img  class="slikedelova" src="<%= konfig.getKuciste().getImgPath() %>" alt="" width="250" height="250">
                                                                                </td>
                                                                                <td>
                                                                                    <img class="slikedelova" src="<%= konfig.getKuleri().getImgPath() %>" alt="" width="150" height="150">
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="background-color:transparent;border:none;"> 
                                                                                <td>
                                                                                    <img  class="slikedelova" src="<%= konfig.getPsu().getImgPath() %>" alt="" width="150" height="150">
                                                                                </td>
                                                                                <td>
                                                                                    <img  class="slikedelova" src="<%= konfig.getGpu().getImgPath() %>" alt="" width="150" height="150">
                                                                                </td>
                                                                                <td>
                                                                                    <img  class="slikedelova" src="<%= konfig.getMemorija().getImgPath() %>" alt="" width="150" height="150">
                                                                                </td>

                                                                            </tr>
                                                                        </table>
								
							</article>

					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>