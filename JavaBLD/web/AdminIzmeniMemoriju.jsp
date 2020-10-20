<%@page import="entity.Korisnici"%>
<%@page import="entity.Memorija"%>
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
                                                        var tekst = document.getElementById('memnaziv').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('memnaziv').value=="")
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
                                                $('#submit').attr('disabled','disabled');
                                                
                                </script>
                                
                                <%
                                    Memorija mem = (Memorija)request.getAttribute("memorija");
                                %>

				<!-- Main -->
					<div id="main">
                                                <form method="post" action="ServletAdminIzmeniDeo?id=<%= mem.getMemorijaId()%>&deo=memorija&naziv=memorijaID"  id="memorija" class="post" style="width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika memorije</label>
                                                        <input type="file" name="file" onChange="readURL(this)"><br><br>
                                                        <img id="pic" src="<%= mem.getImgPath() %>" alt=""/>
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
                                                          </h3>
                                                        <input type="text" name="naziv" placeholder="Naziv" id="memnaziv" value="<%= mem.getNaziv() %>" style="width: 40%; margin:0 !important;" onchange="return user()">
                                                        <span class="help-block" id="erroruser" style="color:#f56a6a;"></span><br>
                                                        <select name="kapacitet" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Kapacitet</option>
                                                                <option value="128GB" <% if(mem.getKapacitet().equals("128GB")){ %> selected <%}%>>128GB</option>
                                                                <option value="256GB" <% if(mem.getKapacitet().equals("256GB")){ %> selected <%}%>>256GB</option>
                                                                <option value="512GB" <% if(mem.getKapacitet().equals("512GB")){ %> selected <%}%>>512GB</option>
                                                                <option value="1TB" <% if(mem.getKapacitet().equals("1TB")){ %> selected <%}%>>1TB</option>
                                                                <option value="2TB" <% if(mem.getKapacitet().equals("2TB")){ %> selected <%}%>>2TB</option>
                                                                <option value="4TB" <% if(mem.getKapacitet().equals("4TB")){ %> selected <%}%>>4TB</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="tip" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Tip</option>
                                                                <option value="5200RPM" <% if(mem.getTip().equals("5200RPM")){ %> selected <%}%>>5200RPM</option>
                                                                <option value="7200RPM" <% if(mem.getTip().equals("7200RPM")){ %> selected <%}%>>7200RPM</option>
                                                                <option value="SSD" <% if(mem.getTip().equals("SSD")){ %> selected <%}%>>SSD</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="cache" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Cache</option>
                                                                <option value="512MB"  <% if(mem.getCache().equals("512MB")){ %> selected <%}%>>512MB</option>
                                                                <option value="1024MB"  <% if(mem.getCache().equals("1024MB")){ %> selected <%}%>>1024MB</option>
                                                                <option value="2048MB"  <% if(mem.getCache().equals("2048MB")){ %> selected <%}%>>2048MB</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="dimenzije" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Dimenzije</option>
                                                                <option value="PCI-E"  <% if(mem.getDimenzije().equals("PCI-E")){ %> selected <%}%>>PCI-E</option>
                                                                <option value="2.5"  <% if(mem.getDimenzije().equals("2.5")){ %> selected <%}%>>2.5"</option>
                                                                <option value="3.5"  <% if(mem.getDimenzije().equals("3.5")){ %> selected <%}%>>3.5"</option>
                                                                <option value="M.2"  <% if(mem.getDimenzije().equals("M.2")){ %> selected <%}%>>M.2</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="interfejs" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Interfejs</option>
                                                                <option value="PCI" <% if(mem.getInterfejs().equals("PCI")){ %> selected <%}%>>PCI</option>
                                                                <option value="SATA6" <% if(mem.getInterfejs().equals("SATA6")){ %> selected <%}%>>SATA 6Gb/s</option>
                                                                <option value="SATA3" <% if(mem.getInterfejs().equals("SATA3")){ %> selected <%}%>>SATA 3Gb/s</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="number" name="tdp" placeholder="TDP" min="5" max="1000" step="5" value="<%= mem.getTdp() %>" style="width: 40%;"><br><br>
                                                        
                                                        
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