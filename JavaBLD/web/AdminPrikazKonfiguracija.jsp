<%@page import="entity.Podkomentari"%>
<%@page import="entity.Komentari"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="javax.servlet.http.*" %>
<%@page import="entity.Korisnici" %>
<%@page import="entity.Konfiguracije" %>
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
						<h1><a href="Pocetna" style="color:white;font-size: 20px;"><img style="filter: drop-shadow(1px 1px 1px rgba(46,186,174,1));" class="logo" src="images/logo2.png" width="50" height="50"></a></h1>
                                            <style>
                                                .logo:hover{
                                                    filter: drop-shadow(3px 4px 11px rgba(46,186,174,1)) !important;
                                                }
                                            </style>
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
								<li><a href="Igrice" style="color: #ffffff">Igrice</a></li>
								<li><a href="Konfiguracije" style="color: #ffffff">Konfiguracije</a></li>
                                                                
                                                                
                                                                    <%
                                                                        
                                                                        if(korisnik!=null)
                                                                        {
                                                                            %> 
                                                                            <li><a href="MojeKonfiguracije?id=<%= korisnik.getKorisnikId() %>" style="color: #ffffff">Moje konfiguracije</a></li>
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
										<a href="ServletAdminPrikazIgrica">
                                                                                    <p style="font-size:0.8em;">Igrice</p>
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
                                                                        <li style="color: #d4d4d6;">
										<a href="ServletUrednikOdobravanjeKonfig">
                                                                                    <p style="font-size:0.8em;">Odobri konfiguraciju</p>
										</a>
									</li>
                                                                                <%}
                                                                                if(korisnik.getUloga().equals("Klijent"))
                                                                                {%>
                                                                        <li style="color: #d4d4d6;">
                                                                            <a href="IzmenaProfila?id=<%= korisnik.getKorisnikId() %>">
                                                                                <p style="font-size:0.8em;">Vaš profil</p>
                                                                            </a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="Poruke?id=<%= korisnik.getKorisnikId() %>">
                                                                                    <p style="font-size:0.8em;">Poruke</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="Konfiguracije">
                                                                                    <p style="font-size:0.8em;">Konfiguracije</p>
										</a>
									</li>
                                                                        <li style="color: #d4d4d6;">
										<a href="DodajKonfiguraciju">
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

                                
                                <div id="myModalI" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeI">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Izmene su uspešno sačuvane!</b></p>
                                  </div>

                                </div>
                                
                                <div id="myModalK" class="modal">

                                  <!-- Modal content -->
                                  <div class="modal-content">
                                    <span class="close" id="closeK">&times;</span>
                                    <p style="margin-bottom:5px;"><b>Konfiguracija je poslata na odobravanje!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalI = document.getElementById("myModalI");
                                    var spanI = document.getElementById("closeI");
                                    var modalK = document.getElementById("myModalK");
                                    var spanK = document.getElementById("closeK");
                                    <%
                                        if(request.getAttribute("uspesno")!=null)
                                        {
                                    %>
                                    $(document).ready(function(){
                                        modalI.style.display = "block";
                                    })
                                    <%
                                        }
                                    %>
                                        
                                        <%
                                        if(request.getAttribute("korisnikKonfig")!=null)
                                        {
                                    %>
                                    $(document).ready(function(){
                                        modalK.style.display = "block";
                                    })
                                    <%
                                        }
                                    %>
                                        spanI.onclick = function() {
                                  modalI.style.display = "none";
                                }
                                
                                spanK.onclick = function() {
                                  modalK.style.display = "none";
                                }
                                </script>
                                <%
                                    ArrayList<Konfiguracije> konfig = (ArrayList<Konfiguracije>)request.getAttribute("konfig");
                                    ArrayList<Komentari> komentar = new ArrayList<Komentari>();
                                    if(((ArrayList<Komentari>)request.getAttribute("komentar")).size()>0)
                                    {
                                        komentar = (ArrayList<Komentari>)request.getAttribute("komentar");
                                    }

                                    ArrayList<Podkomentari> podkom = (ArrayList<Podkomentari>)request.getAttribute("podkom");
                                %>
                                
                                
                                
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
                                    <p style="margin-bottom:5px;"><b>Konfiguracija uspešno obrisana!</b></p>
                                  </div>

                                </div>
                                
                                <script>
                                    var modalP = document.getElementById("myModalP");
                                    var spanP = document.getElementById("closeP");
                                    <%
                                    if(request.getAttribute("obrisano")!=null)
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
                                
                                window.onclick = function(event) {
                                  if (event.target == modalP) {
                                    modalP.style.display = "none";
                                  }
                                }
                                </script>
                                
                                <style>
                                    .dropbtn {
                                        color: white;
                                        font-size: 0.7em;
                                        border: none;
                                        cursor: pointer;
                                        border: none;
                                        outline: none;
                                        padding-top:4px;
                                        background: none;
                                        height: 100%;
                                        box-shadow: none;
                                      }

                                      .dropbtn:hover, .dropbtn:focus {
                                        color: white;
                                        outline: none;
                                        box-shadow: none;
                                      }

                                      .dropdown {
                                        position: relative;
                                        display: inline-block;
                                      }

                                      .dropdown-content {
                                        display: none;
                                        position: absolute;
                                        background-color: #f1f1f1;
                                        min-width: 125px;
                                        overflow: auto;
                                        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                                        z-index: 1;
                                      }

                                      .dropdown-content a {
                                        color: black;
                                        padding: 12px 16px;
                                        text-decoration: none;
                                        display: block;
                                      }

                                      .dropdown a:hover {background-color: #ddd;}

                                      .show {display: block;}
                                </style>
                                
                                

				<!-- Main -->
					<div id="main">

						<!-- Post -->
                                                <%  int a = 0;
                                                    if(!konfig.isEmpty())
                                                    {
                                                    for(Konfiguracije pom:konfig)
                                                    {a++;
                                                %>
							<article class="post" style="width: 32%;float:left;margin: 10px;height: 850px;">
                                                            <header style="background-color:#12131E;padding: 0; height: 70px;margin-bottom: 0;">
									<div class="meta" style="padding-top:20px; height: 100%;padding-left: 30px;">
                                                                            <img src="<%= pom.getKorisnici().getImgPath() %>" height="40" width="40" style="border-radius: 50%;vertical-align: middle;display: inline-block;float:left;margin-top: -5px;"/><h4 style="color:white;padding-top: 5px;text-align: justify;margin-left: 50px;"><%= pom.getKorisnici().getIme() %> <%= pom.getKorisnici().getPrezime()%></h4> 
									</div>
                                                                        <%
                                                                            if(korisnik!=null){
                                                                            if(korisnik.getUloga().equals("Admin") || korisnik.getUloga().equals("Urednik") || korisnik.getKorisnikId() == pom.getKorisnici().getKorisnikId()){
                                                                        %>
                                                                        <div class="dropdown">
                                                                            <button onclick="myFunction('myDropdown<%= a %>')" id="drp<%= a %>"  class="dropbtn">Opcije</button>
                                                                            <div id="myDropdown<%= a %>" class="dropdown-content">
                                                                              <a href="IzmeniKonfiguraciju?id=<%= pom.getKonfiguracijaId() %>" style="border:none;">Izmeni</a>
                                                                              <a href="ObrisiKonfiguraciju?id=<%= pom.getKonfiguracijaId() %>" style="border:none;">Obriši</a>
                                                                            </div>
                                                                          </div>
                                                                            <%
                                                                                }}
                                                                            %>
								</header>
                                                                        
                                                                        <script>
                                                                        function myFunction(obj) {
                                                                          
                                                                          var x = document.getElementsByClassName("dropdown-content");
                                                                          for(a = 0; a<x.length;a++)
                                                                          {
                                                                              var id = x[a].id;
                                                                              console.log(id);
                                                                              document.getElementById(id).setAttribute("class","dropdown-content");
                                                                          }
                                                                          document.getElementById(obj).classList.toggle("show");
                                                                        }

                                                                        window.onclick = function(event) {
                                                                          if (!event.target.matches('.dropbtn')) {
                                                                            var dropdowns = document.getElementsByClassName("dropdown-content");
                                                                            var i;
                                                                            for (i = 0; i < dropdowns.length; i++) {
                                                                              var openDropdown = dropdowns[i];
                                                                              if (openDropdown.classList.contains('show')) {
                                                                                openDropdown.classList.remove('show');
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                        </script>
                                                                        
                                                                        
                                                                        
                                                                        <div style="margin-left:-3em;margin-right: -3em;max-height: 361px;">
                                                                            <img src="<%= pom.getImgPath() %>" alt="" style='width:100%;max-height: 361px;'/>
                                                                        </div>
                                                            <table style="margin-bottom: 0;margin-top: 10px;">
                                                                <tr style="background-color:transparent;border-top: none;border-bottom: 1px solid rgba(160, 160, 160, 0.3);border-top: 1px solid rgba(160, 160, 160, 0.3);">
                                                                    <td>
                                                                        
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Grafička kartica:</b> <%= pom.getGpu().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Kućište:</b> <%= pom.getKuciste().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Kuler:</b> <%= pom.getKuleri().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Matična ploča:</b> <%= pom.getMaticna().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Procesor:</b> <%= pom.getProcesori().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Napajanje:</b> <%= pom.getPsu().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>RAM:</b> <%= pom.getRam().getNaziv() %></p>
                                                                        <p style="margin-bottom: 5px;font-size: 17px;"><b>Memorija:</b> <%= pom.getMemorija().getNaziv() %></p>
                                                                    </td>
                                                                </tr>
                                                                    
                                                            </table>
								<footer style="position:absolute;bottom:0;height: 5%;">
									<ul class="stats" style="font-size:180% !important;">
                                                                            <li><a href="Komentari?id=<%= pom.getKonfiguracijaId() %>" class="icon solid fa-comment" >
                                                                                    <% int x = 0;
                                                                                        for(Komentari kom:komentar)
                                                                                        {
                                                                                            if(kom.getKonfiguracije().getKonfiguracijaId() == pom.getKonfiguracijaId())
                                                                                            {
                                                                                                x++;
                                                                                                
                                                                                                for(Podkomentari pkom:podkom)
                                                                                                {
                                                                                                    if(pkom.getKomentari().getKomentarId() == kom.getKomentarId())
                                                                                                    {
                                                                                                        x++;
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            
                                                                                        }
                                                                                        
                                                                                        
                                                                                    %><%= x %>
                                                                                </a></li>
									</ul>
								</footer>
                                                                    
							</article>
                                                        <%
                                                            }
                                                        }
                                                        else
                                                        {
                                                        %>
                                                        <article class="post" style="max-width: 50%; margin: auto;">
                                                            <h2 style="color: black;text-align: center;">
                                                                Trenutno nema konfiguracija!
                                                            </h2>
							</article>
                                                            <%
                                                                }
                                                            %>
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