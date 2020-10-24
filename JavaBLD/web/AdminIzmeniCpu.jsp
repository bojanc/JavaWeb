<%@page import="entity.Korisnici"%>
<%@page import="entity.Procesori"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Single - Future Imperfect by HTML5 UP</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	</head>
	<body class="single is-preload">

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
								<ul class="actions stacked">
									<li><a href="#" class="button large fit" style="color:#fff;">Prijava</a></li>
								</ul>
							</section>

					</section>
                                
                                <script>
                                    function readURL(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                </script>
                                
                                <script>
                                    setTimeout(function() {
                                    $('#poruka').fadeOut('slow');
                                    }, 2000);
                                </script> 
                                
                                <script>
                                        function user()
                                                {
                                                        var naziv = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('cpunaziv').value;
                                                        var rezultat = tekst.match(naziv);
                                                        if(document.getElementById('cpunaziv').value=="")
                                                        {
                                                                document.getElementById('errorcpunaziv').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorcpunaziv').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorcpunaziv').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }

                                                function pass()
                                                {
                                                        var pass = /^[\d]\.[\d]{1,2} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('frek').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('frek').value=="")
                                                        {
                                                                document.getElementById('errorfrek').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorfrek').innerHTML="Unesite ispravnu frekvenciju!(3.90 Ghz)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorfrek').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function boostcheck()
                                                {
                                                        var pass = /^[\d]\.[\d]{1,2} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('bbost').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('bbost').value=="")
                                                        {
                                                                document.getElementById('errorboost').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorboost').innerHTML="Unesite ispravnu frekvenciju!(3.90 Ghz)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorboost').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function tdpcheck()
                                                {
                                                        var pass = /^[\d]{1,3} W$/;
                                                        var tekst = document.getElementById('tdpp').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('tdpp').value=="")
                                                        {
                                                                document.getElementById('errortdp').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errortdp').innerHTML="Unesite ispravnu voltažu!(60 W)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errortdp').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function igpucheck()
                                                {
                                                        var naziv = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('igp').value;
                                                        var rezultat = tekst.match(naziv);
                                                        if(document.getElementById('igp').value=="")
                                                        {
                                                                document.getElementById('errorigpu').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorigpu').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorigpu').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                $('#submit').attr('disabled','disabled');
                                                
                                </script>
                                
                                <%
                                    Procesori cpu = (Procesori)request.getAttribute("cpu");
                                %>

				<!-- Main -->
					<div id="main">
                                                <form method="post" action="ServletAdminIzmeniDeo?id=<%= cpu.getProcesorId()%>&deo=procesori&naziv=procesorID"  id="memorija" class="post" style="width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika procesora</label>
                                                        <input type="file" name="file" onChange="readURL(this)"><br><br>
                                                        <img id="pic" src="<%= cpu.getImgPath() %>" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        
                                                            
                                                            <%
                                                               String porukamem = (String)request.getAttribute("praznaPolja");
                                                               if(porukamem!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= porukamem%>
                                                        </h3><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukamem1 = (String)request.getAttribute("praznaSlika");
                                                               if(porukamem1!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= porukamem1%>
                                                        </h3><%}
                                                            %>
                                                            <input type="text" name="naziv" placeholder="Naziv" id="cpunaziv" value="<%= cpu.getNaziv() %>" style="width: 40%; margin:0 !important;" onchange="return user()">
                                                            <span class="help-block" id="errorcpunaziv" style="color:#f56a6a;"></span><br>
                                                         <select name="brojjez" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Broj jezgara</option>
                                                                <option value="4" <% if(cpu.getBrojJezgara()==4){ %> selected <%}%>>4</option>
                                                                <option value="6" <% if(cpu.getBrojJezgara()==6){ %> selected <%}%>>6</option>
                                                                <option value="8" <% if(cpu.getBrojJezgara()==8){ %> selected <%}%>>8</option>
                                                                <option value="10" <% if(cpu.getBrojJezgara()==10){ %> selected <%}%>>10</option>
                                                                <option value="12" <% if(cpu.getBrojJezgara()==12){ %> selected <%}%>>12</option>
                                                                <option value="16" <% if(cpu.getBrojJezgara()==16){ %> selected <%}%>>16</option>
                                                                <option value="32" <% if(cpu.getBrojJezgara()==32){ %> selected <%}%>>32</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="socket" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Socket</option>
                                                                <option value="AM4" <% if(cpu.getSocket().equals("AM4")){ %> selected <%}%>>AM4</option>
                                                                <option value="LGA1151" <% if(cpu.getSocket().equals("LGA1151")){ %> selected <%}%>>LGA1151</option>
                                                                <option value="LGA2011-3" <% if(cpu.getSocket().equals("LGA2011-3")){ %> selected <%}%>>LGA2011-3</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="text" name="frekv" id="frek" placeholder="Frekvencija" value="<%= cpu.getFrekvencija() %>" style="width: 40%;" onchange="return pass()">
                                                        <span class="help-block" id="errorfrek" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="boost"placeholder="Boost clock" id="bbost" value="<%= cpu.getBoost()%>" style="width: 40%;" onchange="return boostcheck()">
                                                        <span class="help-block" id="errorboost" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="number" name="tdp" placeholder="TDP" min="5" max="1000" step="5" value="<%= cpu.getTdp() %>" style="width: 40%;">
                                                         <input type="text" id="subdomaintwo" value="W" disabled/><br><br>
                                                        
                                                         <style>
                                                            input[type="text"]#subdomaintwo{
                                                            -webkit-appearance:none!important;
                                                            color:black;
                                                            text-align:right;
                                                            width:65px;;
                                                            border: none;
                                                            margin:0 0 0 -87px;
                                                            background:white;
                                                            display:inline-block;
                                                            padding-left: 0;
                                                            height:32px;
                                                        }
                                                        </style>
                                                        <input type="text" name="igpu" placeholder="iGPU" id="igp" style="width: 40%;" value="<%= cpu.getIgpu() %>" onchange="return igpucheck()">
                                                        <span class="help-block" id="errorigpu" style="color:#f56a6a;"></span><br>
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Izmeni">
                                                </form>

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