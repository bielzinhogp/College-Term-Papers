/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.facade;

import br.com.batcommerce.dao.ProdutoDAO;
import br.com.batcommerce.model.Produto;
import java.util.List;

/**
 *
 * @author z3r0
 */
public class ProdutoFacade {

    private ProdutoDAO dao;

    public ProdutoFacade() {
        dao = new ProdutoDAO();
    }

    public void incluir(Produto produto) {
        dao.incluir(produto);

    }

    public void alterar(Produto produto) {
        dao.alterar(produto);
    }

    public void excluir(Integer id) {
        Produto produto = dao.obter(id);
        dao.excluir(produto);
    }

    public Produto obter(Integer id) {
        return dao.obter(id);
    }

    public List<Produto> listar() {
        return dao.listar();
    }
}
