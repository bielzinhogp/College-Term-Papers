/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.controller;

import br.com.batcommerce.model.Administrador;
import br.com.batcommerce.facade.AdministradorFacade;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author z3r0
 */
@Controller
public class LoginController {

    private AdministradorFacade facade;

    @RequestMapping("/LoginAdmin")
    public String loginForm() {
        return "LoginAdmin";
    }

    @RequestMapping("/doLogin")
    public String doLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        boolean autenticado = false;

        AdministradorFacade facade = new AdministradorFacade();
        Administrador administrador = new Administrador();

        administrador.setUsuario(usuario);
        administrador.setSenha(senha);

        if (facade.autenticar(administrador)) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("autenticado", true);
            sessao.setAttribute("usuario", usuario);
            return "redirect:/admin-painel";
        } else {
            return "redirect:ErroAdmin";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:LoginAdmin";
    }
}
