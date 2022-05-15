<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    //int idCurso = 1;
    Boolean suscripciones[]=(Boolean [])request.getAttribute("suscripciones");
    //Boolean[] suscripciones = new Boolean[4];
    //Arrays.fill(suscripciones, Boolean.FALSE);
    //suscripciones[0]=true;
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

         <%@include file="./header_logged.jsp" %>
         
        <section class="card container grid">
            <c:set var = "suscripcion" value = "<%=suscripciones%>"/>
            
            <div class="card__container grid" style="margin: 80px;">
                <!--==================== CARD 1 ====================-->
                <c:if test="${suscripcion[0]|| suscripcion[1] ||suscripcion[2] }">
                    <article class="card__content grid" style="pointer-events: none; opacity:0.3;">
                </c:if>
                <c:if test="${!(suscripcion[0]|| suscripcion[1] ||suscripcion[2])}">
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
                    <c:if test="${(suscripcion[1] ||suscripcion[2]) && !suscripcion[0]}">
                        <button class="card__button" >Plan ya incluido en otra suscripción </button>
                    </c:if>
                    <c:if test="${!(suscripcion[0]||suscripcion[1] ||suscripcion[2])}">
                        <button class="card__button" onclick="location.href='anadirSuscripcion?suscripcion=GRATIS'">Elegir este plan </button>
                    </c:if>
                    
                </article>

                <!--==================== CARD 2 ====================-->
                <c:if test="${suscripcion[1] ||suscripcion[2] }">
                    <article class="card__content grid" style="pointer-events: none; opacity:0.3;">
                </c:if>
                <c:if test="${!(suscripcion[1]||suscripcion[2])}">
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
                    <c:if test="${suscripcion[2]}">
                        <button class="card__button" >Plan incompatible con otra suscripción adquirida</button>
                    </c:if>
                    <c:if test="${!(suscripcion[1]|| suscripcion[2])}">
                        <button class="card__button" onclick="location.href='anadirSuscripcion?suscripcion=ESTUDIANTE'">Elegir este plan </button>
                    </c:if>
                       
                    </button>
                </article>

                <!--==================== CARD 3 ====================-->
                <c:if test="${suscripcion[1]||suscripcion[2]}">
                    <article class="card__content grid" style="pointer-events: none; opacity:0.3;">
                </c:if>
                <c:if test="${!(suscripcion[1]||suscripcion[2])}">
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
                    <c:if test="${suscripcion[1]}">
                        <button class="card__button" >Plan incompatible con otra suscripción adquirida</button>
                    </c:if>
                    <c:if test="${!(suscripcion[2]||suscripcion[1])}">
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
            <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- Popper JS -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <!-- Bootstrap JS -->
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
</body>

</html>
