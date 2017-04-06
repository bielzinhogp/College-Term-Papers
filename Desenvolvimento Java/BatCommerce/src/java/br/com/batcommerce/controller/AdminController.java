/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.controller;

import br.com.batcommerce.facade.ProdutoFacade;
import br.com.batcommerce.model.Administrador;
import br.com.batcommerce.model.Produto;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author z3r0
 */
@Controller
public class AdminController {

    @RequestMapping("/admin-painel")
    public String viewPainel() {
        return "administrador/admin-painel";
    }
    
    @RequestMapping("/ErroAdmin")
    public String erro() {
        return "administrador/ErroAdmin";
    }

    @RequestMapping("/cadastro-produto")
    public String cadastroProduto(Administrador administrador, HttpSession session) {
        return "administrador/cadastro-produto";
    }
    
    @RequestMapping("/alterar-produto")
    public String alteraProduto(HttpServletRequest request, HttpServletResponse response, Administrador administrador, HttpSession session) {
        
        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String preco = request.getParameter("preco");
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String imagem = request.getParameter("imagem");
        
        request.setAttribute("id", id);
        request.setAttribute("nome", nome);
        request.setAttribute("preco", preco);
        request.setAttribute("descricao", categoria);
        request.setAttribute("categoria", categoria);
        request.setAttribute("imagem", imagem);
        
        return "administrador/alterar-produto";
    }
}
