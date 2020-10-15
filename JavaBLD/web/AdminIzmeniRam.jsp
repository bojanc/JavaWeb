<%@page import="entity.Korisnici"%>
<%@page import="entity.Ram"%>
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
                                                        var tekst = document.getElementById('ramnaziv').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('ramnaziv').value=="")
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
                                    Ram ram = (Ram)request.getAttribute("ram");
                                %>

				<!-- Main -->
					<div id="main" style="height:450px;">
                                                <form method="post" action="ServletAdminIzmeniDeo?id=<%= ram.getRamId()%>&deo=ram&naziv=ramID"  id="memorija" class="post" style="width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika RAM-a</label>
                                                        <input type="file" name="file" onChange="readURL(this)"><br><br>
                                                        <img id="pic" src="<%= ram.getImgPath() %>" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        
                                                            
                                                            <%
                                                               String porukaram = (String)request.getAttribute("praznaPolja");
                                                               if(porukaram!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= porukaram%>
                                                        </h3><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukaram1 = (String)request.getAttribute("praznaSlika");
                                                               if(porukaram1!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= porukaram1%>
                                                        </h3><%}
                                                            %>
                                                        
                                                        <input type="text" name="naziv" placeholder="Naziv" id="ramnaziv" value="<%= ram.getNaziv() %>"style="width: 40%; margin:0 !important;" onchange="return user()">
                                                        <span class="help-block" id="erroruser" style="color:#f56a6a;"></span><br>
                                                        <select name="brzina" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Brzina</option>
                                                                <option value="4GB DDR42400" <% if(ram.getBrzina().equals("4GB DDR42400")){ %> selected <%}%>>4GB DDR4 2400mHz</option>
                                                                <option value="8GB DDR42400" <% if(ram.getBrzina().equals("8GB DDR42400")){ %> selected <%}%>>8GB DDR4 2400mHz</option>
                                                                <option value="4GB DDR43000" <% if(ram.getBrzina().equals("4GB DDR43000")){ %> selected <%}%>>4GB DDR4 3000mHz</option>
                                                                <option value="8GB DDR43000" <% if(ram.getBrzina().equals("8GB DDR43000")){ %> selected <%}%>>8GB DDR4 3000mHz</option>
                                                                <option value="4GB DDR43200" <% if(ram.getBrzina().equals("4GB DDR43200")){ %> selected <%}%>>4GB DDR4 3200mHz</option>
                                                                <option value="8GB DDR43200" <% if(ram.getBrzina().equals("8GB DDR43200")){ %> selected <%}%>>8GB DDR4 3200mHz</option>
                                                                <option value="16GB DDR43200" <% if(ram.getBrzina().equals("16GB DDR43200")){ %> selected <%}%>>16GB DDR4 3200mHz</option>
                                                                <option value="32GB DDR43200" <% if(ram.getBrzina().equals("32GB DDR43200")){ %> selected <%}%>>32GB DDR4 3200mHz</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="number" name="caslat" placeholder="CAS latency" value="<%= ram.getCasLat() %>" max="24" min="9" step="1" style="width: 40%;"><br><br>
                                                        
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