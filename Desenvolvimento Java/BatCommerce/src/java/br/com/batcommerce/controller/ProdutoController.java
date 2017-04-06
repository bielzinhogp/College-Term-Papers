/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.controller;

import br.com.batcommerce.facade.ProdutoFacade;
import br.com.batcommerce.model.Produto;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author z3r0
 */
@Controller
public class ProdutoController {

    @RequestMapping(value = "/IncluirProduto", method = RequestMethod.POST)
    public String incluirProduto(HttpServletRequest request, HttpServletResponse response) throws ParseException {

        String nome = request.getParameter("nome");
        String preco = request.getParameter("preco");
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String imagem = request.getParameter("imagem");

        Produto produto = new Produto();
        produto.setNome(nome);
        produto.setPreco(Integer.parseInt(preco));
        produto.setDescricao(descricao);
        produto.setCategoria(categoria);
        produto.setImagem(imagem);

        ProdutoFacade facade = new ProdutoFacade();
        facade.incluir(produto);

        return "redirect:ListarProduto";
    }

    @RequestMapping("/ListarProduto")
    public String listarProduto(HttpServletRequest request, HttpServletResponse response) {

        ProdutoFacade facade = new ProdutoFacade();
        List<Produto> listar = facade.listar();

        request.setAttribute("lista", listar);
        return "administrador/listar-produtos";
    }

    @RequestMapping("/ExcluirProduto")
    public String excluirProduto(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        Produto produto = new Produto();
        produto.setId(Integer.parseInt(id));

        ProdutoFacade facade = new ProdutoFacade();
        facade.excluir(Integer.parseInt(id));

        return "redirect:ListarProduto";
    }

    @RequestMapping(value= "/AlterarProduto", method = RequestMethod.POST)
    public String alterarProduto(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String preco = request.getParameter("preco");
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String imagem = request.getParameter("imagem");
        
        Produto produto = new Produto();
        produto.setId(Integer.parseInt(id));
        produto.setNome(nome);
        produto.setPreco(Integer.parseInt(preco));
        produto.setDescricao(descricao);
        produto.setCategoria(categoria);
        produto.setImagem(imagem);

        ProdutoFacade facade = new ProdutoFacade();
        facade.alterar(produto);

        return "redirect:ListarProduto";
    }

}
