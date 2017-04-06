/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.controller;

import br.com.batcommerce.facade.ProdutoFacade;
import br.com.batcommerce.model.Produto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author z3r0
 */
@Controller
public class HomeController{
    
    @RequestMapping({"/"})
    public String home(HttpServletRequest request, HttpServletResponse response) {
        
        ProdutoFacade facade = new ProdutoFacade();
        List<Produto> listar = facade.listar();

        request.setAttribute("lista", listar);
        return "index";

    }
    
    @RequestMapping({"/index"})
    public String index(HttpServletRequest request, HttpServletResponse response) {
        
        ProdutoFacade facade = new ProdutoFacade();
        List<Produto> listar = facade.listar();

        request.setAttribute("lista", listar);
        return "index";

    }
}
