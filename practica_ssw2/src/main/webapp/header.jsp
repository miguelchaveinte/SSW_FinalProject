<%-- 
    Document   : header
    Created on : 26 abr. 2022, 14:21:48
    Author     : migchav
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="bg-white navbar p-2 navbar-default py-2 navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <div class="d-flex align-items-center"><a class="navbar-brand py-1 mr-auto" href="paginaPrincipal"><img
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

