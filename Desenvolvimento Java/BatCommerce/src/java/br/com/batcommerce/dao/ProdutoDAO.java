/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.dao;

import br.com.batcommerce.model.Produto;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author z3r0
 */
public class ProdutoDAO {

    private static SessionFactory conexao;

    public ProdutoDAO() {

        conexao = HibernateUtil.getSessionFactory();
    }

    public void incluir(Produto produto) {
        Session sessao = conexao.openSession();
        Transaction transacao = sessao.beginTransaction();

        sessao.save(produto);
        transacao.commit();
        sessao.close();

    }

    public void alterar(Produto produto) {
        Session sessao = conexao.openSession();
        Transaction transacao = sessao.beginTransaction();

        sessao.update(produto);
        transacao.commit();
        sessao.close();

    }

    public void excluir(Produto produto) {
        Session sessao = conexao.openSession();
        Transaction transacao = sessao.beginTransaction();

        sessao.delete(produto);
        transacao.commit();
        sessao.close();

    }

    public Produto obter(Integer id) {
        Produto produto = null;
        Session sessao = conexao.openSession();
        
        produto = (Produto) sessao.get(Produto.class, id);
        sessao.close();
        return produto;
    }

    public List<Produto> listar() {
        List<Produto> lista = new ArrayList<Produto>();
        Session sessao = conexao.openSession();
        lista = sessao.createCriteria(Produto.class).list();

        sessao.close();
        return lista;
    }

}

