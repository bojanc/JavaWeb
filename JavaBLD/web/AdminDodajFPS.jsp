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
                                                                <%
                                                                    ArrayList<Konfiguracije> konfig = (ArrayList<Konfiguracije>)request.getAttribute("konfig");
                                                                    Igrice igrica = (Igrice)request.getAttribute("igrica");
                                                                    int fps = 0;
                                                                    int konfigID = 0;
                                                                    int fpsid = 0;
                                                                    
                                                                    if(request.getAttribute("fps")!=null)
                                                                    {
                                                                       fps = Integer.parseInt((request.getAttribute("fps").toString()));
                                                                    }

                                                                    if(request.getAttribute("konfigID")!=null)
                                                                    {
                                                                        konfigID = Integer.parseInt((request.getAttribute("konfigID").toString()));
                                                                    }
                                                                    
                                                                    if(request.getAttribute("fpsid")!=null)
                                                                    {
                                                                        fpsid = Integer.parseInt(request.getAttribute("fpsid").toString());
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
                                
                                <style>
                                            #buttonobrisi:hover {
                                                box-shadow: inset 0 0 0 1px red;
                                                color: red !important;
                                            }
                                </style>

                                
                                <div id="myModalP" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeP">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Neke komponente ove konfiguracije ne ispunjavaju sve zahteve za ovu igricu!</b></p>
                                  </div>

                                </div>
                                
                                <div id="myModalPostoji" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closePostoji">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Ova igrica već ima unet FPS za ovu konfiguraciju!</b></p>
                                    <a href="ServletObrisiFPS?fpsid=<%= fpsid %>" id="buttonobrisi" class="button">Obriši unos FPS-a</a>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalP = document.getElementById("myModalPostoji");
                                    var spanP = document.getElementById("closePostoji");
                                    var modalP2 = document.getElementById("myModalP");
                                    
                                    <%
                                        if(request.getAttribute("vecpostoji")!=null)
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
                                  if (event.target == modalP || event.target == modalP2) {
                                    modalP.style.display = "none";
                                    modalP2.style.display = "none";
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
							<article class="post">
                                                            
								<header>
                                                                    <div class="title">
										<h2 style="display:inline-block; padding-top: 5%;">
                                                                                    Prosečan FPS za <%= igrica.getIgricaNaziv() %>
                                                                                </h2>
                                                                        <!--<a href="PosaljiPoruku.jsp" class="button" style="float: right;display:inline-block;">Pošalji poruku</a>-->
                                                                        <img src="<%= igrica.getImgPath() %>" alt="" width="250" heigh="350" style="display:inline-block;float:right;box-shadow: 9px 9px 10px -4px rgba(0,0,0,0.75);"/>
									</div>
                                                                        
                                                                        
								</header>
                                                                        
                                                                        
                                                                        <form method='post' id='form' action='ServletIzracunajFPS'>
                                                            <%
                                                                if(igrica!=null)
                                                                {
                                                            %>
                                                            <table style="width:25%;display:inline-block;">
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <%
                                                                            if(fps==0)
                                                                            {
                                                                        %>
                                                                        <a href='#' onclick="document.getElementById('form').submit();" id="sb" class='button' style='display:inline-block;'>Izracunaj FPS</a>
                                                                        <%
                                                                            }
                                                                        %>
                                                                        <%
                                                                            if(fps!=0)
                                                                            {
                                                                        %>
                                                                        <%  if(korisnik!=null){
                                                                            if(korisnik.getUloga().equals("Admin") || korisnik.getUloga().equals("Urednik")){
                                                                        %>
                                                                        <a href='ServletUnesiFPS?fps=<%= fps %>&igricaID=<%= igrica.getIgricaId() %>&konfigID=<%= konfigID %>&name=<%= igrica.getIgricaNaziv() %>' class='button'style='display:inline-block;'>Unesi FPS</a>
                                                                        <%
                                                                            }}
                                                                        %>
                                                                        <a href='ServletAdminDodajFPS?id=<%= igrica.getIgricaId() %>' class='button'style='display:inline-block;'>Resetuj</a>
                                                                        <%
                                                                            }
                                                                        %>
                                                                        <br><br><input type="text" value="<%= igrica.getIgricaNaziv() %>" readonly>
                                                                        
                                                                    </td>
                                                                </tr>
                                                                
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label>Preporučena grafička kartica</label>
                                                                        <input type="text" value="<%= igrica.getGpu().getNaziv() %>" readonly>
                                                                    </td>
                                                                </tr>
                                                                
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label>Preporučen procesor</label>
                                                                        <input type="text" value="<%= igrica.getProcesori().getNaziv() %>" readonly>
                                                                    </td>
                                                                </tr>
                                                                
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label>Preporučen RAM</label>
                                                                        <input type="text" value="<%= igrica.getRam().getNaziv() %>" readonly>
                                                                    </td>
                                                                </tr>
                                                                
                                                                
                                                                
                                                                <tr style="background-color:transparent;border: none;">
                                                                    <td>
                                                                        <label>Izaberi konfiguraciju</label>
                                                                        <select name="konfig" id="sel" onchange="slike('sel')" style="width:210%;">
                                                                        <optgroup>
                                                                            <option value="" disabled <%if(konfigID==0){%>selected<%}%>>Konfiguracije</option>
                                                                            <%
                                                                                if(!konfig.isEmpty()){
                                                                                    for(Konfiguracije pom:konfig){

                                                                            %>

                                                                            <option value="<%= pom.getKonfiguracijaId()%>"
                                                                                    gpu='<%= pom.getGpu().getImgPath() %>'
                                                                                    kuciste='<%= pom.getKuciste().getImgPath() %>'
                                                                                    kuler='<%= pom.getKuleri().getImgPath() %>'
                                                                                    maticna='<%= pom.getMaticna().getImgPath() %>'
                                                                                    memorija='<%= pom.getMemorija().getImgPath() %>'
                                                                                    procesor='<%= pom.getProcesori().getImgPath() %>'
                                                                                    psu='<%= pom.getPsu().getImgPath() %>'
                                                                                    ram='<%= pom.getRam().getImgPath() %>'
                                                                                    gpucl='<%= pom.getGpu().getBoostCl() %>'
                                                                                    gpumem='<%= pom.getGpu().getMemorija() %>'
                                                                                    cpucl='<%= pom.getProcesori().getBoost() %>'
                                                                                    cpucore='<%= pom.getProcesori().getBrojJezgara() %>'
                                                                                    rambrzina='<%= pom.getRam().getBrzina() %>'
                                                                                    <%
                                                                                        if(konfigID!=0)
                                                                                        {
                                                                                            if(pom.getKonfiguracijaId() == konfigID)
                                                                                            {
                                                                                    %>
                                                                            selected
                                                                                    <%
                                                                                            }
                                                                                        }
                                                                                    %>
                                                                                    > GPU: <%= pom.getGpu().getNaziv() %> CPU: <%= pom.getProcesori().getNaziv() %> RAM: <%= pom.getRam().getNaziv() %></option>
                                                                            <%

                                                                                }
                                                                                }
                                                                            %>
                                                                        </optgroup>
                                                                    </select><br>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                                        <%
                                                                    if(fps!=0)
                                                                    {
                                                                %>
                                                                <script>
                                                                    
                                                                       document.getElementById("sel").disabled = true;  
                                                                       
                                                                </script>
                                                                <%
                                                                    }
                                                                %>
                                                                        
                                                    <table style="display:inline-block;width:40%;float:right;">
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td>
                                                                
                                                            </td>
                                                            <td style="width:15%;">
                                                                <img id="moboIMG" class="slikedelova" src="#" alt="" style="float:left;">
                                                            </td>
                                                            <td>
                                                                <img id="ramIMG" src="#" class="slikedelova" alt="" style="float:right;">
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td style="width:20%;">
                                                                <img id="cpuIMG" class="slikedelova" src="#" alt="">
                                                            </td>
                                                            <td style="padding:0;">
                                                                <img id="caseIMG" class="slikedelova" src="#" alt="">
                                                            </td>
                                                            <td>
                                                                <img id="coolerIMG" class="slikedelova" src="#" alt="">
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td>
                                                                <img id="psuIMG" class="slikedelova" src="#" alt="">
                                                            </td>
                                                            <td>
                                                                <img id="gpuIMG" class="slikedelova" src="#" alt="">
                                                            </td>
                                                            <td>
                                                                <img id="memIMG" class="slikedelova" src="#" alt="">
                                                            </td>
                                                            
                                                        </tr>
                                                    </table>
                                                                        
                                                    <%
                                                        if(fps!=0)
                                                        { int fps2 = fps/2;
                                                    %>
                                                    <div id="myBar" style='color: #2ebaae;text-align: center;font-size: 30px;font-family: "Raleway", Helvetica, sans-serif;font-weight: 550;'></div>
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
                                                    
                                                    <script>
                                                        <%
                                                            if(fps!=0)
                                                            {
                                                        %>
                                                            var i = 0;
                                                            window.onload = function(){
                                                              if (i == 0) {
                                                                i = 1;
                                                                var elem = document.getElementById("myBar");
                                                                var width = 10;
                                                                var id = setInterval(frame, 30);
                                                                function frame() {
                                                                  if (width >= <%= fps %>) {
                                                                    clearInterval(id);
                                                                    i = 0;
                                                                  } else {
                                                                    width++;
                                                                    elem.innerHTML = width  + " FPS";
                                                                  }
                                                                }
                                                              }
                                                            }
                                                            <%
                                                            }
                                                            %>
                                                    </script>
                                                    
                                                    <script>
                                                        window.addEventListener('load', function() {
                                                        
                                                            var x = document.getElementById("sel");
                                                            var value = x.options[x.selectedIndex].value;
                                                            if(value == "")
                                                            {
                                                                document.getElementById("sb").setAttribute("onclick", "");
                                                            }
                                                        })
                                                    </script>
                                                                        
                                                                        <input type="hidden" name='igricaGPUMEM' id="igricaGPUMem" value="<%= igrica.getGpu().getMemorija() %>">
                                                                        <input type="hidden" name='igricaGPUMhz' id="igricaGPUMhz" value="<%= igrica.getGpu().getBoostCl()%>">
                                                                        <input type="hidden" name='igricaCPUMhz' id="igricaCPUMhz" value="<%= igrica.getProcesori().getBoost() %>">
                                                                        <input type="hidden" name='igricaCPUCore' id="igricaCPUCore" value="<%= igrica.getProcesori().getBrojJezgara() %>">
                                                                        <input type="hidden" name='igricaRAMMem' id="igricaRAMMem" value="<%= igrica.getRam().getBrzina() %>">
                                                                        <input type="hidden" name='igricaID' id="igricaID" value="<%= igrica.getIgricaId() %>">
                                                            
                                                            
                                                            <%
                                                                }
                                                            %>
                                                                        </form>
                                                            <script>
                                                                
                                                                function slike(obj)
                                                                {
                                                                    <%
                                                                        if(fps==0)
                                                                        {
                                                                    %>
                                                                    document.getElementById("sb").setAttribute("onclick", "document.getElementById('form').submit();");
                                                                    <%
                                                                        }
                                                                    %>
                                                                            
                                                                    
                                                                            
                                                                          
                                                                    var modalP2 = document.getElementById("myModalP");
                                                                    var spanP2 = document.getElementById("closeP");
                                                                    var x = document.getElementById(obj);
                                                                    var value = x.options[x.selectedIndex].value;
                                                                    var gpu = x.options[x.selectedIndex].getAttribute("gpu");
                                                                    var kuciste = x.options[x.selectedIndex].getAttribute("kuciste");
                                                                    var kuler = x.options[x.selectedIndex].getAttribute("kuler");
                                                                    var maticna = x.options[x.selectedIndex].getAttribute("maticna");
                                                                    var memorija = x.options[x.selectedIndex].getAttribute("memorija");
                                                                    var procesor = x.options[x.selectedIndex].getAttribute("procesor");
                                                                    var psu = x.options[x.selectedIndex].getAttribute("psu");
                                                                    var ram = x.options[x.selectedIndex].getAttribute("ram");
                                                                    
                                                                    
                                                                    var gpucl = x.options[x.selectedIndex].getAttribute("gpucl");
                                                                    var gpumem = x.options[x.selectedIndex].getAttribute("gpumem");
                                                                    var cpucl = x.options[x.selectedIndex].getAttribute("cpucl");
                                                                    var cpucore = x.options[x.selectedIndex].getAttribute("cpucore");
                                                                    var rambrzina = x.options[x.selectedIndex].getAttribute("rambrzina");
                                                                    
                                                                    
                                                                    var igricaGPUMem = document.getElementById("igricaGPUMem").value;
                                                                    var igricaGPUMhz = document.getElementById("igricaGPUMhz").value;
                                                                    var igricaCPUMhz = document.getElementById("igricaCPUMhz").value;
                                                                    var igricaCPUCore = document.getElementById("igricaCPUCore").value;
                                                                    var igricaRAMMem = document.getElementById("igricaRAMMem").value;
                                                                    
                                                                    var igricagpumem = parseInt(igricaGPUMem.substr(0,2));
                                                                    
                                                                    if(igricaGPUMem.substr(0,2).indexOf('G')>-1)
                                                                    {
                                                                        igricagpumem = parseInt(igricaGPUMem.substr(0,1));
                                                                    }
                                                                    
                                                                    var igricagpumhz = parseInt(igricaGPUMhz.substr(0,igricaGPUMhz.length-4));
                                                                    var igricacpumhz = parseFloat(igricaCPUMhz.substr(0,igricaCPUMhz.length-4));
                                                                    var igricarammem = parseInt(igricaRAMMem.substr(0,2));
                                                                    var igricarammhz = parseInt(igricaRAMMem.substr(igricaRAMMem.length-4));
                                                                    
                                                                    if(igricaRAMMem.substr(0,2).indexOf('G')>-1)
                                                                    {
                                                                        igricarammem = parseInt(igricaRAMMem.substr(0,1));
                                                                    }
                                                                    
                                                                    
                                                                    var rammhz = parseInt(rambrzina.substr(rambrzina.length-4));
                                                                    var ramMem =parseInt(rambrzina.substr(0,2));
                                                                    var gpuMem = parseInt(gpumem.substr(0,2));
                                                                    var gpumhz = parseInt(gpucl.substr(0,gpucl.length-4));
                                                                    var cpumhz = parseFloat(cpucl.substr(0,cpucl.length-4));
                                                                    
                                                                    if(rambrzina.substr(0,2).indexOf('G')>-1)
                                                                    {
                                                                        ramMem = parseInt(rambrzina.substr(0,1));
                                                                    }
                                                                    
                                                                    if(gpumem.substr(0,2).indexOf('G')>-1)
                                                                    {
                                                                        gpuMem = parseInt(gpumem.substr(0,1));
                                                                    }
                                                                    
                                                                    if(gpumhz<igricagpumhz || gpuMem<igricagpumem || cpumhz<igricacpumhz || cpucore<igricaCPUCore || ramMem<igricarammem || rammhz<igricarammhz)
                                                                    {
                                                                        modalP2.style.display = "block";
                                                                        document.getElementById("sb").setAttribute("onclick", "");
                                                                        console.log("nije dobro");
                                                                    }
                                                                    
                                                                    spanP2.onclick = function() {
                                                                        modalP2.style.display = "none";
                                                                      }
                                                                    
                                                                    console.log("konfig");
                                                                    console.log(gpumhz);
                                                                    console.log(gpuMem);
                                                                    console.log(cpumhz);
                                                                    console.log(cpucore);
                                                                    console.log(ramMem);
                                                                    console.log(rammhz);
                                                                    
                                                                    console.log("igrica");
                                                                    console.log(igricagpumhz);
                                                                    console.log(igricagpumem);
                                                                    console.log(igricacpumhz);
                                                                    console.log(igricaCPUCore);
                                                                    console.log(igricarammem);
                                                                    console.log(igricarammhz);
                                                                    
                                                                    
                                                                    
                                                                    $('#gpuIMG')
                                                                            .attr('src', gpu)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    $('#memIMG')
                                                                            .attr('src', memorija)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    $('#psuIMG')
                                                                            .attr('src', psu)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    $('#coolerIMG')
                                                                            .attr('src', kuler)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    $('#caseIMG')
                                                                            .attr('src', kuciste)
                                                                            .attr('style', "display:block;")
                                                                            .width(250)
                                                                            .height(250);
                                                                    
                                                                    $('#cpuIMG')
                                                                            .attr('src', procesor)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    $('#ramIMG')
                                                                            .attr('src', ram)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    $('#moboIMG')
                                                                            .attr('src', maticna)
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    
                                                                    
                                                                }
                                                            </script>
                                                            <script>
                                                                <%
                                                                    if(konfigID!=0){
                                                                %>
                                                                    document.onload = slike('sel');

                                                                    <%
                                                                        }
                                                                    %>
                                                            </script>
							</article>

						<!-- Post -->
						<!--
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">Elements</a></h2>
										<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-10-18">October 18, 2015</time>
										<a href="#" class="author"><span class="name">Jane Doe</span><img src="images/avatar.jpg" alt="" /></a>
									</div>
								</header>

								<section>
									<h3>Text</h3>
									<p>This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i> and this is <em>emphasized</em>.
									This is <sup>superscript</sup> text and this is <sub>subscript</sub> text.
									This is <u>underlined</u> and this is code: <code>for (;;) { ... }</code>. Finally, <a href="#">this is a link</a>.</p>
									<hr />
									<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing blandit tempus accumsan.</p>
									<hr />
									<h2>Heading Level 2</h2>
									<h3>Heading Level 3</h3>
									<h4>Heading Level 4</h4>
									<hr />
									<h4>Blockquote</h4>
									<blockquote>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum dolor sit amet nullam adipiscing eu felis.</blockquote>
									<h4>Preformatted</h4>
									<pre><code>i = 0;

while (!deck.isInOrder()) {
  print 'Iteration ' + i;
  deck.shuffle();
  i++;
}

print 'It took ' + i + ' iterations to sort the deck.';</code></pre>
								</section>

								<section>
									<h3>Lists</h3>
									<div class="row">
										<div class="col-6 col-12-medium">
											<h4>Unordered</h4>
											<ul>
												<li>Dolor pulvinar etiam.</li>
												<li>Sagittis adipiscing.</li>
												<li>Felis enim feugiat.</li>
											</ul>
											<h4>Alternate</h4>
											<ul class="alt">
												<li>Dolor pulvinar etiam.</li>
												<li>Sagittis adipiscing.</li>
												<li>Felis enim feugiat.</li>
											</ul>
										</div>
										<div class="col-6 col-12-medium">
											<h4>Ordered</h4>
											<ol>
												<li>Dolor pulvinar etiam.</li>
												<li>Etiam vel felis viverra.</li>
												<li>Felis enim feugiat.</li>
												<li>Dolor pulvinar etiam.</li>
												<li>Etiam vel felis lorem.</li>
												<li>Felis enim et feugiat.</li>
											</ol>
											<h4>Icons</h4>
											<ul class="icons">
												<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
												<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
												<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
												<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
											</ul>
										</div>
									</div>
									<h3>Actions</h3>
									<div class="row">
										<div class="col-6 col-12-medium">
											<ul class="actions">
												<li><a href="#" class="button">Default</a></li>
												<li><a href="#" class="button">Default</a></li>
												<li><a href="#" class="button">Default</a></li>
											</ul>
											<ul class="actions small">
												<li><a href="#" class="button small">Small</a></li>
												<li><a href="#" class="button small">Small</a></li>
												<li><a href="#" class="button small">Small</a></li>
											</ul>
											<ul class="actions stacked">
												<li><a href="#" class="button">Default</a></li>
												<li><a href="#" class="button">Default</a></li>
												<li><a href="#" class="button">Default</a></li>
											</ul>
											<ul class="actions stacked">
												<li><a href="#" class="button small">Small</a></li>
												<li><a href="#" class="button small">Small</a></li>
												<li><a href="#" class="button small">Small</a></li>
											</ul>
										</div>
										<div class="col-6 col-12-medium">
											<ul class="actions stacked">
												<li><a href="#" class="button fit">Default</a></li>
												<li><a href="#" class="button fit">Default</a></li>
											</ul>
											<ul class="actions stacked">
												<li><a href="#" class="button small fit">Small</a></li>
												<li><a href="#" class="button small fit">Small</a></li>
											</ul>
										</div>
									</div>
								</section>

								<section>
									<h3>Table</h3>
									<h4>Default</h4>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
												</tr>
											</tfoot>
										</table>
									</div>

									<h4>Alternate</h4>
									<div class="table-wrapper">
										<table class="alt">
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</section>

								<section>
									<h3>Buttons</h3>
									<ul class="actions">
										<li><a href="#" class="button large">Large</a></li>
										<li><a href="#" class="button">Default</a></li>
										<li><a href="#" class="button small">Small</a></li>
									</ul>
									<ul class="actions fit">
										<li><a href="#" class="button fit">Fit</a></li>
										<li><a href="#" class="button fit">Fit</a></li>
										<li><a href="#" class="button fit">Fit</a></li>
									</ul>
									<ul class="actions fit small">
										<li><a href="#" class="button fit small">Fit + Small</a></li>
										<li><a href="#" class="button fit small">Fit + Small</a></li>
										<li><a href="#" class="button fit small">Fit + Small</a></li>
									</ul>
									<ul class="actions">
										<li><a href="#" class="button icon solid fa-download">Icon</a></li>
										<li><a href="#" class="button icon solid fa-upload">Icon</a></li>
										<li><a href="#" class="button icon solid fa-save">Icon</a></li>
									</ul>
									<ul class="actions">
										<li><span class="button disabled">Disabled</span></li>
										<li><span class="button disabled icon solid fa-download">Disabled</span></li>
									</ul>
								</section>

								<section>
									<h3>Form</h3>
									<form method="post" action="#">
										<div class="row gtr-uniform">
											<div class="col-6 col-12-xsmall">
												<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
											</div>
											<div class="col-6 col-12-xsmall">
												<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
											</div>
											<div class="col-12">
												<select name="demo-category" id="demo-category">
													<option value="">- Category -</option>
													<option value="1">Manufacturing</option>
													<option value="1">Shipping</option>
													<option value="1">Administration</option>
													<option value="1">Human Resources</option>
												</select>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="demo-priority-low" name="demo-priority" checked>
												<label for="demo-priority-low">Low</label>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="demo-priority-normal" name="demo-priority">
												<label for="demo-priority-normal">Normal</label>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="demo-priority-high" name="demo-priority">
												<label for="demo-priority-high">High</label>
											</div>
											<div class="col-6 col-12-small">
												<input type="checkbox" id="demo-copy" name="demo-copy">
												<label for="demo-copy">Email me a copy</label>
											</div>
											<div class="col-6 col-12-small">
												<input type="checkbox" id="demo-human" name="demo-human" checked>
												<label for="demo-human">Not a robot</label>
											</div>
											<div class="col-12">
												<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
											</div>
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="Send Message" /></li>
													<li><input type="reset" value="Reset" /></li>
												</ul>
											</div>
										</div>
									</form>
								</section>

								<section>
									<h3>Image</h3>
									<h4>Fit</h4>
									<div class="box alt">
										<div class="row gtr-uniform">
											<div class="col-12"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic05.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic06.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic06.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic05.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic05.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic06.jpg" alt="" /></span></div>
											<div class="col-4"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
										</div>
									</div>
									<h4>Left &amp; Right</h4>
									<p><span class="image left"><img src="images/pic07.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
									<p><span class="image right"><img src="images/pic04.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
								</section>

							</article>
						-->

						<!-- Pagination -->

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