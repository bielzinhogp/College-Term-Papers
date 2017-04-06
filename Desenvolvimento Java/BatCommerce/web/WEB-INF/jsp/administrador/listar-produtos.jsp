<%-- 
    Document   : listarproduto
    Created on : 25/03/2017, 23:52:30
    Author     : z3r0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Admin :: Listar Produtos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <link href="resources/admin-resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Custom Theme files -->
        <link href="resources/admin-resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!--js-->
        <script src="resources/admin-resources/js/jquery-2.1.1.min.js"></script> 
        <!--icons-css-->
        <link href="resources/admin-resources/css/font-awesome.css" rel="stylesheet"> 
        <!--Google Fonts-->
        <link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
        <!--//skycons-icons-->
    </head>
    <body>	
        <div class="page-container">	
            <div class="left-content">
                <div class="mother-grid-inner">
                    <!--header start here-->
                    <div class="header-main">
                        <div class="header-left">
                            <div class="logo-name">
                                <a href="index.html"> <h1>BatCommerce</h1> 
                                    <!--<img id="logo" src="" alt="Logo"/>--> 
                                </a> 								
                            </div>

                            <div class="clearfix"> </div>
                        </div>
                        <div class="profile_details">		
                            <ul>
                                <li class="dropdown profile_details_drop">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <div class="profile_img">	
                                            <span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
                                            <div class="user-name">
                                                <p><c:out value="${sessionScope.usuario}"/></p>
                                                <span>Administrator</span>
                                            </div>
                                            <i class="fa fa-angle-down lnr"></i>
                                            <i class="fa fa-angle-up lnr"></i>
                                            <div class="clearfix"></div>	
                                        </div>	
                                    </a>
                                    <ul class="dropdown-menu drp-mnu">
                                        <li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
                                        <li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
                                        <li> <a href="#"><i class="fa fa-sign-out"></i> Logout</a> </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>				
                    </div>
                    <div class="clearfix"> </div>	
                </div>
                <!--heder end here-->
                <!-- script-for sticky-nav -->
                <script>
                    $(document).ready(function () {
                        var navoffeset = $(".header-main").offset().top;
                        $(window).scroll(function () {
                            var scrollpos = $(window).scrollTop();
                            if (scrollpos >= navoffeset) {
                                $(".header-main").addClass("fixed");
                            } else {
                                $(".header-main").removeClass("fixed");
                            }
                        });

                    });
                </script>
                <!-- /script-for sticky-nav -->
                <!--inner block start here-->
                <div class="inner-block">
                    <div class="product-block">
                        <div class="pro-head">
                            <h2>Produtos</h2>
                        </div>
                        <c:forEach items="${requestScope.lista}" var="produto">
                            <div class="col-md-3 product-grid">
                                <div class="product-items">
                                    <div class="project-eff">
                                        <div id="nivo-lightbox-demo"> <p> <a href="#"data-lightbox-gallery="gallery1" id="nivo-lightbox-demo"><span class="rollover1"> </span> </a></p></div>     
                                        <img class="img-responsive" src='<c:url value="${produto.imagem}"/>'/> 
                                    </div>

                                    <div class="produ-cost">

                                        <h4><c:out value="${produto.nome}" /></h4>
                                        <h5>R$ <c:out value="${produto.preco}"/></h5>

                                    </div>
                                    <div class="container">
                                        <a href="ExcluirProduto?action=delete&id=<c:out value="${produto.id}"/>"</a>
                                        <span class="glyphicon glyphicon-remove"></span>  
                                        </a>
                                        <a href="alterar-produto?id=<c:out value="${produto.id}"/>"</a>
                                        <span class="glyphicon glyphicon-edit"></span>
                                        </a>
                                        </p>
                                    </div>

                                </div>

                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <!--inner block end here-->
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
    <script type="text/javascript" src="js/nivo-lightbox.min.js"></script>
    <script type="text/javascript">
                    $(document).ready(function () {
                        $('#nivo-lightbox-demo a').nivoLightbox({effect: 'fade'});
                    });
    </script>

    <!--copy rights start here-->
    <div class="copyrights">
        <p>© All Rights Reserved | Gabriel Guimarães</p>
    </div>	
    <!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
<div class="sidebar-menu">
    <div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
            <!--<img id="logo" src="" alt="Logo"/>--> 
        </a> </div>		  
    <div class="menu">
        <ul id="menu" >
            <li id="menu-home" ><a href="admin-painel"><i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
            <li><a href="#"><i class="fa fa-shopping-cart"></i><span>Produtos</span><span class="fa fa-angle-right" style="float: right"></span></a>
                <ul id="menu-academico-sub" >
                    <li id="menu-academico-avaliacoes" ><a href="cadastro-produto">cadastrar produto</a></li>
                    <li id="menu-academico-boletim" ><a href="ListarProduto">listar produto</a></li>
                </ul>
            <li><a href="logout"><i class="glyphicon glyphicon-log-out"></i><span>Sair</span></a></li>
            </li>
        </ul>
    </div>
</div>
<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
    var toggle = true;

    $(".sidebar-icon").click(function () {
        if (toggle)
        {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position": "absolute"});
        } else
        {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function () {
                $("#menu span").css({"position": "relative"});
            }, 400);
        }
        toggle = !toggle;
    });
</script>
<!--scrolling js-->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!--//scrolling js-->
<script src="js/bootstrap.js"></script>
<!-- mother grid end here-->
</body>
</html>



