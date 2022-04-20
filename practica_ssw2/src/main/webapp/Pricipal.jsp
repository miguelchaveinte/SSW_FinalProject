    <%-- 
    Document   : Pricipal
    Created on : 20 abr. 2022, 11:18:59
    Author     : angel
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<sql:query var="cursosGratuitos" dataSource="jdbc/db_practica">

    select c.id 
    from curso c
    where c.precio=0;

</sql:query>
    
<sql:query var="cursosDemandados" dataSource="jdbc/db_practica">

    with demandas as(
        select dc.idcurso, count(*) as dem
        from desarrollocurso dc
        group by dc.idcurso
    )
    select d.idcurso
    from demandas d
    where 5>(select count(*)
             from demandas d1
             where d1.dem>d.dem);

</sql:query>
             
<sql:query var="cursosFavoritos" dataSource="jdbc/db_practica">

    with valoraciones as(
        select dc.idcurso, avg(dc.valoracion) as media
        from desarrollocurso dc
        group by dc.idcurso
    )
    select v.idcurso
    from valoraciones v
    where 5>(select count(*)
             from valoraciones v1
             where v1.media>v.media);

</sql:query>

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
                                <li class="nav-item mr-2">
                                    <div><a  style="font-size: 1.1em;" role="button"
                                    tabindex="0" class="nav-link" data-toggle="modal" data-target="#login2">Inicia Sesión</a>
                                    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                        <div class="modal-header border-bottom-0">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="card">
                                            <div class="p-6 card-body">
                                            <div class="mb-4"><a href="/"><img src="Imagenes/icons8-e-learning-64.png"
                                                    alt="" class="mb-4"></a>
                                                <h1 class="mb-1 fw-bold">Registrarse</h1><span>¿Tienes una cuenta? <a class="ms-1" 
                                                    href=#login2 onclick="cambiarLogin('#login2','#loginModal');">Inicia Sesión</a></span>
                                            </div>
                                            <form class="" action="registrarUsuario" method="post">
                                                <div class="row">
                                                <div class="mb-3 col-lg-12 col-md-12"><label class="form-label">Nombre de Usuario</label><input
                                                    placeholder="User Name" required="" type="text" id="username" name="username" class="form-control"></div>
                                                <div class="mb-3 col-lg-12 col-md-12"><label class="form-label">Correo Electrónico </label><input
                                                    placeholder="Email address here" required="" type="email" id="email" name="email" class="form-control"></div>
                                                <div class="mb-3 col-lg-12 col-md-12"><label class="form-label">Contraseña </label><input
                                                    placeholder="**************" required="" type="password" id="password" name="password" class="form-control"></div>
                                                <div class="mb-3 col-lg-12 col-md-12">
                                                    <div class="form-check"><input type="checkbox" id="check-api-checkbox"
                                                        class="form-check-input"><label for="check-api-checkbox" class="form-check-label">Acepto los términos y condiciones</label></div>
                                                </div>
                                                <div class="mb-0 d-grid gap-2 col-lg-12 col-md-12" style="display: grid!important;"><button type="submit" class="btn btn-primary">Acceder</button></div>
                                                </div>
                                            </form>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                </li>
                                <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a role="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal"
                                    style="font-weight: bold; border-radius:15px; color: white;" >Únete</a></li>
                
                                <!--MODAL-->                    
                                    <div class="modal fade" id="login2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                        <div class="modal-header border-bottom-0">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="card">
                                            <div class="p-6 card-body">
                                            <div class="mb-4"><a href="/"><img src="Imagenes/icons8-e-learning-64.png"
                                                    alt="" class="mb-4"></a>
                                                <h1 class="mb-1 fw-bold">Inicio Sesión</h1><span>¿No tienes cuenta? <a class="ms-1" onclick="cambiarLogin('#loginModal','#login2');" href=#loginModal>Regístrate</a></span>
                                                <!-- poner funcion de cambio a sign up-->
                                            </div>
                                            <form class="" action="iniciarSesion" method="post">
                                                <div class="row">
                                                <div class="mb-3 col-lg-12 col-md-12"><label class="form-label">Nombre de Usuario</label><input
                                                    placeholder="User Name" required="" type="text" id="username" name="username" class="form-control"></div>
                                                <div class="mb-3 col-lg-12 col-md-12"><label class="form-label">Email </label><input
                                                    placeholder="Email address here" required="" type="email" id="email" name="email" class="form-control"></div>
                                                <div class="mb-3 col-lg-12 col-md-12"><label class="form-label">Contraseña </label><input
                                                    placeholder="**************" required="" type="password" id="password" name="password" class="form-control"></div>
                                                <div class="mb-3 col-lg-12 col-md-12">
                                                    <div class="form-check"><input type="checkbox" id="check-api-checkbox"
                                                        class="form-check-input"><label for="check-api-checkbox" class="form-check-label">Recordad Contraseña</label></div>
                                                </div>
                                                <div class="mb-0 d-grid gap-2 col-lg-12 col-md-12" style="display: grid!important;"><button type="submit" class="btn btn-primary">Acceder</button></div>
                                                </div>
                                            </form>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                    </div>
                            </ul>
                        </div>
                        
                    </div>
                </nav>
            </div>


            <!--Etiqueta para representar el contenido principal del body-->
            <main style="margin-top: 50px;">
                <!--Los div por defecto tienen la propiedad de display:block, es decir, los elementos ocupan el 100% del ancho-->
                <div class="cursos">
                    <h2>Cursos gratuitos</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button>
                        <div class="slick-track" id="track">
                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/ensamblador.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/java.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/php.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/python.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <button class="slick-arrow slick-next" id="button-next">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button> 
                    </div>
                </div>

                <div class="cursos">
                    <h2>Cursos más demandados</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button> 
                        <div class="slick-track" id="track">
                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/python.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/php.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/ensamblador.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/java.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <button class="slick-arrow slick-next" id="button-next">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button> 
                    </div>
                </div>

                <div class="cursos">
                    <h2>Cursos mejores valorados</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button> 
                        <div class="slick-track" id="track">
                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/ensamblador.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/java.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/php.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                            <div class="slick">
                                <div>
                                    <a href="Info_cursos_0.html">
                                        <picture>
                                            <img src="./Imagenes/python.jfif" alt="Imagen">
                                        </picture>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <button class="slick-arrow slick-next" id="button-next">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button> 
                    </div>
                </div>
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
