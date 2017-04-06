/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.facade;

import br.com.batcommerce.dao.AdministradorDAO;
import br.com.batcommerce.model.Administrador;
import java.util.List;

/**
 *
 * @author z3r0
 */
public class AdministradorFacade {

    private AdministradorDAO dao;
    
    public AdministradorFacade(){
        dao = new AdministradorDAO();
    }

    public boolean autenticar(Administrador administrador){
        boolean autenticado = false;
        List<Administrador> lista = dao.listar();
        for(Administrador usu:lista){
            if(usu.getUsuario().equals(administrador.getUsuario()) && usu.getSenha().equals(administrador.getSenha())){
                autenticado = true;
                break;
            }
        }
        return autenticado;
    }

}
