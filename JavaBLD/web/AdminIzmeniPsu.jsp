<%@page import="entity.Korisnici"%>
<%@page import="entity.Psu"%>
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
								<li><a href="ServletAdminPrikazIgrica" style="color: #ffffff">Software i igrice</a></li>
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
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('psunaziv').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('psunaziv').value=="")
                                                        {
                                                                document.getElementById('erroruser').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('erroruser').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('erroruser').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }

                                                function pass()
                                                {
                                                        var pass = /^[\d]{2,3} W$/;
                                                        var tekst = document.getElementById('wat').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('wat').value=="")
                                                        {
                                                                document.getElementById('errorpass').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorpass').innerHTML="Unesite ispravnu jačinu(750 W)!";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorpass').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                $('#submit').attr('disabled','disabled');
                                                
                                </script>
                                
                                <%
                                    Psu psu = (Psu)request.getAttribute("psu");
                                %>

				<!-- Main -->
					<div id="main">
                                                <form method="post" action="ServletAdminIzmeniDeo?id=<%= psu.getPsuId()%>&deo=psu&naziv=psuID"  id="memorija" class="post" style="width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika napajanja</label>
                                                        <input type="file" name="file" onChange="readURL(this)"><br><br>
                                                        <img id="pic" src="<%= psu.getImgPath() %>" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        
                                                            
                                                            <%
                                                               String porukapsu = (String)request.getAttribute("praznaPolja");
                                                               if(porukapsu!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= porukapsu%>
                                                        </h3><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukapsu1 = (String)request.getAttribute("praznaSlika");
                                                               if(porukapsu1!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= porukapsu1%>
                                                        </h3><%}
                                                            %>
                                                        
                                                            <input type="text" name="naziv" id="psunaziv" placeholder="Naziv" value="<%= psu.getNaziv() %>" style="width: 40%; margin:0 !important;" onchange="return user()">
                                                            <span class="help-block" id="erroruser" style="color:#f56a6a;"></span><br>
                                                        <select name="efikasnost" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Efikasnost</option>
                                                                <option value="Bronze" <% if(psu.getEfikasnost().equals("Bronze")){ %> selected <%}%>>80+ Bronze</option>
                                                                <option value="Silver" <% if(psu.getEfikasnost().equals("Silver")){ %> selected <%}%>>80+ Silver</option>
                                                                <option value="Gold" <% if(psu.getEfikasnost().equals("Gold")){ %> selected <%}%>>80+ Gold</option>
                                                                <option value="Platinum" <% if(psu.getEfikasnost().equals("Platinum")){ %> selected <%}%>>80+ Platinum</option>
                                                                <option value="Titanium" <% if(psu.getEfikasnost().equals("Titanium")){ %> selected <%}%>>80+ Titanium</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="number" name="tdp" placeholder="TDP" min="5" max="1000" step="5" value="<%= psu.getJacina() %>" style="width: 40%;">
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
                                                        <select name="modul" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Modularnost</option>
                                                                <option value="Semi" <% if(psu.getModularnost().equals("Semi")){ %> selected <%}%>>Semi</option>
                                                                <option value="Full" <% if(psu.getModularnost().equals("Full")){ %> selected <%}%>>Full</option>
                                                                <option value="No" <% if(psu.getModularnost().equals("No")){ %> selected <%}%>>No</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
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