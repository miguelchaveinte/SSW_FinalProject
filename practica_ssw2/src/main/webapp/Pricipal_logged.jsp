    <%@page import="java.util.ArrayList"%>
<%-- 
    Document   : Pricipal
    Created on : 20 abr. 2022, 11:18:59
    Author     : angel
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<%--
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/db_practica"
         user = "root" password = "admin"/>

<sql:query var="cursosGratuitos" dataSource="${snapshot}">

    select c.id, c.imagen
    from curso c
    where c.precio=0;

</sql:query>
    
<sql:query var="cursosDemandados" dataSource="${snapshot}">

    with demandas as(
        select dc.idcurso, count(*) as dem
        from desarrollocurso dc
        group by dc.idcurso
    )
    select d.idcurso, c.imagen
    from demandas d, curso c
    where 5>(select count(*)
             from demandas d1
             where d1.dem>d.dem) and c.id=d.idcurso;

</sql:query>
             
<sql:query var="cursosFavoritos" dataSource="${snapshot}">

    with valoraciones as(
        select dc.idcurso, avg(dc.valoracion) as media
        from desarrollocurso dc
        group by dc.idcurso
    )
    select v.idcurso, c.imagen
    from valoraciones v, curso c
    where 5>(select count(*)
             from valoraciones v1
             where v1.media>v.media) and c.id=v.idcurso;

</sql:query> --!>
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html lang="es">
    <head>
        <title>ULearn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="./main.81e26b4c.css">
        <link rel="stylesheet" type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <link rel="stylesheet" type="text/css"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    
    
    <body>
        <div id="general">
            <!--Div de la cabecera donde se encuentra el logo, buscador y demas opciones. Implementado mediante 2 menus-->
            <!--Div de la cabecera donde se encuentra el logo, buscador y demas opciones. Implementado mediante 2 menus-->
            <div id="cabecera">

                <nav class="bg-white navbar p-2 navbar-default py-2 navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center"><a class="navbar-brand py-1 mr-auto" href=""><img
                                    src="./Imagenes/icons8-e-learning-64.png" alt="ULearn logo"></a>
                            <a aria-expanded="false" role="button" class="nav-link mr-3" tabindex="0"
                                style="font-weight: bold; color: black; font: size 100px;">ULearn</a>
                            <form class="form-inline d-none d-sm-flex">
                                <span class="position-absolute ps-3 search-icon" for="search_search"><i
                                        class="fa fa-search"></i></span><input placeholder="Search Courses" type="Search"
                                    id="formSearch" class="ps-6 form-control" />
                            </form>
                        </div>
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
                            aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                        <!-- Navbar Collapse  // añadir show y esta-->
                        <div class="collapse navbar-collapse " id="navbarCollapse">
                
                
                            <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
                                <div class="input-label-absolute input-label-absolute-left w-100">
                                    <span class="position-absolute mt-2 ps-3 search-icon" for="search_search"><i
                                            class="fa fa-search"></i></span><input placeholder="Search Courses"
                                        type="Search" id="formSearch" class="ps-6 form-control" />
                                </div>
                            </form>
                
                            <ul class="navbar-nav ms-auto ">
                
                                <li class="nav-item mr-2"><a class="nav-link" style="font-size: 1.1em;" id="homeDropdownMenuLink"
                                        href="#">
                                        Home</a>
                
                                </li>
                                <li class="nav-item mr-2 "><a class="nav-link " style="font-size: 1.1em;" href="suscripciones.html">Suscripciones</a>
                
                                </li>
                                <li class="nav-item mr-2"><a aria-expanded="false" style="font-size: 1.1em;" role="button"
                                        tabindex="0" class="nav-link" href="./creados.html">Creador</a>
                                </li>
                                <li class="nav-item mr-2"><a class="nav-link " style="font-size: 1.1em;"
                                        id="docsDropdownMenuLink" href="./cursos.html" aria-haspopup="true"
                                        aria-expanded="false">
                                        Mis Cursos</a>
                                </li>
                
                                <!-- Pagina principal 
                                <li class="nav-item mr-2"><a aria-expanded="false" style="font-size: 1.1em;" role="button"
                                    tabindex="0" class="nav-link" href="./info_personal.html">Inicia Sesión</a>
                                </li>
                                <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a role="button" class="btn btn-primary" href="./info_personal.html" style="font-weight: bold; border-radius:15px ;" >Únete</a></li>-->
                
                                <li class="nav-item dropdown ms-lg-3"><a id="userDropdownMenuLink" href="#"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <div class="avatar avatar-md avatar-indicators avatar-online">
                                            <img alt="avatar" src="Imagenes/user.jpg" class="rounded-circle" />
                                        </div>
                                    </a>
                
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdownMenuLink"><a
                                            class="dropdown-item" href="./info_personal.html">Configuración usuario</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item"
                                            href="CerrarSesion"><i class="fas fa-sign-out-alt me-2 text-muted"></i>
                                            Cerrar Sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>

            <!--Div en el que inserto el boton intermedio para la opcion de convertirse en instructor-->
            <div class="intermedio">
                <!--Insertamos el boton que nos abrira el pop-up para convertirnos en creadores-->
                <a href="hazte_creador.html" class="button" style="text-align: center;">Conviérte en Instructor</a>
            </div>
            
            <!--Etiqueta para representar el contenido principal del body-->
            <main style="margin-top: 50px;">
                <!--Los div por defecto tienen la propiedad de display:block, es decir, los elementos ocupan el 100% del ancho-->
                <div class="cursos">
                    <h2>Cursos gratuitos</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev" data-button="button-prev" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button>
                        <div class="slick-track" id="track">
                            <%ArrayList<Integer> a = (ArrayList<Integer>)request.getAttribute("cursosGratuitos");%>
                            <c:set var = "cursosGratuitos" value = "<%=a%>"/>
                            <c:forEach var="cursoGratuito" items="${cursosGratuitos}">
                                <div class="slick">
                                    <div>
                                        <a href="accederCurso?idCurso=${cursoGratuito}">
                                            <picture>
                                                <img  alt="Imagen" src="imagenCurso?id=${cursoGratuito}">
                                            </picture>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <button class="slick-arrow slick-next" id="button-next" data-button="button-next" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button>
                    </div>
                </div>

                <div class="cursos">
                    <h2>Cursos más demandados</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev" data-button="button-prev" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button>
                        <div class="slick-track" id="track">
                           <%ArrayList<Integer> b = (ArrayList<Integer>)request.getAttribute("cursosDemandados");%>
                            <c:set var = "cursosDemandados" value = "<%=b%>"/>
                            <c:forEach var="cursoDemandado" items="${cursosDemandados}">
                                <div class="slick">
                                    <div>
                                        <a href="accederCurso?idCurso=${cursoDemandado}">
                                            <picture>
                                                <img alt="Imagen" src="imagenCurso?id=${cursoDemandado}">
                                            </picture>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <button class="slick-arrow slick-next" id="button-next" data-button="button-next" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button>
                    </div>
                </div>

                <div class="cursos">
                    <h2>Cursos mejores valorados</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev" data-button="button-prev" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button> 
                        <div class="slick-track" id="track">
                            <%ArrayList<Integer> c = (ArrayList<Integer>)request.getAttribute("cursosFavoritos");%>
                            <c:set var = "cursosFavoritos" value = "<%=c%>"/>
                            <c:forEach var="cursoFavorito" items="${cursosFavoritos}">
                                <div class="slick">
                                    <div>
                                        <a href="accederCurso?idCurso=${cursoFavorito}">
                                            
                                            <picture>
                                                <img alt="Imagen" src="imagenCurso?id=${cursoFavorito}">
                                            </picture>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>                               
                        </div>
                        <button class="slick-arrow slick-next" id="button-next" data-button="button-next" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button> 
                    </div>
                </div>
                <script defer src="carrusel.js"></script>
            </main>

            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="footer-col">
                            <h4>company</h4>
                            <ul>
                                <li><a href="#">about us</a></li>
                                <li><a href="#">our services</a></li>
                                <li><a href="#">privacy policy</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>get help</h4>
                            <ul>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">shipping</a></li>
                                <li><a href="#">returns</a></li>
                                <li><a href="#">order status</a></li>
                                <li><a href="#">payment options</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>follow us</h4>
                            <div class="social-links">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
           </footer>

        </div>
    
        <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <!-- Popper JS -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <!-- Bootstrap JS -->
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
        <script>
            function cambiarLogin(a,b) {
              /*var tab=document.getElementById("loginModal");
              tab.className="modal fade";
              tab.style.display="none";
              tab.setAttribute("aria-hidden", "true");
          
              var tab2=document.getElementById("login2");
              tab2.style.display="block";
              tab2.className="modal fade show";
              tab2.removeAttribute("aria-hidden");*/
              $(document).ready(function () {
                $(a).modal('show');
                
              });
              $(document).ready(function () {
                $(b).modal('hide');
                
              });
        
            }
          </script>
    
    </body>


</html>
