<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    //int idCurso = 1;
    //Boolean suscripciones[]=(Boolean [])request.getAttribute("suscripciones");
    Boolean[] suscripciones = new Boolean[4];
    Arrays.fill(suscripciones, Boolean.FALSE);
    suscripciones[0]=true;
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>ULearn</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="main.81e26b4c.css" rel="stylesheet">

    <!--==================== UNICONS ====================-->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v3.0.6/css/line.css">

    <!--==================== CSS ====================-->
    <link rel="stylesheet" href="style_planes.css">

    <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>

<body>
    <div id="general">

            <nav class="bg-white navbar p-2 navbar-default py-2 navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <div class="d-flex align-items-center"><a class="navbar-brand py-1 mr-auto" href="Pricipal_logged.html"><img
                                src="./Imagenes/icons8-e-learning-64.png" alt="ULearn logo"></a>
                        <a aria-expanded="false" role="button" class="nav-link mr-3" tabindex="0"
                            style="font-weight: bold; color: black; font: size 100px;" href="Pricipal_logged.html">ULearn</a>
                        <form class="form-inline d-none d-sm-flex">
                            <span class="position-absolute mt-2 ps-3 search-icon" for="search_search"><i
                                    class="fa fa-search"></i></span><input placeholder="Search Courses" type="Search"
                                id="formSearch" class="ps-6 form-control" />
                        </form>
                    </div>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
                        aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                    <!-- Navbar Collapse  // añadir show (javascrip)-->
                    <div class="collapse navbar-collapse " id="navbarCollapse">


                        <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
                            <div class="input-label-absolute input-label-absolute-left w-100">
                                <span class="position-absolute mt-2 ps-3 search-icon" for="search_search"><i
                                        class="fa fa-search"></i></span><input placeholder="Search Courses"
                                    type="Search" id="formSearch" class="ps-6 form-control" />
                            </div>
                        </form>

                        <ul class="navbar-nav ms-auto ">

                            <li class="nav-item mr-2"><a class="nav-link" style="font-size: 1.1em;"
                                    id="homeDropdownMenuLink" href="Pricipal_logged.html">
                                    Home</a>

                            </li>
                            <li class="nav-item mr-2 "><a class="nav-link " style="font-size: 1.1em;"
                                    href="suscripciones.html">Suscripciones</a>

                            </li>
                            <li class="nav-item mr-2"><a aria-expanded="false" style="font-size: 1.1em;" role="button"
                                    tabindex="0" class="nav-link" href="creados.html">Creador</a>
                            </li>
                            <li class="nav-item mr-2"><a class="nav-link " style="font-size: 1.1em;"
                                    id="docsDropdownMenuLink" href="cursos.html" aria-haspopup="true"
                                    aria-expanded="false">
                                    Mis Cursos</a>
                            </li>

                            <li class="nav-item dropdown ms-lg-3"><a id="userDropdownMenuLink" href="#"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="avatar avatar-md avatar-indicators avatar-online">
                                        <img alt="avatar" src="Imagenes/user.jpg" class="rounded-circle" />
                                    </div>
                                </a>

                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdownMenuLink"><a
                                        class="dropdown-item" href="./info_personal.html">Configuración usuario</a>
                                    <div class="dropdown-divider"></div><a class="dropdown-item"
                                        href="./info_personal.html"><i class="fas fa-sign-out-alt me-2 text-muted"></i>
                                        Cerrar Sesión</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        <section class="card container grid">
            <c:set var = "suscripcion" value = "<%=suscripciones%>"/>
            
            <div class="card__container grid" style="margin: 80px;">
                <!--==================== CARD 1 ====================-->
                <c:if test="${suscripcion[0]}">
                    <article class="card__content grid" style="pointer-events: none; opacity:0.3;">
                </c:if>
                <c:if test="${!suscripcion[0]}">
                    <article class="card__content grid">
                </c:if>
                        
                
                    <div class="card__pricing">
                        <div class="card__pricing-number">
                            <span class="card__pricing-symbol">€</span>0
                        </div>
                        <span class="card__pricing-month">/mes</span>
                    </div>

                    <span class="card__header-subtitle">Plan gratis</span>
                    <h1 class="card__header-title">Gratuito</h1>
                    </header>

                    <ul class="card__list grid mt-3">
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos <strong>gratuitos</strong></p>
                        </li>
                    </ul>
                    <c:if test="${suscripcion[0]}">
                        <button class="card__button" >Ya dispones de este plan </button>
                    </c:if>
                    <c:if test="${!suscripcion[0]}">
                        <button class="card__button" onclick="location.href='anadirSuscripcion?suscripcion=GRATIS'">Elegir este plan </button>
                    </c:if>
                    
                </article>

                <!--==================== CARD 2 ====================-->
                <c:if test="${suscripcion[1]}">
                    <article class="card__content grid" style="pointer-events: none; opacity:0.3;">
                </c:if>
                <c:if test="${!suscripcion[1]}">
                    <article class="card__content grid">
                </c:if>
                    <div class="card__pricing">
                        <div class="card__pricing-number">
                            <span class="card__pricing-symbol">€</span>9.99
                        </div>
                        <span class="card__pricing-month">/mes</span>
                    </div>

                    <span class="card__header-subtitle">Para estudiantes</span>
                    <h1 class="card__header-title">Estudiante</h1>
                    </header>

                    <ul class="card__list grid mt-3">
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos <strong>gratuitos</strong></p>
                        </li>
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos de <strong>pago</strong></p>
                        </li>
                    </ul>

                    <c:if test="${suscripcion[1]}">
                        <button class="card__button" >Ya dispones de este plan </button>
                    </c:if>
                    <c:if test="${!suscripcion[1]}">
                        <button class="card__button" onclick="location.href='anadirSuscripcion?suscripcion=ESTUDIANTE'">Elegir este plan </button>
                    </c:if>
                       
                    </button>
                </article>

                <!--==================== CARD 3 ====================-->
                <c:if test="${suscripcion[2]}">
                    <article class="card__content grid" style="pointer-events: none; opacity:0.3;">
                </c:if>
                <c:if test="${!suscripcion[2]}">
                    <article class="card__content grid">
                </c:if>
                    <div class="card__pricing">
                        <div class="card__pricing-number">
                            <span class="card__pricing-symbol">€</span>19.99
                        </div>
                        <span class="card__pricing-month">/mes</span>
                    </div>

                    <span class="card__header-subtitle">Más popular</span>
                    <h1 class="card__header-title">Básico</h1>
                    </header>

                    <ul class="card__list grid mt-3">
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos <strong>gratuitos</strong></p>
                        </li>
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos de <strong>pago</strong></p>
                        </li>
                    </ul>
                    <c:if test="${suscripcion[2]}">
                        <button class="card__button" >Ya dispones de este plan </button>
                    </c:if>
                    <c:if test="${!suscripcion[2]}">
                     <button class="card__button" onclick="location.href='anadirSuscripcion?suscripcion=TOTAL'">Elegir este plan </button>
                    </c:if>
                </article>
                <!--==================== CARD 4 ====================-->
                    <article class="card__content grid">

                    <div class="card__pricing">
                        <div class="card__pricing-number">
                            <span class="card__pricing-symbol">€</span>3.99
                        </div>
                        <span class="card__pricing-month">/mes</span>
                    </div>

                    <span class="card__header-subtitle">Cursos Autor</span>
                    <div>
                        <div style="float:left; margin-right: 30px;">
                            <h1 class="card__header-title">Autor

                            </h1>
                        </div>
                        <div> <form class="form-inline d-sm-flex">
                            <span class="position-absolute mt-2 ps-1 search-icon" for="search_search"><img src="Imagenes/icon_suscrp.jpeg" alt="" width="18px" height="18px"></span><input placeholder="Usuario Autor" type="Search"
                                id="formSearchusuarioAutor" class="form-control" style="padding-left:28px" />
                        </form></div>
                        
                    </div>

                    </header>

                    <ul class="card__list grid mt-3">
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos <strong>gratuitos</strong></p>
                        </li>
                        <li class="card__list-item">
                            <i class="uil uil-check card__list-icon"></i>
                            <p class="card__list-description mt-3">Cursos del <strong>autor</strong></p>
                        </li>
                    </ul>



                     <button class="card__button" onclick="location.href='anadirSuscripcion?suscripcion=AUTOR&nombre='+document.getElementById('formSearchusuarioAutor').value">Elegir este plan </button>
                </article>
            </div>
        </section>
    </div>
</body>

</html>
