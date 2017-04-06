<%-- 
    Document   : ok
    Created on : 07/03/2017, 22:02:54
    Author     : z3r0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
    <head>
        <title>BatCommerce | Sua loja nerd</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>
        <link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <!-- start slider -->		
        <link href="resources/css/slider.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script>
        <script type="text/javascript" src="resources/js/jquery.cslider.js"></script>
        <script type="text/javascript">
            $(function () {
                $('#da-slider').cslider();
            });
        </script>
        <!-- Owl Carousel Assets -->
        <link href="resources/css/owl.carousel.css" rel="stylesheet">
        <!-- Owl Carousel Assets -->
        <!-- Prettify -->
        <script src="resources/js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {

                $("#owl-demo").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    autoPlay: true,
                    navigation: true,
                    navigationText: ["", ""],
                    rewindNav: false,
                    scrollPerPage: false,
                    pagination: false,
                    paginationNumbers: false,
                });

            });
        </script>
        <!-- //Owl Carousel Assets -->
        <!-- start top_js_button -->
        <script type="text/javascript" src="resources/js/move-top.js"></script>
        <script type="text/javascript" src="resources/js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>
    </head>
    <body>
        <!-- start header -->
        <div class="header_bg">
            <div class="wrap">
                <div class="header">
                    <div class="logo">
                        <a href="index.html"><img src="resources/images/logo.png" alt=""/> </a>
                    </div>
                    <div class="h_icon">
                        <ul class="icon1 sub-icon1">
                            <li><a class="active-icon c1" href="#"><i>R$0</i></a>
                                <ul class="sub-icon1 list">
                                    <li><h3>Carrinho</h3><a href=""></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="h_search">
                        <form>
                            <input type="text" value="">
                            <input type="submit" value="">
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="header_btm">
        <div class="wrap">
            <div class="header_sub">
                <div class="h_menu">
                    <ul>
                        <li class="active"><a href="index">Home</a></li> |
                        <li><a href="#">camisetas</a></li> |
                        <li><a href="#">canecas</a></li> |
                        <li><a href="#">acessórios</a></li>
                        <li><a href="#">decorações</a></li>
                    </ul>
                </div>
                <div class="header-left">	
                    <div class= "h_menu">
                        <ul>
                            <li class="active"><a href="#"><h2>Login</h2></a></li>

                        </ul>
                    </div>
                </div>
                <div class="top-nav">
                    <nav class="nav">	        	
                        <a href="#" id="w3-menu-trigger"> </a>
                        <ul class="nav-list" style="">
                            <li class="nav-item"><a class="active" href="index">Home</a></li>
                            <li><a href="#">camisetas</a></li> |
                            <li><a href="#">canecas</a></li> |
                            <li><a href="#">acessórios</a></li>
                            <li><a href="#">decorações</a></li>
                        </ul>
                    </nav>
                    <div class="search_box">
                        <form>
                            <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Search';
                                    }"><input type="submit" value="">
                        </form>
                    </div>
                    <div class="clear"> </div>
                    <script src="resources/js/responsive.menu.js"></script>
                </div>		  
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!-- start slider -->
    <div id="da-slider" class="da-slider">
        <div class="da-slide">
            <h2>slide 1</h2>
            <p>texto slide 1...</p>
            <a href="details.html" class="da-link">confira aqui</a>
            <div class="da-img"><img src="http://www.businesswise.co.il/wp-content/uploads/2014/12/default-placeholder-1024x1024.png" alt="image01" /></div>

        </div>
        <div class="da-slide">
            <h2>slide 2</h2>
            <p>texto slide 2....</p>
            <a href="details.html" class="da-link">confira aqui</a>
            <div class="da-img"><img src="http://www.businesswise.co.il/wp-content/uploads/2014/12/default-placeholder-1024x1024.png" alt="image01" /></div>
        </div>
        <nav class="da-arrows">
            <span class="da-arrows-prev"></span>
            <span class="da-arrows-next"></span>
        </nav>
    </div>
</div>
<!----start-cursual---->
<div class="wrap">
    <!----start-img-cursual---->
    <div id="owl-demo" class="owl-carousel">
        <c:forEach items="${requestScope.lista}" var="produto">

            <div class="item" onclick="location.href = 'details.html';">
                <div class="cau_left">
                    <img class="lazyOwl" src='<c:url value="${produto.imagem}"/>' alt="Lazy Owl Image">
                </div>
                <div class="cau_left">
                    <h4><a href="details.html"><c:out value="${produto.nome}" /></a></h4>
                    <a href="details.html" class="btn">detalhes</a>
                </div>

            </div>	
        </c:forEach>

    </div>
    <!----//End-img-cursual---->
</div>
<!-- start main1 -->
<div class="main_bg1">
    <div class="wrap">	
        <div class="main1">
            <h2>produtos em destaques</h2>
        </div>
    </div>
</div>
<!-- start main -->
<div class="main_bg">
    <div class="wrap">	
        <div class="main">
            <div class="grids_of_3">
                <c:forEach items="${requestScope.lista}" var="produto">
                    <div class="grid1_of_3 ">
                        <a href="details.html">
                            <img src='<c:url value="${produto.imagem}"/>' alt=""/>
                            <h3><c:out value="${produto.nome}" /></h3>
                            <div class="price">
                                <h4>R$ <c:out value="${produto.preco}"/><span>Detalhes</span></h4>
                            </div>
                            <span class="b_btm"></span>
                        </a>
                    </div>			
                </c:forEach>

                <div class="clear"></div>

            </div>	

        </div>
    </div>
</div>	
<!-- start footer -->
<div class="footer_bg">
    <div class="wrap">	
        <div class="footer">
            <!-- start grids_of_4 -->	
            <div class="grids_of_4">
                <div class="grid1_of_4">
                    <h4>produtos</h4>
                    <ul class="f_nav">
                        <li><a href="#">camisetas </a></li>
                        <li><a href="#">canecas</a></li>
                        <li><a href="#">acessórios</a></li>
                        <li><a href="#">decorações</a></li>
                    </ul>
                </div>
                <div class="grid1_of_4">
                    <h4>ajuda e suporte</h4>
                    <ul class="f_nav">
                        <li><a href="#">ajuda e suporte</a></li>
                        <li><a href="#">ajuda e suporte</a></li>
                        <li><a href="#">ajuda e suporte</a></li>
                        <li><a href="#">ajuda e suporte</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>	
<!-- start footer -->
<div class="footer_bg1">
    <div class="wrap">
        <div class="footer">
            <!-- scroll_top_btn -->
            <script type="text/javascript">
                $(document).ready(function () {

                    var defaults = {
                        containerID: 'toTop', // fading element id
                        containerHoverID: 'toTopHover', // fading element hover id
                        scrollSpeed: 1200,
                        easingType: 'linear'
                    };


                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
            <!--end scroll_top_btn -->
            <div class="copy">
                <p class="link">&copy;  All rights reserved | Gabriel Guimarães </p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</body>
</html>
