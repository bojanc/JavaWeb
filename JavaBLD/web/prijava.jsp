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
						<h1><a href="ServletIndex" style="color:white;font-size: 20px;"><img style="filter: drop-shadow(1px 1px 1px rgba(46,186,174,1));" class="logo" src="images/logo2.png" width="50" height="50"></a></h1>
                                            <style>
                                                .logo:hover{
                                                    filter: drop-shadow(3px 4px 11px rgba(46,186,174,1)) !important;
                                                }
                                            </style>
						<nav class="links">
							<ul>
                                                            <li><a href="AdminPrikazDelova.jsp" style="color: #ffffff">Računarski delovi</a></li>
								<li><a href="#" style="color: #ffffff">Software i igrice</a></li>
								<li><a href="ServletAdminPrikazKonfiguracija" style="color: #ffffff">Konfiguracije</a></li>
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
							<!--<section>
								<ul class="links">
									<li>
										<a href="#">
											<h3>Lorem ipsum</h3>
											<p>Feugiat tempus veroeros dolor</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Dolor sit amet</h3>
											<p>Sed vitae justo condimentum</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Feugiat veroeros</h3>
											<p>Phasellus sed ultricies mi congue</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Etiam sed consequat</h3>
											<p>Porta lectus amet ultricies</p>
										</a>
									</li>
								</ul>-->
                                                        <section>
                                                            <ul class="actions stacked">
                                                                    <li><a href="registracija.jsp" class="button large fit"style="color:#fff;">Registracija</a></li>
                                                            </ul>
                                                        </section>
						<!-- Actions -->

					</section>
                                
                                <script>
                                    setTimeout(function() {
                                    $('#poruka').fadeOut('slow');
                                    }, 2000);
                                </script> 
                                
                                
                                
                                <script>
                                        function user()
                                                {
                                                        var user = /^[a-z\d]+\.?[a-z\d]+\@[a-z]{2,8}\.[a-z]{2,8}$/;
                                                        var tekst = document.getElementById('kor').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('kor').value=="")
                                                        {
                                                                document.getElementById('erroruser').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('erroruser').innerHTML="Unesite ispravno korisničko ime!";
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
                                                        var pass = /^[a-zA-Z]{6,10}[\d]{3,5}[!@#$%^&*?]{1}$/;
                                                        var tekst = document.getElementById('sif').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('sif').value=="")
                                                        {
                                                                document.getElementById('errorpass').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorpass').innerHTML="Lozinka mora da ima izmedju 6-10 karaktera, 3 cifre i jedan znak!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorpass').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                </script>
                                
                               
                                
                               

				<!-- Main -->
					<div id="main">
                                                <form method="post" action="ServletPrijava">
                                                    <article  class="post" style="width:50%;height: 100%;display: inline-block; text-align: center; margin-left: 25%;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);">
                                                    <div style="text-align: justify;display: inline-block;width: 30%;float:left;" >
                                                         
                                                            
                                                            <%
                                                               String poruka1 = (String)request.getAttribute("nepostoji");
                                                               if(poruka1!=null)
                                                               {%>
                                                            <h3 style="color:#f56a6a;" id="poruka">
                                                        <%= poruka1%>
                                                            </h3>
                                                            <%}
                                                            %>
                                                            
                                                            <%
                                                               String poruka2 = (String)request.getAttribute("polja");
                                                               if(poruka2!=null)
                                                               {%>
                                                        <h3 style="color:#f56a6a;" id="poruka">    
                                                        <%= poruka2%>
                                                        </h3><%}
                                                            %>
                                                            <label>Korisničko ime:</label>
                                                        <input type="text" name="korisnicko" id="kor" placeholder="Korisničko ime" style="width: 110%;" onchange="return user()">
                                                        <span class="help-block" id="erroruser" style="color:#f56a6a;white-space: nowrap;overflow: hidden;"></span><br>
                                                        <label>Šifra:</label>
                                                        <input type="password" name="sifra" id="sif" placeholder="Šifra" style="width: 110%;" onchange="return pass()">
                                                        <span class="help-block" id="errorpass" style="color:#f56a6a;white-space: nowrap;overflow: hidden;"></span><br>
                                                        <input type="submit" id="submit" value="Prijavi se" style="clear: both;">
                                                    </div>
                                                            
                                                    <div style="display:inline-block;float:right;">
                                                        <img src="images/logo.png" height="300" width="400">
                                                    </div>
                                                    
                                                    
                                                </form>

					</div>

				<!-- Footer -->
					<section id="footer">
						<p class="copyright">&copy; BLD by Bojan Ćulibrk</a>.</p>
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