<%@page import="entity.Ram"%>
<%@page import="entity.Psu"%>
<%@page import="entity.Procesori"%>
<%@page import="entity.Memorija"%>
<%@page import="entity.Maticna"%>
<%@page import="entity.Kuleri"%>
<%@page import="entity.Kuciste"%>
<%@page import="entity.Gpu"%>
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
		<title>Single - Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
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
                                                        
                                                        <%
                                                            ArrayList<Korisnici> kl = (ArrayList<Korisnici>)request.getAttribute("korisnici");
                                                            String deo = "";
                                                            if(request.getAttribute("deo")!=null)
                                                            {
                                                                deo = (String)request.getAttribute("deo");
                                                            }
                                                        %>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header style="margin: auto; text-align: center; padding-left: 60px;">
                                                                        <h2>Spisak delova</h2>
                                                                        <a href="ServletUporedi?" class="button" id="uporedi" style="margin-left: 70%; padding-bottom: 10px;">Uporedi</a>
                                                                        
                                                                </header>
                                                            <form method="post" action="PrikazDelova">
                                                                <select name="deo" style="width:16%;margin-top: 10px;" onchange="this.form.submit()">
                                                                    <option value="" disabled selected="">Delovi</option>
                                                                    <optgroup>
                                                                        <option value="gpu" <% if(!(deo.equals(""))){if(deo.equals("gpu")){ %> selected<%}}%>>Grafičke kartice</option>
                                                                        <option value="kuciste" <% if(!(deo.equals(""))){if(deo.equals("kuciste")){ %> selected<%}}%>>Kučišta</option>
                                                                        <option value="kuleri" <% if(!(deo.equals(""))){if(deo.equals("kuleri")){ %> selected<%}}%>>Kuleri</option>
                                                                        <option value="maticna" <% if(!(deo.equals(""))){if(deo.equals("maticna")){ %> selected<%}}%>>Matične</option>
                                                                        <option value="memorija" <% if(!(deo.equals(""))){if(deo.equals("memorija")){ %> selected<%}}%>>Memorije</option>
                                                                        <option value="procesori" <% if(!(deo.equals(""))){if(deo.equals("procesori")){ %> selected<%}}%>>Procesori</option>
                                                                        <option value="psu" <% if(!(deo.equals(""))){if(deo.equals("psu")){ %> selected<%}}%>>Napajanja</option>
                                                                        <option value="ram" <% if(!(deo.equals(""))){if(deo.equals("ram")){ %> selected<%}}%>>RAM</option>
                                                                    </optgroup>
                                                                </select>
                                                            </form>
                                                            
                                                            <%
                                                                
                                                                
                                                                ArrayList<Gpu> gpu = new ArrayList<Gpu>();
                                                                ArrayList<Kuciste> kuciste = new ArrayList<Kuciste>();
                                                                ArrayList<Kuleri> kuler = new ArrayList<Kuleri>();
                                                                ArrayList<Maticna> maticna = new ArrayList<Maticna>();
                                                                ArrayList<Memorija> memorija = new ArrayList<Memorija>();
                                                                ArrayList<Procesori> cpu = new ArrayList<Procesori>();
                                                                ArrayList<Psu> psu = new ArrayList<Psu>();
                                                                ArrayList<Ram> ram = new ArrayList<Ram>();
                                                                
                                                                if(!(deo.equals("")))
                                                                {
                                                                    if(deo.equals("gpu"))
                                                                    {
                                                                        gpu = (ArrayList<Gpu>)request.getAttribute("gpu");
                                                                    }
                                                                    else if(deo.equals("kuciste"))
                                                                    {
                                                                        kuciste = (ArrayList<Kuciste>)request.getAttribute("kuciste");
                                                                    }
                                                                    else if(deo.equals("kuleri"))
                                                                    {
                                                                        kuler = (ArrayList<Kuleri>)request.getAttribute("kuler");
                                                                    }
                                                                    else if(deo.equals("maticna"))
                                                                    {
                                                                        maticna = (ArrayList<Maticna>)request.getAttribute("maticna");
                                                                    }
                                                                    else if(deo.equals("memorija"))
                                                                    {
                                                                        memorija = (ArrayList<Memorija>)request.getAttribute("memorija");
                                                                    }
                                                                    else if(deo.equals("procesori"))
                                                                    {
                                                                        cpu = (ArrayList<Procesori>)request.getAttribute("cpu");
                                                                    }
                                                                    else if(deo.equals("psu"))
                                                                    {
                                                                        psu = (ArrayList<Psu>)request.getAttribute("psu");
                                                                    }
                                                                    else if(deo.equals("ram"))
                                                                    {
                                                                        ram = (ArrayList<Ram>)request.getAttribute("ram");
                                                                    }
                                                                }
                                                                
                                                            %>
                                                            
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
                                    <span class="close" id="closeS">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Možete da uporedite samo dva proizvoda odjednom!</b></p>
                                  </div>

                                </div>
                                                                
                                                                <script>
                                                                    
                                                                    var modalP = document.getElementById("myModalP");
                                                                    var spanS = document.getElementById("closeS");
                                                                    
                                                                    spanS.onclick = function() {
                                                                        modalP.style.display = "none";
                                                                      }
                                                                          
                                                                    window.onclick = function(event) {
                                                                      if (event.target == modalP) {
                                                                        modalP.style.display = "none";
                                                                      }
                                                                    }
                                                                        
                                                                    function gpucb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("gpu="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&gpu="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("gpu").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&gpu="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&gpu="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&gpu="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("gpu="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("gpu="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("gpu="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("gpu="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("gpu="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                function kuccb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("kuc="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&kuc="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("kuc").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&kuc="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&kuc="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&kuc="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("kuc="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("kuc="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("kuc="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("kuc="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("kuc="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                 function kulcb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("kul="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&kul="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("kul").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&kul="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&kul="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&kul="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("kul="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("kul="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("kul="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("kul="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("kul="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                function mbcb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("mb="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&mb="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("mb").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&mb="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&mb="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&mb="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("mb="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("mb="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("mb="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("mb="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("mb="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                function memcb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("mem="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&mem="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("mem").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&mem="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&mem="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&mem="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("mem="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("mem="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("mem="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("mem="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("mem="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                function cpucb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("cpu="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&cpu="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("cpu").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&cpu="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&cpu="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&cpu="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("cpu="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("cpu="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("cpu="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("cpu="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("cpu="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                function psucb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("psu="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&psu="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("psu").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&psu="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&psu="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&psu="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("psu="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("psu="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("psu="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("psu="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("psu="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                
                                                                function ramcb(obj) {
                                                                        var x = document.getElementById("uporedi");
                                                                        var cb = document.getElementById(obj);
                                                                        
                                                                        
                                                                        if(cb.checked == true)
                                                                        {
                                                                            var tekst = x.href;
                                                                            console.log(tekst);
                                                                            var posl = tekst.slice(-1);
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            console.log(obj);
                                                                            if(posl == "?")
                                                                            {
                                                                                x.href = tekst.concat("ram="+obj);
                                                                            }
                                                                            else
                                                                            {
                                                                                x.href = tekst.concat("&ram="+obj);
                                                                            }
                                                                            
                                                                            var tekst2 = x.href;
                                                                            var broj = tekst2.split("ram").length-1
                                                                            console.log(broj);
                                                                            
                                                                            if(broj>2)
                                                                            {
                                                                                modalP.style.display = "block";
                                                                                cb.checked = false;
                                                                                x.href = tekst;
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            var obj = obj.replace(/\D/g,'');
                                                                            var x1 = x.href;
                                                                            
                                                                            if(x1.includes("&ram="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("&ram="+obj+"","");
                                                                                x.href = x2;
                                                                            }
                                                                            else if(x1.includes("&ram="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("ram="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("ram="+obj+"&"))
                                                                            {
                                                                                var x2 = x1.replace("ram="+obj+"&","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            else if(x1.includes("ram="+obj+""))
                                                                            {
                                                                                var x2 = x1.replace("ram="+obj+"","");
                                                                                x.href = x2;
                                                                                console.log(x2);
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                }
                                                                    
                                                                    
                                                                </script>
                                                                
                                                                
                                                            
                                                            <%
                                                                if(!(deo.equals("")))
                                                                {
                                                                if(deo.equals("gpu"))
                                                                {
                                                                    if(gpu.size()>0)
                                                                    {
                                                                
                                                            %>
                                                            <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Memorija</th>
                                                                    <th>Core clock</th>
                                                                    <th>Boost Clock</th>
                                                                    <th>TDP</th>
                                                                    <th>Uporedi</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Gpu pom:gpu){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getMemorija()%></td>
                                                                        <td><%= pom.getCoreCl()%></td>
                                                                        <td><%= pom.getBoostCl()%></td>
                                                                        <td><%= pom.getTdp()%> W</td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="gpuID" id="gpuID<%= pom.getGpuId() %>" class="gpucb" onchange="gpucb('gpuID<%= pom.getGpuId() %>')" value="<%= pom.getGpuId() %>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema grafičkih kartica.</h2>
                                                                    <%
                                                                        }
                                                                        }
                                                                        else if(deo.equals("kuciste"))
                                                                        {
                                                                            if(kuciste.size()>0)
                                                                            {
                                                                    %>
                                                                     <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Dimenzije</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Kuciste pom:kuciste){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getDimenzije()%></td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="kucID" id="kucID<%= pom.getKucisteId()%>" class="kuccb" onchange="kuccb('kucID<%= pom.getKucisteId()%>')" value="<%= pom.getKucisteId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema kučišta.</h2>
                                                                    
                                                                    
                                                                    <%
                                                                    }}
                                                                    else if(deo.equals("kuleri"))
                                                                    {
                                                                        if(kuler.size()>0)
                                                                        {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>RPM</th>
                                                                    <th>Buka</th>
                                                                    <th>Dimenzije</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Kuleri pom:kuler){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getRpm()%> rpm</td>
                                                                        <td><%= pom.getBuka()%></td>
                                                                        <td><%= pom.getRadijatorDim()%></td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="kulID" id="kulID<%= pom.getKulerId()%>" class="kulcb" onchange="kulcb('kulID<%= pom.getKulerId()%>')" value="<%= pom.getKulerId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema kulera.</h2>
                                                                    
                                                                    <%
                                                                    }}
                                                                    else if (deo.equals("maticna"))
                                                                    {
                                                                    if(maticna.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Socket</th>
                                                                    <th>Veličina</th>
                                                                    <th>Podržan ram</th>
                                                                    <th>Ram slotovi</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Maticna pom:maticna){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getSocket()%></td>
                                                                        <td><%= pom.getVelicina()%></td>
                                                                        <td><%= pom.getMaxRam()%></td>
                                                                        <td><%= pom.getMemSlots()%></td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="mbID" id="mbID<%= pom.getMaticnaId()%>" class="mbcb" onchange="mbcb('mbID<%= pom.getMaticnaId()%>')" value="<%= pom.getMaticnaId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema matičnih ploča.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("memorija"))
                                                                    {
                                                                    if(memorija.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Kapacitet</th>
                                                                    <th>Tip</th>
                                                                    <th>Cache</th>
                                                                    <th>Dimenzije</th>
                                                                    <th>Interfejs</th>
                                                                    <th>TDP</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Memorija pom:memorija){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getKapacitet()%></td>
                                                                        <td><%= pom.getTip()%></td>
                                                                        <td><%= pom.getCache()%></td>
                                                                        <td><%= pom.getDimenzije()%></td>
                                                                        <td><%= pom.getInterfejs()%></td>
                                                                        <td><%= pom.getTdp()%> W</td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="memID" id="memID<%= pom.getMemorijaId()%>" class="memcb" onchange="memcb('memID<%= pom.getMemorijaId()%>')" value="<%= pom.getMemorijaId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema memorija.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("procesori"))
                                                                    {
                                                                    if(cpu.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Socket</th>
                                                                    <th>Broj jezgara</th>
                                                                    <th>Frekvencija</th>
                                                                    <th>Boost</th>
                                                                    <th>TDP</th>
                                                                    <th>iGPU</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Procesori pom:cpu){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getSocket()%></td>
                                                                        <td><%= pom.getBrojJezgara()%></td>
                                                                        <td><%= pom.getFrekvencija()%></td>
                                                                        <td><%= pom.getBoost()%></td>
                                                                        <td><%= pom.getTdp()%> W</td>
                                                                        <td><%= pom.getIgpu()%></td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="cpuID" id="cpuID<%= pom.getProcesorId()%>" class="cpucb" onchange="cpucb('cpuID<%= pom.getProcesorId()%>')" value="<%= pom.getProcesorId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema procesora.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("psu"))
                                                                    {
                                                                    if(psu.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Efikasnost</th>
                                                                    <th>Jačina</th>
                                                                    <th>Modularnost</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Psu pom:psu){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getEfikasnost()%></td>
                                                                        <td><%= pom.getJacina()%> W</td>
                                                                        <td><%= pom.getModularnost()%></td>
                                                                        
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="psuID" id="psuID<%= pom.getPsuId()%>" class="psucb" onchange="psucb('psuID<%= pom.getPsuId()%>')" value="<%= pom.getPsuId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema napajanja.</h2>
                                                                    
                                                                    <%
                                                                        }}else if (deo.equals("ram"))
                                                                    {
                                                                    if(ram.size()>0)
                                                                    {

                                                                    %>
                                                                    <table>
                                                                <thead>
                                                                    <th>Slika</th>
                                                                    <th>Naziv</th>
                                                                    <th>Brzina</th>
                                                                    <th>CAS latency</th>
                                                                    <th>TDP</th>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        
                                                                        for(Ram pom:ram){
                                                                    %>
                                                                    <tr style="background-color:transparent;">
                                                                        <td><img src="<%= pom.getImgPath() %>"height="90" width="90" style="vertical-align: middle;"</td>
                                                                        <td><%= pom.getNaziv()%></td>
                                                                        <td><%= pom.getBrzina()%> MHz</td>
                                                                        <td><%= pom.getCasLat()%></td>
                                                                        <td><%= pom.getTdp()%> W</td>
                                                                        <td style="vertical-align:middle;">
                                                                            <div id="ck-button">
                                                                                <label>
                                                                                    <input type="checkbox" name="ramID" id="ramID<%= pom.getRamId()%>" class="cpucb" onchange="ramcb('ramID<%= pom.getRamId()%>')" value="<%= pom.getRamId()%>"><span style='padding:0 !important; border: none;'>Izaberi</span>
                                                                                </label>
                                                                             </div>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tbody>
                                                            </table>
                                                                <%
                                                                    }else{
                                                                %>
                                                                <h2 style="width:600px !important;color: red;">Trenutno nema RAM memorije.</h2>
                                                                    
                                                                    <%
                                                                        }}}
                                                                    %>
							</article>

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