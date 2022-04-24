<%@page import="ulearn.model.Curso"%>
<%@page import="ulearn.model.Seccion"%>
<%@page import="ulearn.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    int idCurso = Integer.parseInt(request.getParameter("idCurso"));
    int i = 1;
    User user = (User) request.getAttribute("infoCreador");
    double valoracion = (double) request.getAttribute("valoracion");
    Curso curso = (Curso) request.getAttribute("infoCurso");
    ArrayList<Seccion> listSecciones = (ArrayList<Seccion>) request.getAttribute("listSecciones");
    Boolean suscripciones[]=(Boolean [])request.getAttribute("suscripciones");
    ArrayList<Integer> autoresSuscritos = (ArrayList<Integer>) request.getAttribute("autoresSuscritos");
    HttpSession session2 = request.getSession();
    User registrado= (User) session2.getAttribute("user");
    boolean estaIniciado=false;
    if (registrado!=null) estaIniciado=true;
    boolean suscritoAAutor=false;
    if(autoresSuscritos!=null){
        if(autoresSuscritos.contains(user.getId())) suscritoAAutor=true;
    }
    //int idCurso = Integer.parseInt(request.getParameter("idCurso"));
    //int idseccion = Integer.parseInt(request.getParameter("seccion"));
%>


<%--<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/db_practica"
                   user = "root" password = "admin"/>  <!<!-- CAMBIAR CONTRASRÑA: admin  -->

<c:set var = "id" value = "<%=idCurso%>"/>

<sql:query var="listSecciones" dataSource = "${snapshot}" >

    SELECT NOMBRE, DURACION FROM SECCION WHERE IDCURSO = ?  ORDER BY ID; 
    <sql:param value = "${id}" />

</sql:query>

<sql:query var="infoCurso" dataSource = "${snapshot}" >

    SELECT NOMBRECURSO, DESCRIPCION, PRECIO, IMAGEN, DURACION, CATEGORIA, CREADOR FROM CURSO WHERE ID = ?; 
    <sql:param value = "${id}" />

</sql:query>

<sql:query var="infoCreador" dataSource = "${snapshot}" >

    SELECT U.NOMBREUSUARIO, U.NOMBRE FROM CURSO C, USUARIO U WHERE C.ID = ? AND U.ID=C.CREADOR; 
    <sql:param value = "${id}" />

</sql:query>    

<sql:query var="valoracion" dataSource = "${snapshot}" >

    SELECT AVG(DC.VALORACION) AS MEDIA FROM DESARROLLOCURSO DC WHERE IDCURSO = ? GROUP BY DC.IDCURSO 
    <sql:param value = "${id}" />

</sql:query>    --%>

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

        <div class="py-lg-5 py-5">
            <div class="container">
                <!--Este div es para el video del curso-->
                <div class="row">
                    <div class="mb-5 col-lg-12 col-md-12 col-sm-12">
                        <div class="rounded-3 position-relative w-100 d-block overflow-hidden p-0" style="height: 300px;">
                            <div class="imagen" style="display: flex; justify-content: center;">
                                <img  alt="Imagen" src="imagenCurso?id=<%=idCurso%>">
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
                                    <h1 class="fw-semi-bold mb-2">
                                        <%=curso.getNombre()%>
                                    </h1>
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
                                            <h3 class="mb-2">Descripción del curso</h3>
                                            <p><%=curso.getDescripcion()%></p>
                                        </div>

                                        <div class="mb-4">
                                            <h3 class="mb-2">Precio del curso</h3>
                                            <h4 class="mb-2"><b><%=curso.getPrecio()%> €</b></h4>
                                        </div>
                                        
                                        <!--Div en el que inserto el boton intermedio para la opcion de convertirse en instructor-->
                                        <div class="intermedio">
                                             <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                                             <c:set var = "suscritoAAutor" value = "<%=suscritoAAutor%>"/>
                                             
                                            <!--Insertamos el boton que nos abrira el pop-up para convertirnos en creadores-->
                                            <c:if test="${registrado}">
                                                <!--REGISTRADO PERO HAY QUE COMPROBAR LAS SUSCRIPCIONES-->
                                                <c:set var = "suscripcion" value = "<%=suscripciones%>"/>
                                                <c:set var = "precio" value = "<%=curso.getPrecio()%>"/>
                                                
                                                <c:if test="${(suscripcion[0]&& precio==0.0)||suscripcion[1]||suscripcion[2]||suscritoAAutor}">
                                                    <a href="comenzarCurso?idCurso=<%=idCurso%>" class="button" style="text-align: center;">Comenzar Ahora</a>
                                                </c:if>
                                                <c:if test="${!((suscripcion[0]&& precio==0.0)||suscripcion[1]||suscripcion[2]||suscritoAAutor)}">
                                                    <a data-toggle="modal" data-target="#compra"class="button" style="text-align: center;">Comenzar Ahora</a>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${!registrado}">
                                                <a data-toggle="modal" data-target="#loginModal"class="button" style="text-align: center;">Comenzar Ahora</a>
                                            </c:if>
                                        
                                        </div>
                                        <div class="modal fade" id="compra" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header border-bottom-0">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="card">
                                                        <div class="p-6 card-body">
                                                            <div class="mb-4"><a href="/"><img
                                                                        src="Imagenes/icons8-e-learning-64.png" alt=""
                                                                        class="mb-4"></a>
                                                                <h1 class="mb-1 fw-bold">Inicia el Curso</h1>
                                                            </div>

                                                            <div class="row">
                                                                <div class="mb-0 d-grid gap-2 col-lg-12 col-md-12"
                                                                     style="display: grid!important; float:left; "><button
                                                                        type="submit"
                                                                        class="btn btn-primary"  onclick="location.href = 'comenzarCurso?idCurso='+<%=idCurso%>">Compra por <%=curso.getPrecio()%>€</button></div>
                                                                <span class="mb-3 mt-3 fw " style="text-align: center;">o mediante suscripción</span>
                                                                <div class="container">
                                                                    <div class="row">
                                                                        <div class="col-sm "><button
                                                                                type="submit"
                                                                                class="btn btn-primary" onclick="location.href ='suscripciones.jsp'">Suscríbete a uno de nuestos planes</button></div>

                                                                        <div class="col-sm"
                                                                             style="display: grid!important;"><button
                                                                                type="submit"
                                                                                class="btn btn-primary" onclick="location.href ='anadirSuscripcion?suscripcion=AUTOR&nombre=<%=user.getNombreUsuario()%>'">Suscríbete al autor</button></div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
                                    <c:forEach var="seccion" items="${listSecciones}">
                                        <!--DESPLEGABLE DE SECCIONES-->
                                        <li class="p-0 list-group-item"><a aria-expanded="false"
                                                                           class="h4 mb-0 d-flex align-items-center text-inherit text-decoration-none py-3 px-4 collapsed "
                                                                           data-bs-toggle="collapse" role="button" aria-controls="courseTwo">
                                                <div class="me-auto">Sección <%=i%>: ${seccion.nombre}<p
                                                        class="mb-0 text-muted fs-6 mt-1 fw-normal">(${seccion.duracion} minutos)</p>
                                                </div>

                                            </a>

                                        </li>
                                        <%
                                            i = i + 1;
                                        %>
                                    </c:forEach>

                                </ul>

                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>

        <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <!-- Popper JS -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <!-- Bootstrap JS -->
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
        <script>
                                                                            function cambiarLogin(a, b) {
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