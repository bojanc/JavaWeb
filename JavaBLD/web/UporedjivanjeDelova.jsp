<%@page import="java.text.DecimalFormat"%>
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
			<div id="wrapper" style="padding-left: 10px; padding-right: 0; margin-left: 0; margin-right: -200px;width: 110%;">

				<!-- Header -->
					<header id="header">
						<h1><a href="ServletIndex" style="color:white;font-size: 20px;"><img style="filter: drop-shadow(1px 1px 1px rgba(46,186,174,1));" class="logo" src="images/logo2.png" width="50" height="50"></a></h1>
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
                                    ArrayList<Gpu> gpusve = new ArrayList<Gpu>();
                                    ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
                                    ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
                                    ArrayList<Maticna> maticna = new ArrayList<Maticna>();
                                    ArrayList<Memorija> memorija = new ArrayList<Memorija>();
                                    ArrayList<Procesori> cpu = new ArrayList<Procesori>();
                                    ArrayList<Procesori> cpusve = new ArrayList<Procesori>();
                                    ArrayList<Psu> psu = new ArrayList<Psu>();
                                    ArrayList<Ram> ram = new ArrayList<Ram>();
                                    ArrayList<Ram> ramsve = new ArrayList<Ram>();
                                    


                                    if(request.getAttribute("gpu")!=null)
                                    {
                                            gpu = (ArrayList<Gpu>)request.getAttribute("gpu");
                                    }
                                    
                                    if(request.getAttribute("gpusve")!=null)
                                    {
                                            gpusve = (ArrayList<Gpu>)request.getAttribute("gpusve");
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
                                    
                                    if(request.getAttribute("cpusve")!=null)
                                    {
                                            cpusve = (ArrayList<Procesori>)request.getAttribute("cpusve");
                                    }

                                    if(request.getAttribute("psu")!=null)
                                    {
                                            psu = (ArrayList<Psu>)request.getAttribute("psu");
                                    }
                                    
                                    if(request.getAttribute("ram")!=null)
                                    {
                                            ram = (ArrayList<Ram>)request.getAttribute("ram");
                                    }
                                    
                                    if(request.getAttribute("ramsve")!=null)
                                    {
                                            ramsve = (ArrayList<Ram>)request.getAttribute("ramsve");
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
                                
                                <style>
                                    .progress {
                                        background: #12131E;
                                        justify-content: flex-start;
                                        border-radius: 100px;
                                        align-items: center;
                                        position: relative;
                                        padding: 0 5px;
                                        display: flex;
                                        height: 40px;
                                        width: 35%;
                                        margin: 0 auto;
                                      }

                                      .progress-value {
                                        animation: load 3s normal forwards;
                                        box-shadow: 0 10px 40px -10px #2ebaae;
                                        border-radius: 100px;
                                        background: #2ebaae;
                                        height: 30px;
                                        width: 0;
                                      }

                                      
                                </style>
                                
                                <style>
                                                                    #ck-button {
                                                                        -moz-appearance: none;
                                                                        -webkit-appearance: none;
                                                                        -ms-appearance: none;
                                                                        appearance: none;
                                                                        -moz-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        -webkit-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        -ms-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        background-color: transparent;
                                                                        border: 0;
                                                                        box-shadow: inset 0 0 0 1px rgba(160, 160, 160, 0.3);
                                                                        color: #000;
                                                                        cursor: pointer;
                                                                        display: inline-block;
                                                                        font-family: "Raleway", Helvetica, sans-serif;
                                                                        font-size: 0.6em;
                                                                        font-weight: 800;
                                                                        height: 4.8125em;
                                                                        letter-spacing: 0.25em;
                                                                        line-height: 4.8125em;
                                                                        padding: 0;
                                                                        text-align: center;
                                                                        text-decoration: none;
                                                                        text-transform: uppercase;
                                                                        white-space: nowrap;
                                                                    }

                                                                    #ck-button:hover {
                                                                        box-shadow: inset 0 0 0 1px #2ebaae;
                                                                        color: #2ebaae !important;
                                                                    }

                                                                    #ck-button label {
                                                                        float:left;
                                                                        font-family: "Raleway", Helvetica, sans-serif;
                                                                    }

                                                                    #ck-button label span {
                                                                        -moz-appearance: none;
                                                                        -webkit-appearance: none;
                                                                        -ms-appearance: none;
                                                                        appearance: none;
                                                                        -moz-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        -webkit-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        -ms-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
                                                                        background-color: transparent;
                                                                        border: 0;
                                                                        color: #000;
                                                                        cursor: pointer;
                                                                        display: inline-block;
                                                                        font-family: "Raleway", Helvetica, sans-serif;
                                                                    }

                                                                    #ck-button label input {
                                                                        position:absolute;
                                                                        top:-20px;
                                                                    }
                                                                    
                                                                    #ck-button span {
                                                                        width: 125px;
                                                                    }

                                                                    #ck-button input:checked + span{
                                                                        background-color:transparent;
                                                                        box-shadow: inset 0 0 0 1px #2ebaae;
                                                                        color: #2ebaae !important;
                                                                    }
                                                                </style>
                                
                                

				<!-- Main -->
					<div id="main" style="text-align:center; width: 100%;">
                                            <%
                                                if(!gpusve.isEmpty())
                                                {
                                            %>
                                            <div id="gpu" class="deo" style="float:left;display:inline-block;width:20%;">
                                                
                                                <table style='width:20%;'>
                                                    <%
                                                        if(gpusve.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Gpu pom:gpusve)
                                                        {
                                                            if(pom.getGpuId() != gpu.get(1).getGpuId()){
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;width:20%;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <a href="ServletUporedi?gpu=<%= pom.getGpuId() %>&gpu=<%= gpu.get(1).getGpuId() %>" class="button" id="uporedi" onclick="return check()" style="padding-bottom: 10px;">Uporedi</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }}
                                                    %>
                                                </table>
                                              </div>
                                                <%
                                                    }
                                                %>
						<!-- Post -->
                                                <% DecimalFormat df = new DecimalFormat("#.##");
                                                    if(!gpu.isEmpty())
                                                    {
                                                    for(Gpu pom:gpu)
                                                    {
                                                %>
							<article class="post" style="width: 25%;margin-right: 10px; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;font-size:11px;"><%= pom.getNaziv() %></h2>
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
                                                    }%>
                                                <%
                                                if(!gpusve.isEmpty())
                                                {
                                            %>
                                            <div id="gpu" class="deo" style="float:right;display:inline-block;width:20%; padding-right: 10px;">
                                                
                                                <table style='width:20%;float:right;padding-right: 50px;'>
                                                    <%
                                                        if(gpusve.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Gpu pom:gpusve)
                                                        {
                                                            if(pom.getGpuId() != gpu.get(0).getGpuId()){
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;width:20%;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <a href="ServletUporedi?gpu=<%= gpu.get(0).getGpuId() %>&gpu=<%= pom.getGpuId() %>" class="button" id="uporedi" onclick="return check()" style="padding-bottom: 10px;">Uporedi</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }}
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                                <%
                                                    }
                                                %>
                                                
                                                <%
                                                    String gpu1 = gpu.get(0).getMemorija().substring(0, gpu.get(0).getMemorija().length() - 2);
                                                    String gpu2 = gpu.get(1).getMemorija().substring(0, gpu.get(1).getMemorija().length() - 2);
                                                    int gpu1int = Integer.parseInt(gpu1);
                                                    int gpu2int = Integer.parseInt(gpu2);
                                                    if(gpu1int > gpu2int)
                                                    {
                                                        float razlika = ((float)gpu1int/gpu2int)*15;
                                                        df.format(razlika);
                                                %>
                                                <h2><%= gpu.get(0).getNaziv() %> je <span style='color: #2ebaae;'><%= df.format(razlika) %>%</span> brža od <%= gpu.get(1).getNaziv() %></h2>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= razlika %>%; }
                                                              }
                                                    </style>
                                                
                                                <%}
                                                else if(gpu2int > gpu1int){
                                                    float razlika = ((float)gpu2int/gpu1int)*15;
                                                    df.format(razlika);
                                                %>
                                                <h2><%= gpu.get(1).getNaziv() %> je <span style='color: #2ebaae;'><%= df.format(razlika) %>%</span> brža od <%= gpu.get(0).getNaziv() %></h2>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= razlika %>%; }
                                                              }
                                                    </style>
                                                <%}
                                                    else if(gpu1int == gpu2int){%>
                                                    <h2>Obe grafičke kartice su sličnih performansi.</h2>
                                               <%} }
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
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;"><%= pom.getNaziv() %></h2>
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
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;font-size:15px;"><%= pom.getNaziv() %></h2>
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
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;"><%= pom.getNaziv() %></h2>
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
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;"><%= pom.getNaziv() %></h2>
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
                                                                        <p style="margin-bottom: 5px;">TDP: <%= pom.getTdp()%> W</p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                <%
                                                    }
                                                    }
                                                %>
                                                <%
                                                    if(!cpusve.isEmpty())
                                                    {
                                                %>
                                            <div id="cpu" class="deo" style="float:left;display:inline-block;width:20%;">
                                                
                                                <table style='width:20%;'>
                                                    <%
                                                        if(cpusve.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Procesori pom:cpusve)
                                                        {
                                                            if(pom.getProcesorId() != cpu.get(1).getProcesorId()){
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;width:20%;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <a href="ServletUporedi?cpu=<%= pom.getProcesorId() %>&cpu=<%= cpu.get(1).getProcesorId() %>" class="button" id="uporedi" onclick="return check()" style="padding-bottom: 10px;">Uporedi</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }}
                                                    %>
                                                </table>
                                              </div>
                                                <%
                                                    }
                                                %>
                                                
                                                <%  
                                                    if(!cpu.isEmpty())
                                                    {
                                                    for(Procesori pom:cpu)
                                                    {
                                                %>
							<article class="post" style="width: 25%;margin-right: 10px; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;width: 100%;white-space: nowrap;"><%= pom.getNaziv() %></h2>
                                                                </div>
								</header>
                                                            <table>
                                                                <tr style="background-color:transparent;border:none;text-align: left;">
                                                                    <td>
                                                                        <img src="<%= pom.getImgPath() %>" alt="" width="200" height="200"/>
                                                                        <p style="margin-bottom: 5px;">Frekvencija: <%= pom.getFrekvencija()%></p>
                                                                        <p style="margin-bottom: 5px;">Boost clock: <%= pom.getBoost()%></p>
                                                                        <p style="margin-bottom: 5px;">Broj jezgara: <%= pom.getBrojJezgara()%></p>
                                                                        <p style="margin-bottom: 5px;">TDP: <%= pom.getTdp()%> W</p>
                                                                        <p style="margin-bottom: 5px;">iGPU: <%= pom.getIgpu()%></p>
                                                                        <p style="margin-bottom: 5px;">Socket: <%= pom.getSocket()%></p>
                                                                    </td>
                                                                </tr>
                                                            </table>
							</article>
                                                                    
                                                                    <%
                                                    }%>
                                                    <%
                                                    if(!cpusve.isEmpty())
                                                    {
                                                %>
                                            <div id="cpu" class="deo" style="float:right;display:inline-block;width:20%;">
                                                
                                                <table style='width:20%;'>
                                                    <%
                                                        if(cpusve.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Procesori pom:cpusve)
                                                        {
                                                            if(pom.getProcesorId() != cpu.get(0).getProcesorId()){
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;width:20%;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <a href="ServletUporedi?cpu=<%= cpu.get(0).getProcesorId() %>&cpu=<%= pom.getProcesorId() %>" class="button" id="uporedi" onclick="return check()" style="padding-bottom: 10px;">Uporedi</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }}
                                                    %>
                                                </table>
                                              </div>
                                                <%
                                                    }
                                                %>                
                                                    
                                                    
                                                    <%
                                                    String cpu1frek = cpu.get(0).getBoost().substring(0, cpu.get(0).getFrekvencija().length() - 3);
                                                    String cpu2frek = cpu.get(1).getBoost().substring(0, cpu.get(1).getFrekvencija().length() - 3);
                                                    

                                                    float cpu1int = Float.parseFloat(cpu1frek);
                                                    float cpu2int = Float.parseFloat(cpu2frek);
                                                    
                                                    int cpu1jez = cpu.get(0).getBrojJezgara();
                                                    int cpu2jez = cpu.get(1).getBrojJezgara();
                                                    
                                                    if(cpu1int > cpu2int && cpu1jez>=cpu2jez)
                                                    {
                                                        float razlika = (cpu1int/cpu2int)*10;
                                                        
                                                        df.format(razlika);

                                                %>
                                                <h2><%= cpu.get(0).getNaziv() %> je <span style='color: #2ebaae;'><%= df.format(razlika) %>%</span> brži od <%= cpu.get(1).getNaziv() %></h2>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= razlika %>%; }
                                                              }
                                                    </style>
                                                
                                                <%}
                                                else if(cpu2int > cpu1int && cpu2jez>=cpu1jez){
                                                    float razlika = (cpu2int/cpu1int)*10;
                                                %>
                                                <h2><%= cpu.get(1).getNaziv() %> je <span style='color: #2ebaae;'><%= df.format(razlika) %>%</span> brži od <%= cpu.get(0).getNaziv() %></h2>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= razlika %>%; }
                                                              }
                                                    </style>
                                                <%}
                                                    else if(cpu1int == cpu2int){%>
                                                    <h2>Oba procesora su sličnih performansi.</h2>
                                               <%} }
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
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;"><%= pom.getNaziv() %></h2>
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
                                                    if(!ramsve.isEmpty())
                                                    {
                                                %>
                                            <div id="ram" class="deo" style="float:left;display:inline-block;width:20%;">
                                                
                                                <table style='width:20%;'>
                                                    <%
                                                        if(ramsve.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Ram pom:ramsve)
                                                        {
                                                            if(pom.getRamId()!= ram.get(1).getRamId()){
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;width:20%;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <a href="ServletUporedi?ram=<%= pom.getRamId()%>&ram=<%= ram.get(1).getRamId()%>" class="button" id="uporedi" onclick="return check()" style="padding-bottom: 10px;">Uporedi</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }}
                                                    %>
                                                </table>
                                              </div>
                                                <%
                                                    }
                                                %>
                                                
                                                <% 
                                                    if(!ram.isEmpty())
                                                    {
                                                    for(Ram pom:ram)
                                                    {
                                                %>
							<article class="post" style="width: 25%;margin-right: 10px; display: inline-block;height: 600px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;">
                                                                <div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                <h2 style="color:white;float:left;padding-top: 5px;white-space: nowrap;font-size:15px;"><%= pom.getNaziv() %></h2>
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
                                                    }%>
                                                <%
                                                    if(!ramsve.isEmpty())
                                                    {
                                                %>
                                            <div id="ram" class="deo" style="float:right;display:inline-block;width:20%;margin-right: 25px;">
                                                
                                                <table style='width:20%;'>
                                                    <%
                                                        if(ramsve.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Ram pom:ramsve)
                                                        {
                                                            if(pom.getRamId()!= ram.get(0).getRamId()){
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;width:20%;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <a href="ServletUporedi?ram=<%= ram.get(0).getRamId()%>&ram=<%= pom.getRamId()%>" class="button" id="uporedi" onclick="return check()" style="padding-bottom: 10px;">Uporedi</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }}
                                                    %>
                                                </table>
                                              </div>
                                                <%
                                                    }
                                                %>     
                                                    
                                                    <%
                                                    String ram1 = ram.get(0).getBrzina().substring(ram.get(0).getBrzina().length() - 4);
                                                    String ram2 = ram.get(1).getBrzina().substring(ram.get(1).getBrzina().length() - 4);
                                                    int ram1int = Integer.parseInt(ram1);
                                                    int ram2int = Integer.parseInt(ram2);
                                                    if(ram1int > ram2int)
                                                    {
                                                        float razlika = ((float)ram1int/ram2int)*10;
                                                        df.format(razlika);

                                                %>
                                                <h2><%= ram.get(0).getNaziv() %> je <span style='color: #2ebaae;'><%= df.format(razlika) %>%</span> brži od <%= ram.get(1).getNaziv() %></h2>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= razlika %>%; }
                                                              }
                                                    </style>
                                                
                                                <%}
                                                else if(ram2int > ram1int){
                                                    float razlika = ((float)ram2int/ram1int)*10;
                                                %>
                                                <h2><%= ram.get(1).getNaziv() %> je <span style='color: #2ebaae;'><%= df.format(razlika) %>%</span> brži od <%= ram.get(0).getNaziv() %></h2>
                                                    <div class="progress" style="box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);">
                                                        <div class="progress-value"></div>
                                                    </div>
                                                    
                                                    <style>
                                                            @keyframes load {
                                                                0% { width: 0; }
                                                                100% { width: <%= razlika %>%; }
                                                              }
                                                    </style>
                                                <%}
                                                    else if(ram1int == ram2int){%>
                                                    <h2>Obe RAM memorije su sličnih performansi.</h2>
                                               <%} }
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