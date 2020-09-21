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
	</head>
	<body class="single is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="index.html">BLD</a></h1>
						<nav class="links">
							<ul>
                                                            <li><a href="#" style="color: #ffffff">Lorem</a></li>
								<li><a href="#" style="color: #ffffff">Ipsum</a></li>
								<li><a href="#" style="color: #ffffff">Feugiat</a></li>
								<li><a href="#" style="color: #ffffff">Tempus</a></li>
								<li><a href="#" style="color: #ffffff">Adipiscing</a></li>
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

				<!-- Main -->
					<div id="main">
                                                <form method="post" action="ServletRegistracija" class="post" style="width:50%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Korisnička slika</label>
                                                        <input type="file" onChange="readURL(this)"><br><br>
                                                        <img id="pic" src="#" alt="" style="border-radius: 50%;"/>
                                                    </div>
                                                    <div>
                                                        <input type="text" name="ime" placeholder="Ime" style="width: 40%; margin:0 !important;"><br>
                                                        <input type="text" name="prezime" placeholder="Prezime" style="width: 40%;"><br>
                                                        <input type="text" name="korisnicko" placeholder="Korisničko ime" style="width: 40%;"><br>
                                                        <input type="password" name="sifra" placeholder="Šifra" style="width: 40%;"><br>
                                                        <input type="password" name="sifrap" placeholder="Potvrda šifre" style="width: 40%;"><br>
                                                    </div>
                                                    
                                                    <input type="submit" value="Registruj se">
                                                    <input type="reset" value="Poništi">
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