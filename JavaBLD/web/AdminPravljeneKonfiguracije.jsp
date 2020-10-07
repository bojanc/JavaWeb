<%@page import="entity.Ram"%>
<%@page import="entity.Psu"%>
<%@page import="entity.Procesori"%>
<%@page import="entity.Memorija"%>
<%@page import="entity.Maticna"%>
<%@page import="entity.Kuleri"%>
<%@page import="entity.Kuciste"%>
<%@page import="java.util.ArrayList"%>
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
                                                                function otvoriDeo(deoName) {
                                                                  var i;
                                                                  var x = document.getElementsByClassName("deo");
                                                                  for (i = 0; i < x.length; i++) {
                                                                    x[i].style.display = "none";  
                                                                  }
                                                                  document.getElementById(deoName).style.display = "block";  
                                                                }
                                                                </script>
                                                                <%
                                                                    ArrayList<Gpu> gpu = (ArrayList<Gpu>)request.getAttribute("gpu");
                                                                    ArrayList<Kuciste> kuciste = (ArrayList<Kuciste>)request.getAttribute("kuciste");
                                                                    ArrayList<Kuleri> kuler = (ArrayList<Kuleri>)request.getAttribute("kuler");
                                                                    ArrayList<Maticna> maticna = (ArrayList<Maticna>)request.getAttribute("maticna");
                                                                    ArrayList<Memorija> memorija = (ArrayList<Memorija>)request.getAttribute("memorija");
                                                                    ArrayList<Procesori> cpu = (ArrayList<Procesori>)request.getAttribute("cpu");
                                                                    ArrayList<Psu> psu = (ArrayList<Psu>)request.getAttribute("psu");
                                                                    ArrayList<Ram> ram = (ArrayList<Ram>)request.getAttribute("ram");
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
                                                                
                                                                <script>
                                                                    function validateGPU(obj) {
                                                                        var cbs = document.getElementsByClassName("gpucb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int gb=1;gb<=gpu.size();gb++){
                                                                        %>
                                                                    if (document.getElementById('gpuID<%= gb %>').checked) {
                                                                        $('#gpuIMG<%= gb %>')
                                                                            .attr('src', document.getElementById('gpuID<%= gb %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('gpuID<%= gb %>').checked==false){
                                                                        $('#gpuIMG<%= gb %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validateCase(obj) {
                                                                        var cbs = document.getElementsByClassName("casecb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int kub=1;kub<=kuciste.size();kub++){
                                                                        %>
                                                                    if (document.getElementById('caseID<%= kub %>').checked) {
                                                                        $('#caseIMG<%= kub %>')
                                                                            .attr('src', document.getElementById('caseID<%= kub %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(250)
                                                                            .height(250);
                                                                    } else if(document.getElementById('caseID<%= kub %>').checked==false){
                                                                        $('#caseIMG<%= kub %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validateCooler(obj) {
                                                                         var cbs = document.getElementsByClassName("coolercb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int kb=1;kb<=kuler.size();kb++){
                                                                        %>
                                                                    if (document.getElementById('coolerID<%= kb %>').checked) {
                                                                        $('#coolerIMG<%= kb %>')
                                                                            .attr('src', document.getElementById('coolerID<%= kb %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('coolerID<%= kb %>').checked==false){
                                                                        $('#coolerIMG<%= kb %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validateMobo(obj) {
                                                                        var cbs = document.getElementsByClassName("mobocb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int meb=1;meb<=maticna.size();meb++){
                                                                        %>
                                                                    if (document.getElementById('moboID<%= meb %>').checked) {
                                                                        $('#moboIMG<%= meb %>')
                                                                            .attr('src', document.getElementById('moboID<%= meb %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('moboID<%= meb %>').checked==false){
                                                                        $('#moboIMG<%= meb %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validateMem(obj) {
                                                                        
                                                                        var cbs = document.getElementsByClassName("memcb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int mb=1;mb<=memorija.size();mb++){
                                                                        %>
                                                                    if (document.getElementById('memID<%= mb %>').checked) {
                                                                        $('#memIMG<%= mb %>')
                                                                            .attr('src', document.getElementById('memID<%= mb %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('memID<%= mb %>').checked==false){
                                                                        $('#memIMG<%= mb %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validateCPU(obj) {
                                                                        
                                                                        var cbs = document.getElementsByClassName("cpucb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                    
                                                                    <%
                                                                            for(int cb=1;cb<=cpu.size();cb++){
                                                                        %>
                                                                    if (document.getElementById('cpuID<%= cb %>').checked) {
                                                                        $('#cpuIMG<%= cb %>')
                                                                            .attr('src', document.getElementById('cpuID<%= cb %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('cpuID<%= cb %>').checked==false){
                                                                         $('#cpuIMG<%= cb %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validatePSU(obj) {
                                                                         var cbs = document.getElementsByClassName("psucb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int pb=1;pb<=psu.size();pb++){
                                                                        %>
                                                                    if (document.getElementById('psuID<%= pb %>').checked) {
                                                                        $('#psuIMG<%= pb %>')
                                                                            .attr('src', document.getElementById('psuID<%= pb %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('psuID<%= pb %>').checked==false){
                                                                        $('#psuIMG<%= pb %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    <%
                                                                        }
                                                                    %>
                                                                    }
                                                                    
                                                                    function validateRAM(obj) {
                                                                        
                                                                        var cbs = document.getElementsByClassName("ramcb");
                                                                    for (var i = 0; i < cbs.length; i++) {
                                                                        cbs[i].checked = false;
                                                                    }
                                                                    obj.checked = true;
                                                                        <%
                                                                            for(int a=1;a<=ram.size();a++){
                                                                        %>
                                                                    if (document.getElementById('ramID<%= a %>').checked) {
                                                                        $('#ramIMG<%= a %>')
                                                                            .attr('src', document.getElementById('ramID<%= a %>').getAttribute("data-original-title"))
                                                                            .attr('style', "display:block !important;")
                                                                            .width(150)
                                                                            .height(150);
                                                                    } else if(document.getElementById('ramID<%= a %>').checked==false){
                                                                        $('#ramIMG<%= a %>')
                                                                            .attr('style', "display:none;")
                                                                    }
                                                                    
                                                                    <%
                                                                        }
                                                                    %>
                                                                            
                                                                    }
                                                                </script>
				<!-- Main -->
                                
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
                                    <p style="margin-bottom:5px;"><b>Morate izabrati sve delove i popuniti opis konfiguracije!</b></p>
                                  </div>

                                </div>
                                
                                <div id="myModalS" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeS">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Morate izabrati sliku!</b></p>
                                  </div>

                                </div>
                                
                                <div id="myModalSC" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeSC">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Socketi za procesor i matičnu ploču se ne poklapaju!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalP = document.getElementById("myModalP");
                                    var modalS = document.getElementById("myModalS");
                                    var modalSC = document.getElementById("myModalSC");
                                var spanS = document.getElementById("closeS");
                                var spanP = document.getElementById("closeP");
                                var spanSC = document.getElementById("closeSC");
                                <%
                                    if(request.getAttribute("praznaPolja")!=null)
                                    {
                                %>
                                    $(document).ready(function(){
                                        modalP.style.display = "block";
                                    })
                                    <%
                                    }
                                    %>
                                        
                                        <%
                                    if(request.getAttribute("praznaSlika")!=null)
                                    {
                                %>
                                    $(document).ready(function(){
                                        modalS.style.display = "block";
                                    })
                                    <%
                                    }
                                    %>
                                        
                                         <%
                                    if(request.getAttribute("socket")!=null)
                                    {
                                %>
                                    $(document).ready(function(){
                                        modalSC.style.display = "block";
                                    })
                                    <%
                                    }
                                    %>

                                spanS.onclick = function() {
                                  modalS.style.display = "none";
                                }
                                
                                spanP.onclick = function() {
                                  modalP.style.display = "none";
                                }
                                
                                spanSC.onclick = function() {
                                  modalSC.style.display = "none";
                                }

                                window.onclick = function(event) {
                                  if (event.target == modalS || event.target == modalP || event.target== modalSC) {
                                    modalS.style.display = "none";
                                    modalP.style.display = "none";
                                    modalSC.style.display = "none";
                                  }
                                }
                                </script>
                                
					<div id="main">
                                            <form method="post" action="ServletAdminPrikazDelovaKonfig" enctype="multipart/form-data">
                                              <div class="w3-bar w3-black">
                                                <button type="button" onclick="otvoriDeo('gpu')">Grafička kartica</button>
                                                <button type="button" onclick="otvoriDeo('kuciste')">Kućište</button>
                                                <button type="button" onclick="otvoriDeo('kuleri')">Kuler</button>
                                                <button type="button" onclick="otvoriDeo('maticna')">Matična ploča</button>
                                                <button type="button" onclick="otvoriDeo('memorija')">Memorija</button>
                                                <button type="button" onclick="otvoriDeo('procesori')">Procesor</button>
                                                <button type="button" onclick="otvoriDeo('psu')">Napajanje</button>
                                                <button type="button" onclick="otvoriDeo('ram')">RAM</button>
                                                <input type='submit' value='Dodaj konfiguraciju' style='margin-left:100px;'>
                                              </div>
                                            
                                                
                                              <div id="gpu" class="deo" style="float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                      ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite grafičku karticu</h2>
                                                
                                                <table style='width:80%;'>
                                                    <%
                                                        if(gpu.size()>0)
                                                        {
                                                            int g= 0;
                                                        for(Gpu pom:gpu)
                                                        {
                                                            g++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle; white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                    <input type="checkbox" onchange="validateGPU(this)" name="gpuID" id="gpuID<%= g %>" class="gpucb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getGpuId() %>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>

                                              <div id="kuciste" class="deo" style="display: none;float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite kučište</h2>
                                                
                                                <table style='width:80%;'>
                                                    <%
                                                        if(kuciste.size()>0)
                                                        {
                                                            int ku = 0;
                                                        for(Kuciste pom:kuciste)
                                                        {
                                                            ku++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                   <input type="checkbox" name="caseID" id="caseID<%= ku %>" onchange="validateCase(this)" class="casecb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getKucisteId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                                
                                                
                                              </div>
                                            
                                            <div id="kuleri" class="deo" style="display: none;float:left;width:500px;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite kuler</h2>
                                                <table style='width:80%;'>
                                                    <%
                                                        if(kuler.size()>0)
                                                        {
                                                            int k = 0;
                                                        for(Kuleri pom:kuler)
                                                        {
                                                            k++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img  src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                   <input type="checkbox" name="coolerID" id="coolerID<%= k %>" onchange="validateCooler(this)" class="coolercb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getKulerId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                            
                                            <div id="maticna" class="deo" style="display: none;float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite matičnu ploču</h2>
                                                <table style='width:80%;'>
                                                    <%
                                                        if(maticna.size()>0)
                                                        {
                                                            int mb = 0;
                                                        for(Maticna pom:maticna)
                                                        {
                                                            mb++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                   <input type="checkbox" name="moboID" id="moboID<%= mb %>" onchange="validateMobo(this)" class="mobocb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getMaticnaId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                            
                                            <div id="memorija" class="deo" style="display: none;float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite memoriju</h2>
                                                 <table style='width:80%;'>
                                                    <%
                                                        if(memorija.size()>0)
                                                        {
                                                            int m = 0;
                                                        for(Memorija pom:memorija)
                                                        {
                                                            m++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                   <input type="checkbox" name="memID" id="memID<%= m %>" onchange="validateMem(this)" class="memcb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getMemorijaId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                            
                                            <div id="procesori" class="deo" style="display: none;float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite procesor</h2>
                                                <table style='width:80%;'>
                                                    <%
                                                        if(cpu.size()>0)
                                                        {
                                                            int c = 0;
                                                        for(Procesori pom:cpu)
                                                        {
                                                            c++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                    <input type="checkbox" name="cpuID" id="cpuID<%= c %>" onchange="validateCPU(this)" class="cpucb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getProcesorId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                            
                                            <div id="psu" class="deo" style="display: none;float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite napajanje</h2>
                                                <table style='width:80%;'>
                                                    <%
                                                        if(psu.size()>0)
                                                        {
                                                            int p=0;
                                                        for(Psu pom:psu)
                                                        {
                                                            p++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                    <input type="checkbox" name="psuID" id="psuID<%= p %>" onchange="validatePSU(this)" class="psucb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getPsuId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                            
                                            <div id="ram" class="deo" style="display: none;float:left;">
                                                <span onclick="this.parentElement.style.display='none'"
                                                      ><button type="button" style="margin-top: 10px;">X</button></span>
                                                <h2 style="padding-top:20px;">Izaberite RAM</h2>
                                                <table style='width:80%;'>
                                                    <%
                                                        if(ram.size()>0)
                                                        {
                                                            int r=0;
                                                        for(Ram pom:ram)
                                                        {r++;
                                                    %>
                                                    <tr style="background-color:transparent; border: 1px solid #2ebaae;"">
                                                        <td style="vertical-align: middle;">
                                                            <img src='<%= pom.getImgPath() %>' height="100" width="100">
                                                        </td>
                                                        <td style="vertical-align: middle;white-space: nowrap;overflow: hidden;">
                                                            <p><%= pom.getNaziv()%></p>
                                                        </td>
                                                        <td style="vertical-align: middle;">
                                                            <div id="ck-button">
                                                                <label>
                                                                    <input type="checkbox" name="ramID" id="ramID<%= r %>" onchange="validateRAM(this)" class="ramcb" data-original-title="<%= pom.getImgPath() %>" value="<%= pom.getRamId()%>"><span style='padding:0 !important; border: none;'>Dodaj</span>
                                                                </label>
                                                             </div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                              </div>
                                            <!--</form>-->
                                                <div style="float:right; width: 800px;padding-bottom: 250px;">
                                                    
                                                    <table>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td>
                                                                
                                                            </td>
                                                            <td style="width:20%;">
                                                                <%
                                                                    for(int mosub=1;mosub<=maticna.size();mosub++){
                                                                %>
                                                                <img id="moboIMG<%= mosub %>" src="#" alt="" style="float:left;">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                            <td>
                                                                <%
                                                                    for(int r=1;r<=ram.size();r++){
                                                                %>
                                                                <img id="ramIMG<%= r %>" src="#" alt="" style="float:right;">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td style="width:20%;">
                                                                <%
                                                                    for(int csub=1;csub<=cpu.size();csub++){
                                                                %>
                                                                <img id="cpuIMG<%= csub %>" src="#" alt="">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                            <td style="padding:0;">
                                                                <%
                                                                    for(int kasub=1;kasub<=kuciste.size();kasub++){
                                                                %>
                                                                <img id="caseIMG<%= kasub %>" src="#" alt="">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                            <td>
                                                                <%
                                                                    for(int ksub=1;ksub<=kuler.size();ksub++){
                                                                %>
                                                                <img id="coolerIMG<%= ksub %>" src="#" alt="">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color:transparent;border:none;"> 
                                                            <td>
                                                                <%
                                                                    for(int psub=1;psub<=psu.size();psub++){
                                                                %>
                                                                <img id="psuIMG<%= psub %>" src="#" alt="">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                            <td>
                                                                <%
                                                                    for(int gsub=1;gsub<=gpu.size();gsub++){
                                                                %>
                                                                <img id="gpuIMG<%= gsub %>" src="#" alt="">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                            <td>
                                                                <%
                                                                    for(int msub=1;msub<=memorija.size();msub++){
                                                                %>
                                                                <img id="memIMG<%= msub %>" src="#" alt="">
                                                                <%
                                                                    }
                                                                %>
                                                            </td>
                                                            
                                                        </tr>
                                                    </table>
                                                </div>
                                            <div style='clear: both;display:block;float:left;width:50%;padding-bottom: 50px;'>
                                                <h2>Opis konfiguracije</h2>
                                                <textarea name="text" cols="2" rows="5" maxlength="200" style="resize: none;width: 80%;"></textarea>
                                            </div>

                                            <div style='float:right;width:50%;padding-bottom: 50px;'>
                                                <h2>Slika konfiguracije</h2>
                                                <input type="file" name="fajl">
                                            </div>
                                                       <input type="hidden" id="korID" name="korID" value="<%= korisnik.getKorisnikId() %>">     
                                            </form>

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