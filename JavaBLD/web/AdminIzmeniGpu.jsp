<%@page import="entity.Korisnici"%>
<%@page import="entity.Gpu"%>
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
                                                    .width(250)
                                                    .height(250);
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
                                                        var tekst = document.getElementById('gpuname').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('gpuname').value=="")
                                                        {
                                                                document.getElementById('erroruser').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('erroruser').innerHTML="Unesite ispravan naziv!!";
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
                                                        var pass = /^[\d]{3,4} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('corecl').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('corecl').value=="")
                                                        {
                                                                document.getElementById('errorpass').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorpass').innerHTML="Unesite ispravnu frekvenciju!(1700 Mhz)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorpass').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function boostcheck()
                                                {
                                                        var pass = /^[\d]{3,4} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('boostcl').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('boostcl').value=="")
                                                        {
                                                                document.getElementById('errorboost').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorboost').innerHTML="Unesite ispravnu frekvenciju!(1700 Mhz)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorboost').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                $('#submit').attr('disabled','disabled');
                                                
                                </script>
                                
                                <%
                                    Gpu gpu = (Gpu)request.getAttribute("gpu");
                                %>

				<!-- Main -->
					<div id="main">
                                                <form method="post" action="ServletAdminIzmeniDeo?id=<%= gpu.getGpuId() %>&deo=gpu&naziv=gpuID" id="gpu" class="post" style=" width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika grafičke kartice</label>
                                                        <input type="file" name="file" onChange="readURL(this)"><br><br>
                                                        <img id="pic" src="<%= gpu.getImgPath() %>" alt=""/>
                                                    </div>
                                                    <div>
                                                         
                                                            
                                                            <%
                                                               String poruka1 = (String)request.getAttribute("praznaPolja");
                                                               if(poruka1!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= poruka1%>
                                                        </h3><%}
                                                            %>
                                                            
                                                            <%
                                                               String poruka = (String)request.getAttribute("praznaSlika");
                                                               if(poruka!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= poruka%>
                                                        </h3><%}
                                                            %>
                                                          <input type="text" name="naziv" placeholder="Naziv" id="gpuname" value="<%= gpu.getNaziv() %>" style="width: 40%; margin:0 !important;" onchange="return user()">
                                                          <span class="help-block" id="erroruser" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="coreclock" id="corecl" value="<%= gpu.getCoreCl() %>" placeholder="Core clock" style="width: 40%;" onchange="return pass()">
                                                        <span class="help-block" id="errorpass" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="boostclock" id="boostcl" value="<%= gpu.getBoostCl()%>" placeholder="Boost clock" style="width: 40%;" onchange="return boostcheck()">
                                                        <span class="help-block" id="errorboost" style="color:#f56a6a;"></span><br>
                                                        
                                                        <select name="memorija" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Memorija</option>
                                                                <option value="4GB" <% if(gpu.getMemorija().equals("4GB")){ %> selected<%}%>>4 GB</option>
                                                                <option value="8GB"  <% if(gpu.getMemorija().equals("8GB")){ %> selected<%}%>>8 GB</option>
                                                                <option value="11GB"  <% if(gpu.getMemorija().equals("11GB")){ %> selected<%}%>>11 GB</option>
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