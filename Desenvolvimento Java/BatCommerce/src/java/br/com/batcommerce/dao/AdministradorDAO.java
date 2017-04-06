/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.dao;

import br.com.batcommerce.model.Administrador;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author z3r0
 */
public class AdministradorDAO {

    private static SessionFactory conexao;

    public AdministradorDAO() {

        conexao = HibernateUtil.getSessionFactory();
    }

    public void incluir(Administrador administrador) {
        Session sessao = conexao.openSession();
        Transaction transacao = sessao.beginTransaction();

        sessao.save(administrador);
        transacao.commit();
        sessao.close();

    }

    public void alterar(Administrador administrador) {
        Session sessao = conexao.openSession();
        Transaction transacao = sessao.beginTransaction();

        sessao.update(administrador);
        transacao.commit();
        sessao.close();

    }

    public void excluir(Administrador administrador) {
        Session sessao = conexao.openSession();
        Transaction transacao = sessao.beginTransaction();

        sessao.delete(administrador);
        transacao.commit();
        sessao.close();

    }

    public Administrador obter(Integer id) {
        Administrador administrador = null;
        Session sessao = conexao.openSession();

        administrador = (Administrador) sessao.get(Administrador.class, id);
        sessao.close();
        return administrador;
    }

    public List<Administrador> listar() {
        List<Administrador> lista = new ArrayList<Administrador>();
        Session sessao = conexao.openSession();
        lista = sessao.createCriteria(Administrador.class).list();

        sessao.close();
        return lista;
    }

}
