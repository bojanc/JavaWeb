<%@page import="entity.Igricefps"%>
<%@page import="entity.Igrice"%>
<%@page import="entity.Porukeurednika"%>
<%@page import="entity.Porukekorisnika"%>
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
						<h1><a href="ServletIndex" style="color:white;font-size: 20px;">BLD</a></h1>
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
								<li><a href="ServletAdminPrikazIgrica" style="color: #ffffff">Igrice</a></li>
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
                                                                <%
                                                                    ArrayList<Igricefps> konfigfps1 = new ArrayList<Igricefps>();
                                                                    if(request.getAttribute("igricefps1")!=null)
                                                                    {
                                                                        konfigfps1 = (ArrayList<Igricefps>)request.getAttribute("igricefps1");
                                                                    }
                                                                    ArrayList<Igricefps> konfigfps = (ArrayList<Igricefps>)request.getAttribute("igricefps");
                                                                    ArrayList<Igrice> igrica = (ArrayList<Igrice>)request.getAttribute("igrica");
                                                                    
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
                                
                                <style>
                                            #buttonobrisi:hover {
                                                box-shadow: inset 0 0 0 1px red;
                                                color: red !important;
                                            }
                                </style>
                                
                                
                                
                                <style>
                                    .progress {
                                        background: #12131E;
                                        justify-content: flex-start;
                                        border-radius: 100px;
                                        align-items: center;
                                        position: relative;
                                        padding: 0 5px;
                                        display: flex;
                                        height: 30px;
                                        width: 35%;
                                        margin: 0 auto;
                                      }

                                      .progress-value {
                                        animation: load 3s normal forwards;
                                        box-shadow: 0 10px 40px -10px #2ebaae;
                                        border-radius: 100px;
                                        background: #2ebaae;
                                        height: 20px;
                                        width: 0;
                                      }

                                      
                                </style>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
                                                <article class="post" <% if(request.getAttribute("izabrano")==null){ %> style="height:110%;"<%}%>>
                                                            
								<header>
                                                                    <div class="title">
										<h2 style="display:inline-block; padding-top: 5%;">
                                                                                    Prosečan FPS za <%= igrica.get(0).getIgricaNaziv() %>
                                                                                </h2>
                                                                                
                                                                        <!--<a href="PosaljiPoruku.jsp" class="button" style="float: right;display:inline-block;">Pošalji poruku</a>-->
                                                                        <img src="<%= igrica.get(0).getImgPath() %>" alt="" width="250" heigh="350" style="display:inline-block;float:right;box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);"/>
                                                                        <h4 style="display:inline-block; padding-top: 5%;">*Igrica je testirana na 1920x1080 rezoluciji sa najzahtevnijim podešavanjima</h4>
									</div>
                                                                        
                                                                        
								</header>
                                                                        
                                                                        
                                                                        <form method='post' id='form' action='ServletFPSKonfig'>
                                                            <%
                                                                if(!konfigfps.isEmpty())
                                                                {
                                                            %>
                                                            <table style="width:25%;display:inline-block;float:left;">
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label>Izaberi konfiguraciju</label>
                                                                        <select name="konfig" id="sel" onchange="document.getElementById('form').submit();"  style="width:210%;">
                                                                        <optgroup>
                                                                            <option value="" disabled selected>Konfiguracije</option>
                                                                            <%
                                                                                    for(Igricefps pom:konfigfps){

                                                                            %>

                                                                            <option value="<%= pom.getKonfiguracije().getKonfiguracijaId() %>" <%if(request.getAttribute("konfig")!=null){if(request.getAttribute("konfig")==pom.getKonfiguracije().getKonfiguracijaId()){ %> selected <%}}%>> 
                                                                                GPU: <%= pom.getKonfiguracije().getGpu().getNaziv() %> CPU: <%= pom.getKonfiguracije().getProcesori().getNaziv() %> RAM: <%= pom.getKonfiguracije().getRam().getNaziv() %>
                                                                            </option>
                                                                            <%

                                                                                
                                                                                }
                                                                            %>
                                                                        </optgroup>
                                                                    </select><br>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    if(request.getAttribute("izabrano")!=null)
                                                                    {
                                                                        if(request.getAttribute("izabrano").equals("da"))
                                                                        {


                                                                %>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Procesor:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getProcesori().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Grafička kartica:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getGpu().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Matična ploča:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getMaticna().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">RAM:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getRam().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Kuler:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getKuleri().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Kučište:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getKuciste().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Napajanje:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getPsu().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label style="margin-bottom:5px;">Memorija:</label>
                                                                        <p style="margin-bottom:5px;"><%= konfigfps1.get(0).getKonfiguracije().getMemorija().getNaziv() %></p>
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <%
                                                                        }
                                                                    }
                                                                %>
                                                            </table>
                                                                       
                                                                            <input type="hidden" name="igricaID" value="<%= igrica.get(0).getIgricaId() %>">  
                                                                            
                                                    <%
                                                        if(request.getAttribute("izabrano")!=null)
                                                        {
                                                            if(request.getAttribute("izabrano").equals("da"))
                                                            {
                                                                
                                                            
                                                    %>
                                                    <table style="width:40%;display: inline-block; float:right;margin-top: 150px;margin-right: 100px;">
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td>
                                                                
                                                            </td>
                                                            <td style="width:15%;">
                                                                <img id="moboIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getMaticna().getImgPath() %>" alt="" style="float:left;" width="150" height="150">
                                                            </td>
                                                            <td>
                                                                <img id="ramIMG" src="<%= konfigfps1.get(0).getKonfiguracije().getRam().getImgPath() %>" class="slikedelova" alt="" style="float:right;" width="150" height="150">
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td style="width:20%;">
                                                                <img id="cpuIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getProcesori().getImgPath() %>" alt="" width="150" height="150">
                                                            </td>
                                                            <td style="padding:0;">
                                                                <img id="caseIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getKuciste().getImgPath() %>" alt="" width="250" height="250">
                                                            </td>
                                                            <td>
                                                                <img id="coolerIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getKuleri().getImgPath() %>" alt="" width="150" height="150">
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td>
                                                                <img id="psuIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getPsu().getImgPath() %>" alt="" width="150" height="150">
                                                            </td>
                                                            <td>
                                                                <img id="gpuIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getGpu().getImgPath() %>" alt="" width="150" height="150">
                                                            </td>
                                                            <td>
                                                                <img id="memIMG" class="slikedelova" src="<%= konfigfps1.get(0).getKonfiguracije().getMemorija().getImgPath() %>" alt="" width="150" height="150">
                                                            </td>
                                                            
                                                        </tr>
                                                    </table>
                                                                        
                                                    <%
                                                        if(!konfigfps1.isEmpty())
                                                        { int fps2 = konfigfps1.get(0).getFps()/2;
                                                    %>
                                                    <%
                                                        if(request.getAttribute("izabrano")!=null)
                                                        {
                                                            if(request.getAttribute("izabrano").equals("da"))
                                                            {
                                                    %>
                                                    <div id="myBar" style='color: #2ebaae;text-align: center;font-size: 30px;font-family: "Raleway", Helvetica, sans-serif;font-weight: 550;clear: both;'></div>
                                                    <%
                                                        }}
                                                    %>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= fps2 %>%; }
                                                              }
                                                    </style>
                                                    <%
                                                        }
                                                    %>
                                                    <%
                                                        }}
                                                    %>
                                                    
                                                    <script>
                                                            var i = 0;
                                                            window.onload = function(){
                                                              if (i == 0) {
                                                                i = 1;
                                                                var elem = document.getElementById("myBar");
                                                                var width = 10;
                                                                var id = setInterval(frame, 30);
                                                                function frame() {
                                                                  if (width >= <%if(!konfigfps1.isEmpty()){%><%= konfigfps1.get(0).getFps() %><%}%>) {
                                                                    clearInterval(id);
                                                                    i = 0;
                                                                  } else {
                                                                    width++;
                                                                    elem.innerHTML = width  + " FPS";
                                                                  }
                                                                }
                                                              }
                                                            }
                                                    </script>
                                                            
                                                            
                                                            <%
                                                                }
                                                            %>
                                                                        </form>
                                                            
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