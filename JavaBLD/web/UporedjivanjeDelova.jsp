<%@page import="entity.Ram"%>
<%@page import="entity.Psu"%>
<%@page import="entity.Procesori"%>
<%@page import="entity.Memorija"%>
<%@page import="entity.Maticna"%>
<%@page import="entity.Kuleri"%>
<%@page import="entity.Kuciste"%>
<%@page import="entity.Gpu"%>
<%@page import="entity.Podkomentari"%>
<%@page import="entity.Komentari"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="javax.servlet.http.*" %>
<%@page import="entity.Korisnici" %>
<%@page import="entity.Konfiguracije" %>
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
						<h1><a href="index.jsp" style="color:white;">BLD</a></h1>
						<nav class="links">
							<ul>
								<li><a href="AdminPrikazDelova.jsp" style="color: #ffffff">Računarski delovi</a></li>
								<li><a href="#" style="color: #ffffff">Software i igrice</a></li>
								<li><a href="ServletAdminPrikazKonfiguracija" style="color: #ffffff">Konfiguracije</a></li>
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
										<a href="#">
                                                                                    <p style="font-size:0.8em;">Software i igrice</p>
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

                                
                                <div id="myModalI" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeI">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Izmene su uspešno sačuvane!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalI = document.getElementById("myModalI");
                                    var spanI = document.getElementById("closeI");
                                    <%
                                        if(request.getAttribute("uspesno")!=null)
                                        {
                                    %>
                                    $(document).ready(function(){
                                        modalI.style.display = "block";
                                    })
                                    <%
                                        }
                                    %>
                                        spanI.onclick = function() {
                                  modalI.style.display = "none";
                                }
                                </script>
                                <%
                                    ArrayList<Gpu> gpu = new ArrayList<Gpu>();
                                    ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
                                    ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
                                    ArrayList<Maticna> maticna = new ArrayList<Maticna>();
                                    ArrayList<Memorija> memorija = new ArrayList<Memorija>();
                                    ArrayList<Procesori> cpu = new ArrayList<Procesori>();
                                    ArrayList<Psu> psu = new ArrayList<Psu>();
                                    ArrayList<Ram> ram = new ArrayList<Ram>();
                                    


                                    if(request.getAttribute("gpu")!=null)
                                    {
                                            gpu = (ArrayList<Gpu>)request.getAttribute("gpu");
                                    }
                                    
                                    if(request.getAttribute("kuciste")!=null)
                                    {
                                            kuciste = (ArrayList<Kuciste>)request.getAttribute("kuciste");
                                    }

                                    if(request.getAttribute("kuler")!=null)
                                    {
                                            kuler = (ArrayList<Kuleri>)request.getAttribute("kuler");
                                    }

                                    if(request.getAttribute("maticna")!=null)
                                    {
                                            maticna = (ArrayList<Maticna>)request.getAttribute("maticna");
                                    }

                                    if(request.getAttribute("memorija")!=null)
                                    {
                                            memorija = (ArrayList<Memorija>)request.getAttribute("memorija");
                                    }

                                    if(request.getAttribute("cpu")!=null)
                                    {
                                            cpu = (ArrayList<Procesori>)request.getAttribute("cpu");
                                    }

                                    if(request.getAttribute("psu")!=null)
                                    {
                                            psu = (ArrayList<Psu>)request.getAttribute("psu");
                                    }
                                    
                                    if(request.getAttribute("ram")!=null)
                                    {
                                            ram = (ArrayList<Ram>)request.getAttribute("ram");
                                    }

                                %>
                                
                                
                                
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
                                    <p style="margin-bottom:5px;"><b>Konfiguracija uspešno obrisana!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalP = document.getElementById("myModalP");
                                    var spanP = document.getElementById("closeP");
                                    <%
                                    if(request.getAttribute("obrisano")!=null)
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
                                
                                window.onclick = function(event) {
                                  if (event.target == modalP) {
                                    modalP.style.display = "none";
                                  }
                                }
                                </script>
                                
                                

				<!-- Main -->
					<div id="main" style="text-align:center;">

						<!-- Post -->
                                                <% 
                                                    if(!gpu.isEmpty())
                                                    {
                                                    for(Gpu pom:gpu)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Memorija: <%= pom.getMemorija() %></p>
                                                                        <p style="margin-bottom: 5px;">Core clock: <%= pom.getCoreCl() %></p>
                                                                        <p style="margin-bottom: 5px;">Boost clock: <%= pom.getBoostCl() %></p>
                                                                        <p style="margin-bottom: 5px;">TDP: <%= pom.getTdp() %> W</p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!kuler.isEmpty())
                                                    {
                                                    for(Kuleri pom:kuler)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">RPM: <%= pom.getRpm()%></p>
                                                                        <p style="margin-bottom: 5px;">Buka: <%= pom.getBuka()%></p>
                                                                        <p style="margin-bottom: 5px;">Radijator dimenzije: <%= pom.getRadijatorDim()%></p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!kuciste.isEmpty())
                                                    {
                                                    for(Kuciste pom:kuciste)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Dimenzije: <%= pom.getDimenzije()%></p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!maticna.isEmpty())
                                                    {
                                                    for(Maticna pom:maticna)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Socket: <%= pom.getSocket()%></p>
                                                                        <p style="margin-bottom: 5px;">Veličina: <%= pom.getVelicina()%></p>
                                                                        <p style="margin-bottom: 5px;">Max RAM: <%= pom.getMaxRam()%></p>
                                                                        <p style="margin-bottom: 5px;">Slotovi za RAM: <%= pom.getMemSlots()%> W</p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!memorija.isEmpty())
                                                    {
                                                    for(Memorija pom:memorija)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Kapacitet: <%= pom.getKapacitet()%></p>
                                                                        <p style="margin-bottom: 5px;">Tip: <%= pom.getTip()%></p>
                                                                        <p style="margin-bottom: 5px;">Cache: <%= pom.getCache()%></p>
                                                                        <p style="margin-bottom: 5px;">Dimenzije: <%= pom.getDimenzije()%></p>
                                                                        <p style="margin-bottom: 5px;">Interfejs: <%= pom.getInterfejs()%></p>
                                                                        <p style="margin-bottom: 5px;">TDP <%= pom.getTdp()%></p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!cpu.isEmpty())
                                                    {
                                                    for(Procesori pom:cpu)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;width: 100%;white-space: nowrap"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Frekvencija: <%= pom.getFrekvencija()%></p>
                                                                        <p style="margin-bottom: 5px;">Boost clock: <%= pom.getBoost()%> W</p>
                                                                        <p style="margin-bottom: 5px;">TDP: <%= pom.getTdp()%> W</p>
                                                                        <p style="margin-bottom: 5px;">iGPU: <%= pom.getIgpu()%></p>
                                                                        <p style="margin-bottom: 5px;">Socket: <%= pom.getSocket()%> W</p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!psu.isEmpty())
                                                    {
                                                    for(Psu pom:psu)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Efikasnost: <%= pom.getEfikasnost()%></p>
                                                                        <p style="margin-bottom: 5px;">Jačina: <%= pom.getJacina()%> W</p>
                                                                        <p style="margin-bottom: 5px;">Modularnost: <%= pom.getModularnost()%></p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!ram.isEmpty())
                                                    {
                                                    for(Ram pom:ram)
                                                    {
                                                %>
							<article class="post" style="width: 32%;margin-right: 10px;; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Brzina: <%= pom.getBrzina()%></p>
                                                                        <p style="margin-bottom: 5px;">Latency: <%= pom.getCasLat()%></p>
                                                                        <p style="margin-bottom: 5px;">TDP: <%= pom.getTdp()%> W</p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
						

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