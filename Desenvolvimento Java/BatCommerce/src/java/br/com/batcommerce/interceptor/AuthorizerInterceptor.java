/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 *
 * @author z3r0
 */
public class AuthorizerInterceptor extends HandlerInterceptorAdapter {
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();
        if (uri.endsWith("LoginAdmin") || uri.endsWith("doLogin") || uri.contains("resources") 
                || uri.contains("index")
                || request.getSession().getAttribute("autenticado") != null) {
            return true;
        } else{
            response.sendRedirect("index");
            return false;
        }
    }
 
}