<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="ulearn.model.DesarrolloCurso"%>
<%@page import="ulearn.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ulearn.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%
    //HttpSession session2 = request.getSession();
    //User usuario= (User) request.getAttribute("user");
    ArrayList<Curso> favoritos = (ArrayList<Curso>)request.getAttribute("favoritos");
    ArrayList<Double> valoracionesFav = (ArrayList<Double>)request.getAttribute("valoracionesFav");
    ArrayList<DesarrolloCurso> desarrollo = (ArrayList<DesarrolloCurso>)request.getAttribute("enDesarrollo");
    ArrayList<Double> valoracionesDes = (ArrayList<Double>)request.getAttribute("valoracionesDes");
    ArrayList<Double> porcentajeDesarrollo = (ArrayList<Double>)request.getAttribute("porcentajeDesarrollo");
%>

<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="theme-color" content="#000000">
    <meta name="description" content="Web site created using create-react-app">
    <title>ULearn</title>
    <script type="text/javascript" id="www-widgetapi-script"
        src="https://www.youtube.com/s/player/bd67d609/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
    <link href="main.81e26b4c.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/style.css">
    <script type="text/javascript" charset="utf-8"
        src="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/page_context.js"></script>
    <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>
</head>


<body>
    <div id="general">
        <!--Div de la cabecera donde se encuentra el logo, buscador y demas opciones. Implementado mediante 2 menus-->
        <div id="cabecera">
            <%@include file="./header_logged.jsp" %>
        </div>


        <div class="pt-5 pb-5">
            <div class="container">
                <div class="mt-0 mt-md-4 row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="mb-6 row">
                            <div class="col-md-12">
                                <div class="bg-transparent shadow-none  card">
                                    <div class="border-0 p-0 bg-transparent card-header">
                                        <div class="nav-lb-tab nav card-header-undefined" role="tablist">
                                            <div class="ms-0 nav-item"><a role="tab" data-rr-ui-event-key="bookmarked"
                                                    id="react-aria6366272441-395-tab-bookmarked"
                                                    aria-controls="react-aria6366272441-395-tabpane-bookmarked"
                                                    class="mb-sm-3 mb-md-0 nav-link active" aria-selected="true"
                                                    onclick="enFavoritos(event)">Favoritos</a>
                                            </div>
                                            <div class="nav-item"><a role="tab" data-rr-ui-event-key="learning"
                                                    id="react-aria6366272441-395-tab-learning"
                                                    aria-controls="react-aria6366272441-395-tabpane-learning"
                                                    class="mb-sm-3 mb-md-0 nav-link" tabindex="-1"
                                                    onclick="enDesarrollo(event)">En desarrollo</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-0 card-body">
                                        <div class="tab-content">
                                            <!--==================== Favoritos  ====================-->
                                            <div role="tabpanel" id="react-aria6366272441-395-tabpane-bookmarked"
                                                aria-labelledby="react-aria6366272441-395-tab-bookmarked"
                                                class="fade pb-4 p-4 ps-0 pe-0 tab-pane active show">
                                                <div class="row">
                                                    <%
                                                    for(int i=0; i<favoritos.size();i++){
                                                    %>
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="comprobarCurso?idCurso=<%=favoritos.get(i).getId()%>"><img
                                                                    src="imagenCurso?id=<%=favoritos.get(i).getId()%>" alt=""
                                                                    class="card-img-top rounded-top-md" style="max-height: 250px;"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"> <%=favoritos.get(i).getNombre()%> </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i><%=favoritos.get(i).getDuracionConFormato()%></li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        <%=valoracionesFav.get(i)%></span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold"><%=favoritos.get(i).getPrecio()%>€</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="imagenUsuario?idUsuario=<%=favoritos.get(i).getCreador().getId()%>"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span><%=favoritos.get(i).getCreador().getNombreUsuario()%></span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a></div>
                                                                </div><span class="d-none">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="45" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 45%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%}%>
                                                    <%--
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="#"><img
                                                                    src="./Imagenes/java.jpg" alt=""
                                                                    class="card-img-top rounded-top-md"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"> Curso Java
                                                                        Avanzado </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i>2h 57m</li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        4.0</span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold">2.15?</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="./Imagenes/avatar2.jpg"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span>Brooklyn
                                                                            Simmons</span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a></div>
                                                                </div><span class="d-none">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="45" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 45%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="#"><img
                                                                    src=".//Imagenes/c++.jpg" alt=""
                                                                    class="card-img-top rounded-top-md"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"> Curso C++
                                                                        Principiantes </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i>1h 37m</li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        4.0</span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold">1.95?</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="./Imagenes/avatar3.jpg"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span>Xavi
                                                                            Simmons</span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a></div>
                                                                </div><span class="d-none">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="45" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 45%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="#"><img
                                                                    src="./Imagenes/html.png" alt=""
                                                                    class="card-img-top rounded-top-md"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"> Curso
                                                                        Introduccion a HTML </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i>1h 44m</li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        3.0</span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold">1.25?</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="./Imagenes/avatar4.jpg"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span>Manuel Smith</span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a></div>
                                                                </div><span class="d-none">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="45" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 45%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="#"><img
                                                                    src="./Imagenes/javascript.jpg" alt=""
                                                                    class="card-img-top rounded-top-md"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"> Curso
                                                                        JavaScript </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i>3h 14m</li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        3.0</span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold">2.25?</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="./Imagenes/avatar5.jpg"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span>John Walker</span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a></div>
                                                                </div><span class="d-none">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="45" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 45%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                </div>
                                            </div>





                                            <!--==================== En desarrollo ====================-->
                                            <div role="tabpanel" id="react-aria6366272441-395-tabpane-learning"
                                                aria-labelledby="react-aria6366272441-395-tab-learning"
                                                class="fade pb-4 p-4 ps-0 pe-0 tab-pane">
                                                <div class="row">
                                                    <%
                                                    for(int i=0; i<desarrollo.size();i++){
                                                    %>
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="comenzarCurso?idCurso=<%=desarrollo.get(i).getCurso().getId()%>"><img
                                                                    src="imagenCurso?id=<%=desarrollo.get(i).getCurso().getId()%>" alt=""
                                                                    class="card-img-top rounded-top-md" style="max-height: 250px;"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"><%=desarrollo.get(i).getCurso().getNombre()%></a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i><%=desarrollo.get(i).getCurso().getDuracionConFormato()%>
                                                                    </li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        <%=valoracionesDes.get(i)%></span>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="imagenUsuario?idUsuario=<%=desarrollo.get(i).getCurso().getCreador().getId()%>"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span>
                                                                            <%=desarrollo.get(i).getCurso().getCreador().getNombreUsuario()%> </span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a>
                                                                    </div>
                                                                </div><span class="">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="<%=porcentajeDesarrollo.get(i)%>" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: <%=porcentajeDesarrollo.get(i)%>%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%}%>
                                                    <%--
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="#"><img
                                                                    src="./Imagenes/c++.jpg" alt=""
                                                                    class="card-img-top rounded-top-md"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="#"> Curso C++
                                                                        Principiantes </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i>1h 37m</li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> <svg
                                                                            viewBox="0 0 24 24" role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg><svg viewBox="0 0 24 24"
                                                                            role="presentation"
                                                                            style="width: 0.875rem; height: 0.875rem;">
                                                                            <path
                                                                                d="M12,15.39L8.24,17.66L9.23,13.38L5.91,10.5L10.29,10.13L12,6.09L13.71,10.13L18.09,10.5L14.77,13.38L15.76,17.66M22,9.24L14.81,8.63L12,2L9.19,8.63L2,9.24L7.45,13.97L5.82,21L12,17.27L18.18,21L16.54,13.97L22,9.24Z"
                                                                                style="fill: currentcolor;"></path>
                                                                        </svg></span><span class="text-warning me-1">
                                                                        4.0</span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>

                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="./Imagenes/avatar3.jpg"
                                                                            alt="" class="rounded-circle avatar-xs">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span>
                                                                            Xavi Simmons </span>
                                                                    </div>
                                                                    <div class="col-auto col"><a
                                                                            class="text-muted bookmark"
                                                                            href="#"><i
                                                                                class="fe fe-bookmark"></i></a>
                                                                    </div>
                                                                </div><span class="">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="25" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 25%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>--%>


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
    <script>
        function enDesarrollo(evt) {
            var tab = document.getElementById("react-aria6366272441-395-tab-bookmarked");
            tab.className = "mb-sm-3 mb-md-0 nav-link"
            tab.setAttribute("tabIndex", "-1");
            tab.removeAttribute("aria-selected");
            var tab2 = document.getElementById("react-aria6366272441-395-tab-learning");
            tab2.className = "mb-sm-3 mb-md-0 nav-link active"
            tab2.setAttribute("aria-selected", "true");
            tab2.removeAttribute("tabIndex");

            var tab3 = document.getElementById("react-aria6366272441-395-tabpane-bookmarked")
            tab3.className = "fade pb-4 p-4 ps-0 pe-0 tab-pane";
            var tab4 = document.getElementById("react-aria6366272441-395-tabpane-learning");
            tab4.className = "fade pb-4 p-4 ps-0 pe-0 tab-pane active show";


        }
        function enFavoritos(evt) {
            var tab = document.getElementById("react-aria6366272441-395-tab-learning");
            tab.className = "mb-sm-3 mb-md-0 nav-link"
            tab.setAttribute("tabIndex", "-1");
            tab.removeAttribute("aria-selected");
            var tab2 = document.getElementById("react-aria6366272441-395-tab-bookmarked");
            tab2.className = "mb-sm-3 mb-md-0 nav-link active"
            tab2.setAttribute("aria-selected", "true");
            tab2.removeAttribute("tabIndex");

            var tab3 = document.getElementById("react-aria6366272441-395-tabpane-learning")
            tab3.className = "fade pb-4 p-4 ps-0 pe-0 tab-pane";
            var tab4 = document.getElementById("react-aria6366272441-395-tabpane-bookmarked");
            tab4.className = "fade pb-4 p-4 ps-0 pe-0 tab-pane active show";
        }
    </script>

</body>


</html>