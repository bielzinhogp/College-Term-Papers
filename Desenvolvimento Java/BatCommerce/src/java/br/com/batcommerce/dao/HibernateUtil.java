/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.batcommerce.dao;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author z3r0
 */
public class HibernateUtil {
    
    private static SessionFactory fabrica; 
    
    public static SessionFactory getSessionFactory() { 
        if (fabrica == null) { 
             Configuration configuracao = new Configuration().configure(); 
             ServiceRegistry servico = new StandardServiceRegistryBuilder().applySettings(configuracao.getProperties()).build(); 
             fabrica = configuracao.buildSessionFactory(servico); 
        } 
        
        return fabrica;
    }
}
