<%@page import="entity.Korisnici"%>
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
                                    function readURL1(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic1')
                                                    .attr('src', e.target.result)
                                                    .width(250)
                                                    .height(250);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL2(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic2')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL3(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic3')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL4(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic4')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL5(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic5')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL6(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic6')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL7(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic7')
                                                    .attr('src', e.target.result)
                                                    .width(150)
                                                    .height(150);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                    
                                    function readURL8(input) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#pic8')
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
                                        function gpucheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('gpuname').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('gpuname').value=="")
                                                        {
                                                                document.getElementById('errorgpucheck').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorgpucheck').innerHTML="Unesite ispravan naziv!!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorgpucheck').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }

                                                function corecheck()
                                                {
                                                        var pass = /^[\d]{3,4} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('checkcorecl').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('checkcorecl').value=="")
                                                        {
                                                                document.getElementById('errorcore').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorcore').innerHTML="Unesite ispravnu frekvenciju!(1700 Mhz)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorcore').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function boostcheck()
                                                {
                                                        var pass = /^[\d]{3,4} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('checkboostcl').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('checkboostcl').value=="")
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
                                                
                                                function kucistecheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('kucistenaziv').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('kucistenaziv').value=="")
                                                        {
                                                                document.getElementById('errorcasenaziv').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorcasenaziv').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorcasenaziv').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }

                                                function kucistedimcheck()
                                                {
                                                        var pass = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('kucdim').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('kucdim').value=="")
                                                        {
                                                                document.getElementById('errorkucdim').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorkucdim').innerHTML="Unesite ispravne dimenzije!";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorkucdim').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function coolercheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('colname').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('colname').value=="")
                                                        {
                                                                document.getElementById('errorcoolername').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorcoolername').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorcoolername').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }

                                                function bukcheck()
                                                {
                                                        var pass = /^[\d]{2,3} dB$/;
                                                        var tekst = document.getElementById('buk').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('buk').value=="")
                                                        {
                                                                document.getElementById('errorbuk').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorbuk').innerHTML="Unesite ispravan nivo buke!(60 dB)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorbuk').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function radimcheck()
                                                {
                                                        var pass = /^[\d]{2,3} mm$/;
                                                        var tekst = document.getElementById('radim').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('radim').value=="")
                                                        {
                                                                document.getElementById('errorradim').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorradim').innerHTML="Unesite ispravne dimenzije!(250 mm)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorradim').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function mobocheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('moboname').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('moboname').value=="")
                                                        {
                                                                document.getElementById('errormobo').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errormobo').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errormobo').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function memcheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('memnaziv').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('memnaziv').value=="")
                                                        {
                                                                document.getElementById('errormem').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errormem').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errormem').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function cpucheck()
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

                                                function frekcheck()
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
                                                
                                                function boostcheckcpu()
                                                {
                                                        var pass = /^[\d]\.[\d]{1,2} [a-zA-Z]{3}$/;
                                                        var tekst = document.getElementById('bbost').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('bbost').value=="")
                                                        {
                                                                document.getElementById('errorboostcpu').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorboostcpu').innerHTML="Unesite ispravnu frekvenciju!(3.90 Ghz)";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorboostcpu').innerHTML="";
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
                                                
                                                function psucheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('psunaziv').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('psunaziv').value=="")
                                                        {
                                                                document.getElementById('errorpsu').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorpsu').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorpsu').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }

                                                function watcheck()
                                                {
                                                        var pass = /^[\d]{2,3} W$/;
                                                        var tekst = document.getElementById('wat').value;
                                                        var rezultat = tekst.match(pass);
                                                        if(document.getElementById('wat').value=="")
                                                        {
                                                                document.getElementById('errorwat').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorwat').innerHTML="Unesite ispravnu jačinu(750 W)!";
                                                                $('#submit').prop('disabled', true);
                                                                
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorwat').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                
                                                function ramcheck()
                                                {
                                                        var user = /^[a-zA-Z0-9 ]*$/;
                                                        var tekst = document.getElementById('ramm').value;
                                                        var rezultat = tekst.match(user);
                                                        if(document.getElementById('ramm').value=="")
                                                        {
                                                                document.getElementById('errorramm').innerHTML="";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else if(rezultat==null)
                                                        {
                                                                document.getElementById('errorramm').innerHTML="Unesite ispravan naziv!";
                                                                $('#submit').prop('disabled', true);
                                                        }
                                                        else
                                                        {
                                                                document.getElementById('errorramm').innerHTML="";
                                                                $('#submit').prop('disabled', false);
                                                        }
                                                }
                                                $('#submit').attr('disabled','disabled');
                                                
                                </script>
                                
                                <script>
                                    function provera(that) {
                                        if (that.value == "gpu") {
                                            document.getElementById("gpu").style.display = "block";
                                        } else {
                                            document.getElementById("gpu").style.display = "none";
                                        } if(that.value=="kuciste"){
                                            document.getElementById("kuciste").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("kuciste").style.display = "none";
                                        } if(that.value=="kuleri"){
                                            document.getElementById("kuleri").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("kuleri").style.display = "none";
                                        } if(that.value=="maticna"){
                                            document.getElementById("maticna").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("maticna").style.display = "none";
                                        } if(that.value=="memorija"){
                                            document.getElementById("memorija").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("memorija").style.display = "none";
                                        } if(that.value=="procesori"){
                                            document.getElementById("procesori").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("procesori").style.display = "none";
                                        } if(that.value=="psu"){
                                            document.getElementById("psu").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("psu").style.display = "none";
                                        } if(that.value=="ram"){
                                            document.getElementById("ram").style.display = "block";
                                        }
                                        else{
                                            document.getElementById("ram").style.display = "none";
                                        }
                                    }
                                </script>
                                
                                <%
                                    String gpupok="";
                                    String kucistepok="";
                                    String kulerpok="";
                                    String maticnapok="";
                                    String mempok="";
                                    String cpupok="";
                                    String psupok="";
                                    String rampok="";
                                    
                                    if(request.getAttribute("gpuPokazi")!=null){
                                     gpupok = (String)request.getAttribute("gpuPokazi");
                                     }
                                    
                                    if(request.getAttribute("kucistePokazi")!=null){
                                     kucistepok = (String)request.getAttribute("kucistePokazi");
                                     }
                                    
                                    if(request.getAttribute("kulerPokazi")!=null){
                                     kulerpok = (String)request.getAttribute("kulerPokazi");
                                     }
                                    
                                    if(request.getAttribute("maticnaPokazi")!=null){
                                     maticnapok = (String)request.getAttribute("maticnaPokazi");
                                     }
                                    
                                    if(request.getAttribute("memorijaPokazi")!=null){
                                     mempok = (String)request.getAttribute("memorijaPokazi");
                                     }
                                    
                                    if(request.getAttribute("cpuPokazi")!=null){
                                     cpupok = (String)request.getAttribute("cpuPokazi");
                                     }
                                    
                                    if(request.getAttribute("psuPokazi")!=null){
                                     psupok = (String)request.getAttribute("psuPokazi");
                                     }
                                    
                                    if(request.getAttribute("ramPokazi")!=null){
                                     rampok = (String)request.getAttribute("ramPokazi");
                                     }
                                %>

				<!-- Main -->
					<div id="main">
                                            <label style="margin: auto; margin-left: 17.5%;">Izaberite koji deo želite da unesete</label>
                                            <select onchange="provera(this);" style="width: 65%; margin: auto;">
                                                <option value="" disabled selected="">Delovi</option>
                                                <optgroup>
                                                    <option value="gpu" <% if(gpupok.equals("da")){ %> selected <% } %>>Grafičke kartice</option>
                                                    <option value="kuciste" <% if(kucistepok.equals("da")){ %> selected <% } %>>Kučišta</option>
                                                    <option value="kuleri" <% if(kulerpok.equals("da")){ %> selected <% } %>>Kuleri</option>
                                                    <option value="maticna"  <% if(maticnapok.equals("da")){ %> selected <% } %>>Matične</option>
                                                    <option value="memorija" <% if(mempok.equals("da")){ %> selected <% } %>>Memorije</option>
                                                    <option value="procesori" <% if(cpupok.equals("da")){ %> selected <% } %>>Procesori</option>
                                                    <option value="psu" <% if(psupok.equals("da")){ %> selected <% } %>>Napajanja</option>
                                                    <option value="ram" <% if(rampok.equals("da")){ %> selected <% } %>>RAM</option>
                                                </optgroup>
                                            </select><br>
                                            
                                                        
                                            
                                                            <form method="post" action="ServletAdminDodajGpu" id="gpu" class="post" style="<% if(gpupok!=null){if(gpupok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%> width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika grafičke kartice</label>
                                                        <input type="file" name="file" onChange="readURL1(this)"><br><br>
                                                        <img id="pic1" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                         <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String poruka1 = (String)request.getAttribute("praznaPoljaGpu");
                                                               if(poruka1!=null)
                                                               {%><%= poruka1%><%}
                                                            %>
                                                            
                                                            <%
                                                               String poruka = (String)request.getAttribute("praznaSlikaGpu");
                                                               if(poruka!=null)
                                                               {%><%= poruka%><%}
                                                               
                                                            %>
                                                          </h3>
                                                          <input type="text" name="naziv" id="gpuname" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return gpucheck()">
                                                        <span class="help-block" id="errorgpucheck" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="coreclock" id="checkcorecl" placeholder="Core clock" style="width: 40%;" onchange="return corecheck()">
                                                        <span class="help-block" id="errorcore" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="boostclock" id="checkboostcl" placeholder="Boost clock" style="width: 40%;" onchange="return boostcheck()">
                                                        <span class="help-block" id="errorboost" style="color:#f56a6a;"></span><br>
                                                        
                                                        <select name="memorija" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Memorija</option>
                                                                <option value="4GB">4 GB</option>
                                                                <option value="8GB">8 GB</option>
                                                                <option value="11GB">11 GB</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                <form method="post" action="ServletAdminDodajKuciste" id="kuciste" class="post" style="<% if(kucistepok!=null){if(kucistepok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%> width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika kućišta</label>
                                                        <input type="file" name="file" onChange="readURL2(this)"><br><br>
                                                        <img id="pic2" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukakuc = (String)request.getAttribute("praznaPoljaKuciste");
                                                               if(porukakuc!=null)
                                                               {%><%= porukakuc%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukaslik = (String)request.getAttribute("praznaSlikaKuciste");
                                                               if(porukaslik!=null)
                                                               {%><%= porukaslik%><%}
                                                               
                                                            %>
                                                          </h3>
                                                        
                                                          <input type="text" name="naziv" id="kucistenaziv" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return kucistecheck()">
                                                        <span class="help-block" id="errorcasenaziv" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="dimenzije" id="kucdim" placeholder="Dimenzije" style="width: 40%;" onchange="return kucistedimcheck()">
                                                        <span class="help-block" id="errorkucdim" style="color:#f56a6a;"></span><br>
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                <form method="post" action="ServletAdminDodajKuler" id="kuleri" class="post" style="<% if(kulerpok!=null){if(kulerpok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%>  width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika kulera</label>
                                                        <input type="file" name="file" onChange="readURL3(this)"><br><br>
                                                        <img id="pic3" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukakul = (String)request.getAttribute("praznaPoljaKuler");
                                                               if(porukakul!=null)
                                                               {%><%= porukakul%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukaslikakul = (String)request.getAttribute("praznaSlikaKuler");
                                                               if(porukaslikakul!=null)
                                                               {%><%= porukaslikakul%><%}
                                                               
                                                            %>
                                                          </h3>
                                                        
                                                          <input type="text" name="naziv" id="colname" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return coolercheck()">
                                                        <span class="help-block" id="errorcoolername" style="color:#f56a6a;"></span><br>
                                                        <input type="number" name="rpm" placeholder="RPM" min="500" max="5000" step="100" style="width: 40%;"><br><br>
                                                        
                                                        <input type="text" name="buka" id="buk" placeholder="Nivo buke" style="width: 40%;" onchange="return bukcheck()">
                                                        <span class="help-block" id="errorbuk" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="dimenzije" id="radim" placeholder="Dimenzije" style="width: 40%;" onchange="return radimcheck()">
                                                        <span class="help-block" id="errorradim" style="color:#f56a6a;"></span><br>
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                          
                                                <form method="post" action="ServletAdminDodajMaticnu" id="maticna" class="post" style="<% if(maticnapok!=null){if(maticnapok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%>  width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika matične ploče</label>
                                                        <input type="file" name="file" onChange="readURL4(this)"><br><br>
                                                        <img id="pic4" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukamat = (String)request.getAttribute("praznaPoljaMaticna");
                                                               if(porukamat!=null)
                                                               {%><%= porukamat%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukamat1 = (String)request.getAttribute("praznaSlikaMaticna");
                                                               if(porukamat1!=null)
                                                               {%><%= porukamat1%><%}
                                                               
                                                            %>
                                                          </h3>
                                                          
                                                          <input type="text" name="naziv" id="moboname" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return mobocheck()">
                                                        <span class="help-block" id="errormobo" style="color:#f56a6a;"></span><br>
                                                        <select name="socket" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Socket</option>
                                                                <option value="AM4">AM4</option>
                                                                <option value="LGA1151">LGA1151</option>
                                                                <option value="LGA1200">LGA1200</option>
                                                                <option value="LGA2011-3">LGA2011-3</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="velicina" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Veličina</option>
                                                                <option value="ATX">ATX</option>
                                                                <option value="Micro ATX">Micro ATX</option>
                                                                <option value="Mini ITX">Mini ITX</option>
                                                                <option value="EATX">EATX</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="maxram" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Podržana memorija</option>
                                                                <option value="32">32 GB</option>
                                                                <option value="64">64 GB</option>
                                                                <option value="128">128 GB</option>
                                                                <option value="256">256 GB</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                         <select name="ramslots" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Podržani RAM slotovi</option>
                                                                <option value="2">2</option>
                                                                <option value="4">4</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                          
                                                          
                                                <form method="post" action="ServletAdminDodajMemoriju" id="memorija" class="post" style="<% if(mempok!=null){if(mempok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%> width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika memorije</label>
                                                        <input type="file" name="file" onChange="readURL5(this)"><br><br>
                                                        <img id="pic5" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukamem = (String)request.getAttribute("praznaPoljaMemorija");
                                                               if(porukamem!=null)
                                                               {%><%= porukamem%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukamem1 = (String)request.getAttribute("praznaSlikaMemorija");
                                                               if(porukamem1!=null)
                                                               {%><%= porukamem1%><%}
                                                               
                                                            %>
                                                          </h3>
                                                          <input type="text" name="naziv" id="memnaziv" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return memcheck()">
                                                        <span class="help-block" id="errormem" style="color:#f56a6a;"></span><br>
                                                        <select name="kapacitet" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Kapacitet</option>
                                                                <option value="128GB">128GB</option>
                                                                <option value="256GB">256GB</option>
                                                                <option value="512GB">512GB</option>
                                                                <option value="1TB">1TB</option>
                                                                <option value="2TB">2TB</option>
                                                                <option value="4TB">4TB</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="tip" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Tip</option>
                                                                <option value="5200RPM">5200RPM</option>
                                                                <option value="7200RPM">7200RPM</option>
                                                                <option value="SSD">SSD</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="cache" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Cache</option>
                                                                <option value="512MB">512MB</option>
                                                                <option value="1024MB">1024MB</option>
                                                                <option value="2048MB">2048MB</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="dimenzije" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Dimenzije</option>
                                                                <option value="PCI-E">PCI-E</option>
                                                                <option value="2.5">2.5"</option>
                                                                <option value="3.5">3.5"</option>
                                                                <option value="M.2">M.2</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="interfejs" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Interfejs</option>
                                                                <option value="PCI">PCI</option>
                                                                <option value="SATA6">SATA 6Gb/s</option>
                                                                <option value="SATA3">SATA 3Gb/s</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                          
                                                <form method="post" action="ServletAdminDodajProcesor" id="procesori" class="post" style="<% if(cpupok!=null){if(cpupok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%> width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika procesora</label>
                                                        <input type="file" name="file" onChange="readURL6(this)"><br><br>
                                                        <img id="pic6" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukacpu = (String)request.getAttribute("praznaPoljaCpu");
                                                               if(porukacpu!=null)
                                                               {%><%= porukacpu%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukacpu1 = (String)request.getAttribute("praznaSlikaCpu");
                                                               if(porukacpu1!=null)
                                                               {%><%= porukacpu1%><%}
                                                               
                                                            %>
                                                          </h3>
                                                        <input type="text" name="naziv" id="cpunaziv" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return cpucheck()">
                                                        <span class="help-block" id="errorcpunaziv" style="color:#f56a6a;"></span><br>
                                                         <select name="brojjez" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Broj jezgara</option>
                                                                <option value="4">4</option>
                                                                <option value="6">6</option>
                                                                <option value="8">8</option>
                                                                <option value="10">10</option>
                                                                <option value="12">12</option>
                                                                <option value="16">16</option>
                                                                <option value="32">32</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <select name="socket" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Socket</option>
                                                                <option value="AM4">AM4</option>
                                                                <option value="LGA1151">LGA1151</option>
                                                                <option value="LGA2011-3">LGA2011-3</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="text" name="frekv" id="frek" placeholder="Frekvencija" style="width: 40%;" onchange="return frekcheck()">
                                                        <span class="help-block" id="errorfrek" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="boost" id="bbost" placeholder="Boost clock" style="width: 40%;" onchange="return boostcheckcpu()">
                                                        <span class="help-block" id="errorboostcpu" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="tdp" placeholder="TDP" id="tdpp" style="width: 40%;" onchange="return tdpcheck()">
                                                        <span class="help-block" id="errortdp" style="color:#f56a6a;"></span><br>
                                                        
                                                        <input type="text" name="igpu" placeholder="iGPU" id="igp" style="width: 40%;" onchange="return igpucheck()">
                                                        <span class="help-block" id="errorigpu" style="color:#f56a6a;"></span><br>
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                          
                                                          
                                                <form method="post" action="ServletAdminDodajNapajanje" id="psu" class="post" style="<% if(psupok!=null){if(psupok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%> width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika napajanja</label>
                                                        <input type="file" name="file" onChange="readURL7(this)"><br><br>
                                                        <img id="pic7" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukapsu = (String)request.getAttribute("praznaPoljaPsu");
                                                               if(porukapsu!=null)
                                                               {%><%= porukapsu%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukapsu1 = (String)request.getAttribute("praznaSlikaPsu");
                                                               if(porukapsu1!=null)
                                                               {%><%= porukapsu1%><%}
                                                               
                                                            %>
                                                          </h3>
                                                        
                                                          <input type="text" name="naziv" id="psunaziv" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return psucheck()">
                                                        <span class="help-block" id="errorpsu" style="color:#f56a6a;"></span><br>
                                                        <select name="efikasnost" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Efikasnost</option>
                                                                <option value="Bronze">80+ Bronze</option>
                                                                <option value="Silver">80+ Silver</option>
                                                                <option value="Gold">80+ Gold</option>
                                                                <option value="Platinum">80+ Platinum</option>
                                                                <option value="Titanium">80+ Titanium</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="text" name="jacina" id="wat" placeholder="Jačina" style="width: 40%;" onchange="return watcheck()">
                                                        <span class="help-block" id="errorwat" style="color:#f56a6a;"></span><br>
                                                        
                                                        <select name="modul" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Modularnost</option>
                                                                <option value="Semi">Semi</option>
                                                                <option value="Full">Full</option>
                                                                <option value="No">No</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
                                                </form>
                                                          
                                                          
                                                          
                                                <form method="post" action="ServletAdminDodajRAM" id="ram" class="post" style="<% if(rampok!=null){if(rampok.equals("da")){ %> display:block;<%}else{%> display: none;<%}}%>  width:65%;height: 100%; margin: auto;-webkit-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); -moz-box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54); box-shadow: 3px 3px 7px -1px rgba(18,19,30,0.54);" enctype="multipart/form-data">
                                                    <div style="float:right;">
                                                        <label style="color:#aab0c1;">Slika RAM-a</label>
                                                        <input type="file" name="file" onChange="readURL8(this)"><br><br>
                                                        <img id="pic8" src="#" alt=""/>
                                                    </div>
                                                    <div>
                                                        <h3 style="color:#f56a6a;" id="poruka">
                                                            
                                                            <%
                                                               String porukaram = (String)request.getAttribute("praznaPoljaRam");
                                                               if(porukaram!=null)
                                                               {%><%= porukaram%><%}
                                                            %>
                                                            
                                                            <%
                                                               String porukaram1 = (String)request.getAttribute("praznaSlikaRam");
                                                               if(porukaram1!=null)
                                                               {%><%= porukaram1%><%}
                                                               
                                                            %>
                                                          </h3>
                                                      
                                                        <input type="text" name="naziv" id="ramm" placeholder="Naziv" style="width: 40%; margin:0 !important;" onchange="return ramcheck()">
                                                        <span class="help-block" id="errorramm" style="color:#f56a6a;"></span><br>
                                                        <select name="brzina" style="width: 40%;">
                                                            <optgroup>
                                                                <option value="" disabled selected>Brzina</option>
                                                                <option value="4GB DDR42400">4GB DDR4 2400mHz</option>
                                                                <option value="8GB DDR42400">8GB DDR4 2400mHz</option>
                                                                <option value="4GB DDR43000">4GB DDR4 3000mHz</option>
                                                                <option value="8GB DDR43000">8GB DDR4 3000mHz</option>
                                                                <option value="4GB DDR43200">4GB DDR4 3200mHz</option>
                                                                <option value="8GB DDR43200">8GB DDR4 3200mHz</option>
                                                                <option value="16GB DDR43200">16GB DDR4 3200mHz</option>
                                                                <option value="32GB DDR43200">32GB DDR4 3200mHz</option>
                                                            </optgroup>
                                                        </select><br>
                                                        
                                                        <input type="number" name="caslat" placeholder="CAS latency" max="24" min="9" step="1" style="width: 40%;"><br><br>
                                                        
                                                        
                                                    </div>
                                                    
                                                    <input type="submit" id="submit" value="Dodaj">
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