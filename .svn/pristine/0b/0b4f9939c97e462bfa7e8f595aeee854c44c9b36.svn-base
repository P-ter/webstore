/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.listener;

import com.stateful.CartSFSB;
import com.stateless.CartSLSB;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author FPT
 */
public class ShopListener implements HttpSessionAttributeListener, HttpSessionListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        if(event.getName().equals("cart")){
           CartSLSB manager = new CartSLSB();
           CartSFSB cart = manager.loadCart((CartSFSB)event.getValue() ,(String)event.getSession().getAttribute("username"));
           event.getSession().setAttribute("cart", cart);
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
    }

    
    
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        CartSFSB cart = (CartSFSB)session.getAttribute("cart");
        if(cart != null){
            CartSLSB cartManager = new CartSLSB();
            cartManager.saveCart(cart, (String)session.getAttribute("username"));
        }
    }
}
