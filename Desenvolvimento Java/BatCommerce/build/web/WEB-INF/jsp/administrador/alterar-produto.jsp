<%-- 
    Document   : cadastrarproduto
    Created on : 25/03/2017, 19:39:06
    Author     : z3r0
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Admin :: Alterar produto</title>
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
                                <a href="#"> <h1>BatCommerce</h1> 
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
                    <div class="price-block-main">
                        <div class="prices-head">
                            <h2>Alterar produto</h2>
                        </div>
                        <div class="price-tables">
                            <div class="row">
                                <div class="col-lg-6">

                                    <form role="form" method="post" action="AlterarProduto" />

                                    <div class="form-group">
                                        <label for="id">Código do produto</label>
                                        <input class="form-control" name="id" value="${requestScope.id}" readonly="readonly"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="nome">Nome do produto</label>
                                        <input class="form-control" name="nome"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="preco">Preço</label>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon js-money">R$</span>
                                            <input type="text" class="form-control" name="preco"/>
                                            <span class="input-group-addon">.00</span>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="imagem">Link da imagem</label>
                                        <input class="form-control" name="imagem" />
                                    </div>

                                    <div class="form-group">
                                        <label for="descricao">Descrição</label>
                                        <textarea class="form-control" rows="3" name="descricao"/> </textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="categoria">Categoria</label>
                                        <select id="disabledSelect" name="categoria" class="form-control"/>
                                        <option value="camisetas">Camisetas</option>
                                        <option value="canecas">Canecas</option>
                                        <option value="acessorios">Acessórios</option>
                                        <option value="decoracoes">Decorações</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-default" value="cadastrar">salvar</button>
                                    <button type="reset" class="btn btn-default">resetar</button>

                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="clearfix"> </div>
                    </div>
                </div>
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
                        <li id="menu-academico-avaliacoes" ><a href="ListarProduto">listar produto</a></li>
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

<script src="/resources/js/jquery.masknumber.min.js"></script>

</body>
</html>



