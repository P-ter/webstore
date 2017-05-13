/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.servlet;

import com.stateless.UserSLSB;
import com.stateful.CartSFSB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FPT
 */
@WebServlet(name = "UserOps", urlPatterns = {"/UserOps"})
public class UserOps extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserSLSB manager = new UserSLSB();    
        
        if(request.getParameter("register") != null){
            String confirmPassword = request.getParameter("confirm_password");
            
            if(username != null && !username.isEmpty() && 
                    password != null && !password.isEmpty() &&
                    confirmPassword != null && !confirmPassword.isEmpty()){
                if(password.equals(confirmPassword)){
                    boolean usernameExist = manager.checkUsernameExisted(username);
                    if(usernameExist){
                        response.sendRedirect("register.jsp?message=Username already existed");
                    }else {
                        manager.register(username, password);
                        response.sendRedirect("index.jsp?message=New account registered, you may now log in.");
                    }
                } else {
                    response.sendRedirect("register.jsp?message=Password do not match!");
                }
            } else {
                response.sendRedirect("register.jsp?message=All values are required!");
            }
        } else if (request.getParameter("login") != null) {
            if(username != null && !username.isEmpty() && password != null && !password.isEmpty()){
                boolean valid = manager.validate(username, password);
                if(valid){
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    if(session.getAttribute(username) == null){
                        session.setAttribute("cart", new CartSFSB());
                    }
                    response.sendRedirect("main.jsp");
                } else {
                    response.sendRedirect("login.jsp?message=Invalid Username and/or Password!");
                }
            } else {
                response.sendRedirect("login.jsp?message=Both values are required!");
            }
        } else if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp?message=Logged Out!");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
