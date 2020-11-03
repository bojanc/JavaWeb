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
                                                                <%
                                                                    Konfiguracije konfig = (Konfiguracije)request.getAttribute("konfig");
                                                                    ArrayList<Komentari> komentar = new ArrayList<Komentari>();
                                                                    if(((ArrayList<Komentari>)request.getAttribute("komentar")).size()>0)
                                                                    {
                                                                        komentar = (ArrayList<Komentari>)request.getAttribute("komentar");
                                                                    }
                                                                    ArrayList<Podkomentari> podkom = (ArrayList<Podkomentari>)request.getAttribute("podkom");
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

                                
                                <div id="myModalP" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeP">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Izmene su uspešno sačuvane!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalP = document.getElementById("myModalP");
                                    var spanP = document.getElementById("closeP");
                                    <%
                                        if(request.getAttribute("uspesno")!=null)
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
                                </script>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
                                                <form method="post" action="ServletOdgovorKomentar">
							<article class="post">
								<header>
									<div class="title">
										<h2>
                                                                                    <%= konfig.getKorisnici().getIme() %> <%= konfig.getKorisnici().getPrezime()%> 
                                                                                    <img src="<%= konfig.getKorisnici().getImgPath() %>" height="60" width="60" style="border-radius: 50%;vertical-align: middle;"/>
                                                                                </h2>
										<p><%= konfig.getOpis() %></p>
									</div>
									<div class="meta">
										<img src="<%= konfig.getImgPath() %>" style="width:100%;height: 100%;"/>
									</div>
								</header>
                                                                        
                                                                        <style>
                                                                                    #buttonobrisi:hover {
                                                                                        box-shadow: inset 0 0 0 1px red;
                                                                                        color: red !important;
                                                                                    }
                                                                        </style>
                                                                        <h3>Komentari</h3><br>
                                                                        <%
                                                                            if(komentar.size()>0)
                                                                            {
                                                                        %>
                                                                        <table><input type="hidden" name="konfigID" value="<%= komentar.get(0).getKonfiguracije().getKonfiguracijaId() %>">
                                                                            <% 
                                                                                int a = 0;
                                                                                
                                                                                for(Komentari pom:komentar){
                                                                                
                                                                                a++;
                                                                            %>
                                                                            <tr style="background-color:transparent;border-top: none;">
                                                                                <td style="padding-bottom:0;">
                                                                                <img src="<%= pom.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/>
                                                                                <h4 style="width: 15%;margin:0;display: inline-block;"> <%= pom.getKorisnici().getIme() %> <%= pom.getKorisnici().getPrezime()%> </h4><%if(korisnik!=null){ if(korisnik.getUloga().equals("Admin") || korisnik.getKorisnikId() == pom.getKorisnici().getKorisnikId()){ %><a href="ServletKomentarObrisi?komid=<%= pom.getKomentarId() %>&konfigid=<%= pom.getKonfiguracije().getKonfiguracijaId() %>" class="button" id="buttonobrisi" style="float:right;display: inline-block;margin-left: 50px;box-shadow: inset 0px 0px 0px 1px rgba(255,0,0,1);">Obriši</a><%}}%>
                                                                                <p style="width: 20%;margin:0;display: inline-block;"><%= pom.getVreme() %></p><br><br>
                                                                                <p style="margin-left:50px;display: inline-block;"><%= pom.getTekst() %></p>
                                                                                
                                                                                <div id="kom<%= a %>" class="odgovor" style="display: none;">
                                                                                <textarea cols="5" name="tekst" id="tekst<%= a %>"  rows="2" class="tekstovi"  style="resize:none;"></textarea><br><br>
                                                                                <span class="close" id="closeP" onclick="zatvorikom('kom<%= a %>','replykom<%= a %>')">&times;</span>
                                                                                <input type="submit" value="Odgovori" style="float:right;margin-right: 50px;">
                                                                                <input type="hidden" name="komID" id="podpodpodkomKOMID<%= a %>11" class="odgovorpodpodkomKOM" value="<%= pom.getKomentarId() %>">
                                                                                
                                                                                </div>
                                                                                <%if(korisnik!=null){%>
                                                                                <a href="#" id="replykom<%= a %>" class="komikona" style="float:right;border-bottom: none;" onclick="otvoriOdgovorkom('kom<%= a %>','replykom<%= a %>','podpodpodkomKOMID<%= a %>11','tekst<%= a %>')"><i class="fa fa-reply" aria-hidden="true"></i></a>
                                                                                <%}%>
                                                                                </td>
                                                                            </tr>
                                                                                <%  int b = 0;int m = 0;
                                                                                    for(Podkomentari pomp:podkom) {
                                                                                    int komid = 0;
                                                                                    b++;
                                                                                    if(pom.getKomentarId() == pomp.getKomentari().getKomentarId())
                                                                                    {if(pomp.getPodkomentari()==null){ komid = pomp.getPodkomentarId();
                                                                                %>
                                                                                
                                                                            <tr style="background-color:transparent;border-top: none;">
                                                                                <td style="padding-left: 100px;">
                                                                                <img src="<%= pom.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/>
                                                                                <h4 style="width: 40%;margin:0;display: inline-block;"> <%= pom.getKorisnici().getIme() %> <%= pom.getKorisnici().getPrezime()%> : <img src="<%= pomp.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/> <%= pomp.getKorisnici().getIme() %> <%= pomp.getKorisnici().getPrezime()%></h4> <%if(korisnik!=null){ if(korisnik.getUloga().equals("Admin") || korisnik.getKorisnikId() == pomp.getKorisnici().getKorisnikId()){ %><a href="ServletKomentarObrisi?id=<%= pomp.getPodkomentarId() %>&konfigid=<%= pom.getKonfiguracije().getKonfiguracijaId() %>" class="button" id="buttonobrisi" style="float:right;display: inline-block;margin-left: 50px;box-shadow: inset 0px 0px 0px 1px rgba(255,0,0,1);">Obriši</a><%}}%>
                                                                                <p style="width: 20%;margin:0;display: inline-block;"><%= pomp.getVreme() %></p><br><br>
                                                                                <p style="margin-left:50px;display: inline-block;"><%= pomp.getTekst() %></p>
                                                                                
                                                                                <div id="podkom<%= b %>" class="odgovorpodkom" style="display: none;">
                                                                                <textarea cols="5"  rows="2" id="tekst1<%= b %>" name="tekst" class="tekstovi"  style="resize:none;"></textarea><br><br>
                                                                                <span class="close" id="closeP" onclick="zatvoripodkom('podkom<%= b %>','replypodkom<%= b %>')">&times;</span>
                                                                                <input type="submit" value="Odgovori" style="float:right;margin-right: 50px;">
                                                                                <input type="hidden" name="podkomID" id="podpodpodkomPODKOMID<%= b %>1" class="odgovorpodpodkomPODKOM" value="<%= pomp.getPodkomentarId() %>">
                                                                                <input type="hidden" name="komID" id="podpodpodkomKOMID<%= b %>1" class="odgovorpodpodkomKOM" value="<%= pom.getKomentarId() %>">
                                                                                </div>
                                                                                <%if(korisnik!=null){%>
                                                                                <a href="#" id="replypodkom<%= b %>" class="podkomikona" style="float:right;border-bottom: none" onclick="otvoriOdgovorpodkom('podkom<%= b %>','replypodkom<%= b %>','podpodpodkomPODKOMID<%= b %>1','podpodpodkomKOMID<%= b %>1','tekst1<%= b %>')"><i class="fa fa-reply" aria-hidden="true"></i></a>
                                                                                <%}%>
                                                                                </td>
                                                                            </tr>
                                                                                <%} int c = 0;
                                                                                        for(Podkomentari pompp : podkom)
                                                                                        {   c++;
                                                                                            int w = 1;
                                                                                            if(pompp.getPodkomentari()!=null && pomp.getPodkomentarId() == pompp.getPodkomentari().getPodkomentarId())
                                                                                            {
                                                                                                if(pompp.getPodkomentari().getPodkomentari()!=null)
                                                                                                {
                                                                                                    if(pompp.getPodkomentari().getPodkomentari().getPodkomentarId()==komid)
                                                                                                    {
                                                                                                        w=2;
                                                                                                    }
                                                                                                }
                                                                                                else if(pompp.getPodkomentari()!=null)
                                                                                                {
                                                                                                    if(pompp.getPodkomentari().getPodkomentarId()==komid)
                                                                                                    {
                                                                                                        w=2;
                                                                                                    }
                                                                                                }




                                                                                    if(w==2)
                                                                                    {
                                                                                %>      
                                                                            <tr style="background-color:transparent;border-top: none;">
                                                                                <td style="padding-left: 200px;">
                                                                                <img src="<%= pomp.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/>
                                                                                <h4 style="width: 40%;margin:0;display: inline-block;"><%= pomp.getKorisnici().getIme() %> <%= pomp.getKorisnici().getPrezime()%> : <img src="<%= pompp.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/> <%= pompp.getKorisnici().getIme() %> <%= pompp.getKorisnici().getPrezime()%></h4><%if(korisnik!=null){ if(korisnik.getUloga().equals("Admin") || korisnik.getKorisnikId() == pompp.getKorisnici().getKorisnikId()){ %><a href="ServletKomentarObrisi?id=<%= pompp.getPodkomentarId() %>&konfigid=<%= pom.getKonfiguracije().getKonfiguracijaId() %>" class="button" id="buttonobrisi" style="float:right;display: inline-block;margin-left: 50px;box-shadow: inset 0px 0px 0px 1px rgba(255,0,0,1);">Obriši</a><%}}%>
                                                                                <p style="width: 20%;margin:0;display: inline-block;"><%= pompp.getVreme() %></p><br><br>
                                                                                <p style="margin-left:50px;display: inline-block;"><%= pompp.getTekst() %></p>
                                                                                
                                                                                <div id="podpodkom<%= c %>" class="odgovorpodpodkom" style="display: none;">
                                                                                <textarea cols="5"  rows="2" id="tekst2<%= c %>" name="tekst" class="tekstovi"  style="resize:none;"></textarea><br><br>
                                                                                <span class="close" id="closeP" onclick="zatvoripodpodkom('podpodkom<%= c %>','replypodpodkom<%= c %>')">&times;</span>
                                                                                <input type="submit" value="Odgovori" style="float:right;margin-right: 50px;">
                                                                                
                                                                                <input type="hidden" name="podkomID" id="podpodpodkomPODKOMID<%= c %>2" class="odgovorpodpodkomPODKOM" value="<%= pompp.getPodkomentarId() %>">
                                                                                <input type="hidden" name="komID" id="podpodpodkomKOMID<%= c %>2" class="odgovorpodpodkomKOM" value="<%= pom.getKomentarId() %>">
                                                                                </div>
                                                                                <%if(korisnik!=null){%>
                                                                                <a href="#" id="replypodpodkom<%= c %>" class="podpodkomikona" style="float:right;border-bottom: none" onclick="otvoriOdgovorpodpodkom('podpodkom<%= c %>','replypodpodkom<%= c %>','podpodpodkomPODKOMID<%= c %>2','podpodpodkomKOMID<%= c %>2','tekst2<%= c %>')"><i class="fa fa-reply" aria-hidden="true"></i></a>
                                                                                <%}%>
                                                                                </td>
                                                                            </tr>
                                                                            <%}}
                                                                                if(w==2)
                                                                                {int z = 0;
                                                                                    for(Podkomentari pomppp : podkom)
                                                                                    {
                                                                                        if(pomppp.getPodkomentari()!=null)
                                                                                        {
                                                                                            if(pomppp.getPodkomentari().getPodkomentari()!=null)
                                                                                            {
                                                                                                if(pomppp.getPodkomentari().getPodkomentarId() == pompp.getPodkomentarId() || pomppp.getPodkomentari().getPodkomentari().getPodkomentarId() == pompp.getPodkomentarId())
                                                                                                {z++;m++;
                                                                            %>                      
                                                                            <tr style="background-color:transparent;border-top: none;">
                                                                                <td style="padding-left: 300px;">
                                                                                <img src="<%= pompp.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/>
                                                                                <h4 style="width: 40%;margin:0;display: inline-block;"><%= pompp.getKorisnici().getIme() %> <%= pompp.getKorisnici().getPrezime()%> : <img src="<%= pomppp.getKorisnici().getImgPath() %>" height="30" width="30" style="border-radius: 50%;vertical-align: middle;display: inline-block;margin-right: 10px;"/> <%= pomppp.getKorisnici().getIme() %> <%= pomppp.getKorisnici().getPrezime()%></h4><%if(korisnik!=null){ if(korisnik.getUloga().equals("Admin") || korisnik.getKorisnikId() == pomppp.getKorisnici().getKorisnikId()){ %><a href="ServletKomentarObrisi?id=<%= pomppp.getPodkomentarId() %>&konfigid=<%= pom.getKonfiguracije().getKonfiguracijaId() %>" class="button" id="buttonobrisi" style="float:right;display: inline-block;margin-left: 50px;box-shadow: inset 0px 0px 0px 1px rgba(255,0,0,1);">Obriši</a><%}}%>
                                                                                <p style="width: 20%;margin:0;display: inline-block;"><%= pomppp.getVreme() %></p><br><br>
                                                                                <p style="margin-left:50px;display: inline-block;"><%= pomppp.getTekst() %></p>
                                                                                
                                                                                    <%
                                                                                        if(z==1){
                                                                                    %>
                                                                                <div id="podpodpodkom<%= pomppp.getPodkomentarId() %>" class="odgovorpodpodpodkom" style="display: none;">
                                                                                <textarea cols="5" id="tekst3<%= pomppp.getPodkomentarId() %>" class="tekstovi"  rows="2" name="tekst"  style="resize:none;"></textarea><br><br>
                                                                                <span class="close" id="closeP" onclick="zatvoripodpodpodkom('podpodpodkom<%= pomppp.getPodkomentarId() %>','replypodpodpodkom<%= m %>')">&times;</span>
                                                                                <input type="submit" value="Odgovori" style="float:right;margin-right: 50px;">
                                                                                
                                                                                <input type="hidden" id="podpodpodkomPODKOMID<%= pomppp.getPodkomentarId() %>posl" name="podkomID" class="odgovorpodpodpodkomPODKOM" value="<%= pomppp.getPodkomentarId() %>">
                                                                                <input type="hidden" id="podpodpodkomKOMID<%= pomppp.getPodkomentarId() %>posl" name="komID" class="odgovorpodpodpodkomKOM" value="<%= pom.getKomentarId() %>">
                                                                                </div>
                                                                                <%if(korisnik!=null){%>
                                                                                <a href="#" id="replypodpodpodkom<%= m %>" class="podpodpodkomikona" style="float:right;border-bottom: none" onclick="otvoriOdgovorpodpodpodkom('podpodpodkom<%= pomppp.getPodkomentarId() %>','replypodpodpodkom<%= m %>','podpodpodkomPODKOMID<%= pomppp.getPodkomentarId() %>posl','podpodpodkomKOMID<%= pomppp.getPodkomentarId() %>posl','tekst3<%= pomppp.getPodkomentarId() %>')"><i class="fa fa-reply" aria-hidden="true"></i></a>
                                                                                <%}%>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                                </td>
                                                                            </tr>
                                                                                    
                                                                                    <%          }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                }}
                                                                                %>
                                                                                
                                                                                
                                                                            
                                                                            <%
                                                                            }}
                                                                            %>
                                                                        </table>
                                                                        <%
                                                                            }else{
                                                                        %>
                                                                        <h2 style="color:red;">
                                                                            Trenutno nema komentara!
                                                                        </h2>
                                                                        <%
                                                                            }
                                                                        %>
                                                                        <script>
                                                                            
                                                                            function otvoriOdgovorkom(obj,obj1,obj2,obj3) {
                                                                              var x = document.getElementsByClassName("odgovor");
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var n = document.getElementsByClassName("podpodpodkomikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              var tekstovi = document.getElementsByClassName("tekstovi");
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display = "none";  
                                                                              }
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < n.length; i++) {
                                                                                n[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).removeAttribute("name");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              for (i = 0; i < tekstovi.length; i++) {
                                                                                var id = tekstovi[i].id;console.log(tekstovi[i]);
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              document.getElementById(obj).style.display = "block";  
                                                                              document.getElementById(obj1).style.display = "none";
                                                                              document.getElementById(obj2).setAttribute("name", "komID");
                                                                              document.getElementById(obj3).setAttribute("name", "tekst"); 
                                                                              
                                                                            }
                                                                            
                                                                            function zatvorikom(obj,obj1) {
                                                                              document.getElementById(obj).style.display = "none";  
                                                                              document.getElementById(obj1).style.display = "block";  
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="block";
                                                                              }
                                                                            }
                                                                            
                                                                            function otvoriOdgovorpodkom(obj,obj1,obj2,obj3,obj4) {
                                                                              var x = document.getElementsByClassName("odgovor");
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var n = document.getElementsByClassName("podpodpodkomikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              var tekstovi = document.getElementsByClassName("tekstovi");
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display = "none";  
                                                                              }
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < n.length; i++) {
                                                                                n[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).removeAttribute("name");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              for (i = 0; i < tekstovi.length; i++) {
                                                                                var id = tekstovi[i].id;console.log(tekstovi[i]);
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              document.getElementById(obj).style.display = "block";  
                                                                              document.getElementById(obj1).style.display = "none";
                                                                              document.getElementById(obj2).setAttribute("name", "podkomID");
                                                                              document.getElementById(obj3).setAttribute("name", "komID");
                                                                              document.getElementById(obj4).setAttribute("name", "tekst");
                                                                            }
                                                                            
                                                                            function zatvoripodkom(obj,obj1) {
                                                                              document.getElementById(obj).style.display = "none";  
                                                                              document.getElementById(obj1).style.display = "block";  
                                                                              
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var x = document.getElementsByClassName("podpodpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).setAttribute("name","podkomID");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).setAttribute("name","komID");
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).setAttribute("name","podkomID");
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).setAttribute("name","komID");
                                                                              }
                                                                            }
                                                                            
                                                                            function otvoriOdgovorpodpodkom(obj,obj1,obj2,obj3,obj4) {
                                                                              var x = document.getElementsByClassName("odgovor");
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var n = document.getElementsByClassName("podpodpodkomikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              var tekstovi = document.getElementsByClassName("tekstovi");
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display = "none";  
                                                                              }
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < n.length; i++) {
                                                                                n[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).removeAttribute("name");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              for (i = 0; i < tekstovi.length; i++) {
                                                                                var id = tekstovi[i].id;console.log(tekstovi[i]);
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              document.getElementById(obj).style.display = "block";  
                                                                              document.getElementById(obj1).style.display = "none";
                                                                              document.getElementById(obj2).setAttribute("name", "podkomID");
                                                                              document.getElementById(obj3).setAttribute("name", "komID");
                                                                              document.getElementById(obj4).setAttribute("name", "tekst");  
                                                                            }
                                                                            
                                                                            function zatvoripodpodkom(obj,obj1) {
                                                                              document.getElementById(obj).style.display = "none";  
                                                                              document.getElementById(obj1).style.display = "block";  
                                                                              
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var x = document.getElementsByClassName("podpodpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).setAttribute("name","podkomID");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).setAttribute("name","komID");
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).setAttribute("name","podkomID");
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).setAttribute("name","komID");
                                                                              }
                                                                            }
                                                                            
                                                                            function otvoriOdgovorpodpodpodkom(obj,obj1,obj2,obj3,obj4) {
                                                                              var x = document.getElementsByClassName("odgovor");
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var n = document.getElementsByClassName("podpodpodkomikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              var tekstovi = document.getElementsByClassName("tekstovi");
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display = "none";  
                                                                              }
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < n.length; i++) {
                                                                                n[i].style.display="none";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).removeAttribute("name");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              for (i = 0; i < tekstovi.length; i++) {
                                                                                var id = tekstovi[i].id;console.log(tekstovi[i]);
                                                                                document.getElementById(id).removeAttribute("name"); 
                                                                              }
                                                                              
                                                                              document.getElementById(obj).style.display = "block";  
                                                                              document.getElementById(obj1).style.display = "none";
                                                                              document.getElementById(obj2).setAttribute("name", "podkomID");
                                                                              document.getElementById(obj3).setAttribute("name", "komID");
                                                                              document.getElementById(obj4).setAttribute("name", "tekst");
                                                                            }
                                                                            
                                                                            function zatvoripodpodpodkom(obj,obj1) {
                                                                              document.getElementById(obj).style.display = "none";  
                                                                              document.getElementById(obj1).style.display = "block";  
                                                                              
                                                                              var y = document.getElementsByClassName("podkomikona");
                                                                              var z = document.getElementsByClassName("podpodkomikona");
                                                                              var x = document.getElementsByClassName("podpodpodkomikona");
                                                                              var c = document.getElementsByClassName("komikona");
                                                                              
                                                                              var g = document.getElementsByClassName("odgovorpodpodpodkomPODKOM");
                                                                              var h = document.getElementsByClassName("odgovorpodpodpodkomKOM");
                                                                              
                                                                              var g1 = document.getElementsByClassName("odgovorpodpodkomPODKOM");
                                                                              var h1 = document.getElementsByClassName("odgovorpodpodkomKOM");
                                                                              
                                                                              for (i = 0; i < y.length; i++) {
                                                                                y[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < z.length; i++) {
                                                                                z[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < c.length; i++) {
                                                                                c[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < x.length; i++) {
                                                                                x[i].style.display="block";
                                                                              }
                                                                              
                                                                              for (i = 0; i < g.length; i++) {
                                                                                var id = g[i].id;
                                                                                document.getElementById(id).setAttribute("name","podkomID");
                                                                              }
                                                                              
                                                                              for (i = 0; i < h.length; i++) {
                                                                                var id = h[i].id;
                                                                                document.getElementById(id).setAttribute("name","komID");
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < g1.length; i++) {
                                                                                var id = g1[i].id;
                                                                                document.getElementById(id).setAttribute("name","podkomID");
                                                                                
                                                                              }
                                                                              
                                                                              for (i = 0; i < h1.length; i++) {
                                                                                var id = h1[i].id;
                                                                                document.getElementById(id).setAttribute("name","komID");
                                                                              }
                                                                              
                                                                              
                                                                            }
                                                                        </script>
								
							</article>
                                                </form>

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