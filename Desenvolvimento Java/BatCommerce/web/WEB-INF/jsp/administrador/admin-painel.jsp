<%-- 
    Document   : index
    Created on : 25/03/2017, 18:54:30
    Author     : z3r0
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Admin :: Home</title>
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
        <!--skycons-icons-->
        !--//skycons-icons-->
    </head>
    <body>	
        <div class="page-container">	
            <div class="left-content">
                <div class="mother-grid-inner">
                    <!--header start here-->
                    <div class="header-main">
                        <div class="header-left">
                            <div class="logo-name">
                                <a href="#"> <h1>BatCommerce</h1> 
                                    <!--<img id="logo" src="" alt="Logo"/>--> 
                                </a> 								
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="profile_details">		
                            <ul>
                                <li class="dropdown profile_details_drop">
                                    <div class="profile_img">	
                                        <span class="prfil-img"><img src="#" alt=""> </span> 
                                        <div class="user-name">
                                            <p><c:out value="${sessionScope.usuario}"/></p>
                                            <span>Administrador</span></a>
                                        </div>
                                        <i class="fa fa-angle-down lnr"></i>
                                        <i class="fa fa-angle-up lnr"></i>
                                        <div class="clearfix"></div>	
                                    </div>	

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
                    <!--market updates updates-->
                    <div class="market-updates">
                        <div class="col-md-4 market-update-gd">
                            <div class="market-update-block clr-block-1">
                                <div class="col-md-8 market-update-left">
                                    <h3>83</h3>
                                    <h4>Usuários registrados</h4>
                                </div>
                                <div class="col-md-4 market-update-right">
                                    <i class="fa fa-file-text-o"> </i>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="col-md-4 market-update-gd">
                            <div class="market-update-block clr-block-2">
                                <div class="col-md-8 market-update-left">
                                    <h3>135</h3>
                                    <h4>Visitantes diários</h4>
                                </div>
                                <div class="col-md-4 market-update-right">
                                    <i class="fa fa-eye"> </i>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="col-md-4 market-update-gd">
                            <div class="market-update-block clr-block-3">
                                <div class="col-md-8 market-update-left">
                                    <h3>23</h3>
                                    <h4>Novas Mensagens</h4>
                                </div>
                                <div class="col-md-4 market-update-right">
                                    <i class="fa fa-envelope-o"> </i>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <!--market updates end here-->
                    <!--mainpage chit-chating-->

                    <div class="clearfix"> </div>
                </div>
                <!--main page chit chating end here-->
                <!--main page chart start here-->

                <!--main page chart layer2-->
                <div class="chart-layer-2">

                </div>

                <div class="clearfix"> </div>
            </div>


            <!--inner block end here-->
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
                        <li id="menu-academico-avaliacoes" ><a href="ListarProduto">listar produtos</a></li>
                        <li id="menu-academico-boletim" ><a href="cadastro-produto">cadastrar produto</a></li>
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
<script src="resources/js/jquery.nicescroll.js"></script>
<script src="resources/js/scripts.js"></script>
<!--//scrolling js-->
<script src="resources/js/bootstrap.js"></script>
<!-- mother grid end here-->
</body>
</html>                     