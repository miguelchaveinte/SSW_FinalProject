<%-- 
    Document   : InfoCursos
    Created on : 20-abr-2022, 11:33:53
    Author     : Jhon
--%>



<%@page import="ulearn.model.Seccion"%>
<%@page import="ulearn.model.Curso"%>
<%@page import="ulearn.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    //int idCurso = 1;
    //int idseccion = 1;
    int i=1;
    int idCurso = Integer.parseInt(request.getParameter("idCurso"));
    int idseccion = Integer.parseInt(request.getParameter("seccion"));
    User user=(User)request.getAttribute("infoCreador");
    double valoracion=(double)request.getAttribute("valoracion");
    Curso curso=(Curso)request.getAttribute("infoCurso");
    ArrayList<Seccion> listSecciones=(ArrayList<Seccion>) request.getAttribute("listSecciones");
%>

<%--<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/db_practica"
         user = "root" password = "admin"/>  <!<!-- CAMBIAR CONTRASRÑA: admin -->

<c:set var = "id" value = "<%=idCurso%>"/>
<c:set var = "idseccion" value = "<%=idseccion%>"/>
<c:set var = "i" value = "<%=i%>"/>

<sql:query var="listSecciones" dataSource = "${snapshot}" >
    
    SELECT ID, NOMBRE, DESCRIPCION, VIDEO, DURACION FROM SECCION WHERE IDCURSO = ?  ORDER BY ID; 
    <sql:param value = "${id}" />
    
</sql:query>
    
<sql:query var="infoCreador" dataSource = "${snapshot}" >

    SELECT U.NOMBREUSUARIO, U.NOMBRE, C.NOMBRECURSO AS NOMBRECURSO,U.APELLIDO FROM CURSO C, USUARIO U WHERE C.ID = ? AND U.ID=C.CREADOR; 
    <sql:param value = "${id}" />

</sql:query>--%>

        
    
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html lang="es">
    <head>
        <meta charset="utf-8">
        <link rel="icon" href="/favicon.ico">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="theme-color" content="#000000">
        <meta name="description" content="Web site created using create-react-app">
        <title>ULearn</title>
        <script type="text/javascript" id="www-widgetapi-script" src="https://www.youtube.com/s/player/2fd2ad45/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
        <script defer="defer" src="app.js"></script>

        <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>  

        <link href="main.81e26b4c.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    
    
    <body>
        <!--Cabecera de la pagina-->
        <nav class="bg-white navbar p-2 navbar-default py-2 navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <div class="d-flex align-items-center"><a class="navbar-brand py-1 mr-auto" href="Pricipal_logged.html"><img
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
                                href="Pricipal_logged.html">
                                Home</a>
        
                        </li>
                        <li class="nav-item mr-2 "><a class="nav-link " style="font-size: 1.1em;" href="suscripciones.html">Suscripciones</a>
        
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
                                    href="Pricipal.html"><i class="fas fa-sign-out-alt me-2 text-muted"></i>
                                    Cerrar Sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="py-lg-5 py-5">
            <div class="container">
                <!--Este div es para el video del curso-->
                <div class="row">
                    <div class="mb-5 col-lg-12 col-md-12 col-sm-12">
                        <div class="rounded-3 position-relative w-100 d-block overflow-hidden p-0" style="height: 600px;">
                            <div class="">

                                <iframe class="position-absolute top-0 end-0 start-0 end-0 bottom-0 h-100 w-100"
                                    frameborder="0" allowfullscreen="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    title="YouTube video player" width="100%" height="360"
                                    src=<%=listSecciones.get(idseccion-1).getVideo()%> id="widget2">
                                </iframe>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <!--Este div es para el resto de la pagina-->
                <div class="row">
                    <div class="mb-4 mb-xl-0 col-xl-8 col-lg-12 col-md-12 col-sm-12">
                        <div class="mb-5 card">

                            <!--Div con el nombre del curso, puntuacion media, nombre del autor, etc...-->
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h1 class="fw-semi-bold mb-2"><%=curso.getNombre()%></h1>
                                </div>

                                <div class="d-flex mb-5"><span><span class="text-warning">
                                            
                                            <!--Estrellas para representar la puntuacion media???-->
                                            <svg viewBox="0 0 24 24" role="presentation"
                                                style="width: 0.875rem; height: 0.875rem;">
                                                <path
                                                    d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                    style="fill: currentcolor;"></path></svg>

                                            <svg viewBox="0 0 24 24" role="presentation"
                                                style="width: 0.875rem; height: 0.875rem;">
                                                <path
                                                    d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                    style="fill: currentcolor;"></path>
                                            </svg>
                                            
                                            <svg viewBox="0 0 24 24" role="presentation"
                                                style="width: 0.875rem; height: 0.875rem;">
                                                <path
                                                    d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                    style="fill: currentcolor;"></path>
                                            </svg>
                                            
                                            <svg viewBox="0 0 24 24" role="presentation"
                                                style="width: 0.875rem; height: 0.875rem;">
                                                <path
                                                    d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                    style="fill: currentcolor;"></path>
                                            </svg>
                                            
                                            <svg viewBox="0 0 24 24" role="presentation"
                                                style="width: 0.875rem; height: 0.875rem;">
                                                <path
                                                    d="M12,15.4V6.1L13.71,10.13L18.09,10.5L14.77,13.39L15.76,17.67M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                    style="fill: currentcolor;"></path>
                                            </svg></span>
                                            
                                            <span class="fw-medium">(<%=valoracion%>)</span></span>
                                        </svg></span>
                                        
                                    </div>

                                <div class="d-flex justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="ms-2 lh-1">
                                                <form action="/action_page.php">
                                                    <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                                    <label for="vehicle1"> Añadir a favoritos</label><br>
                                                  </form>
                                            </div>
                                        </div>
                                </div>
                                <br>

                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <div class="ms-2 lh-1">
                                            <h4 class="mb-1"><%=user.getNombre()%> <%=user.getApellidos()%></h4>
                                            <p class="fs-6 mb-0">@<%=user.getNombreUsuario()%></p>
                                        </div>
                                    </div>

                                    <div>
                                        <a class="btn btn-outline-white btn-sm" href='anadirSuscripcion?suscripcion=AUTOR&nombre=<%=user.getNombreUsuario()%>'>Suscribirse</a>
                                    </div>
                                </div>

                            </div>


                            <!--METEMOS EL CONTENIDO EN EL MISMO DIV-->
                            <div class="p-0 card-body">
                                <div class="tab-content">

                                    <div role="tabpanel" id="react-aria791735076-37-tabpane-description"
                                        aria-labelledby="react-aria791735076-37-tab-description"
                                        class="fade pb-4 p-4 tab-pane active show">
                                        <div class="mb-4">
                                            <h3 class="mb-2">Descripción de sección</h3>
                                            <p> <%=listSecciones.get(idseccion-1).getDescripcion()%></p>
                                            
                                        </div>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    
                    <!--SECCIONES DEL CURSO-->
                    <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="card accordion">
                                <ul class="list-group list-group-flush">
                                    <c:set var = "listSecciones" value = "<%=listSecciones%>"/>
                                    <c:set var = "idseccion" value = "<%=idseccion%>"/>
                                    <c:forEach var="seccion" items="${listSecciones}">
                                        <c:set var = "i" value = "<%=i%>"/>
                                        <!--DESPLEGABLE DE SECCIONES-->
                                        <li class="p-0 list-group-item"><a aria-expanded="false"
                                                class="h4 mb-0 d-flex align-items-center text-inherit text-decoration-none py-3 px-4 collapsed "
                                                data-bs-toggle="collapse" role="button" aria-controls="courseTwo">
                                                <div class="me-auto" onclick="location.href='cambioSeccion?idSeccion=${seccion.id}&idCurso='+<%=idCurso%>" >Sección <%=i%>: ${seccion.nombre}<p
                                                        class="mb-0 text-muted fs-6 mt-1 fw-normal">(${seccion.duracion})</p>
                                                </div>
                                                
                                            </a>
                                            <c:if test="${idseccion==i}">
                                                <div class="accordion-collapse collapse show">
                                            </c:if>
                                            <c:if test="${idseccion!=i}">
                                                <div class="accordion-collapse collapse">
                                            </c:if>
                                                <div class="list-group list-group-flush">

                                                    <!--Lista de videos de cada seccion indicando el minuto al que te lleva-->
                                                    <div class="list-group-item"><a
                                                            class="d-flex justify-content-between align-items-center text-inherit text-decoration-none"
                                                            href="#">
                                                            <div class="text-truncate "><span
                                                                    class="icon-shape bg-success text-white icon-sm rounded-circle me-2"><svg
                                                                        viewBox="0 0 24 24" role="presentation"
                                                                        style="width: 1.2rem; height: 1.2rem;">
                                                                        <path d="M8,5.14V19.14L19,12.14L8,5.14Z"
                                                                            style="fill: currentcolor;"></path>
                                                                    </svg> </span><span class="fs-5">Desarrollo</span>
                                                            </div>
                                                            <div class="text-truncate fs-5"><span>${seccion.duracion}</span></div>
                                                        </a>
                                                    </div>

                                                </div>
                                            </div>
                                        </li>
                                    <%
                                        i = i+1;
                                    %>
                                    </c:forEach>
                                    
                                </ul>

                            </div>
                        </div>
                    </div>
                    


                </div>
            </div>
        </div>

    </body>


</html>