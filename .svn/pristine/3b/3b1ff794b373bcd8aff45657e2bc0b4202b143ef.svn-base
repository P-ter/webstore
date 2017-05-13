/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.servlet;

import com.model.OrderItem;
import com.model.OrderProduct;
import com.model.Product;
import com.stateful.CartSFSB;
import com.stateless.OrderSLSB;
import com.stateless.ProductSLSB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "CartOps", urlPatterns = {"/CartOps"})
public class CartOps extends HttpServlet {

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
        String add = request.getParameter("add");
        String remove = request.getParameter("remove");
        String clear = request.getParameter("clear");
        String pay = request.getParameter("pay");
        HttpSession session = request.getSession();
        CartSFSB cart = (CartSFSB) session.getAttribute("cart");
        if(cart == null){
            response.sendRedirect("index.jsp");
        } else{
            if(add != null){
                int id = Integer.parseInt(add);
                String message = "";
                if(request.getParameter("quantity") == null || request.getParameter("quantity").isEmpty()){
                    message = "Please enter the quantity for the product";
                    response.sendRedirect("main.jsp?error=" + message);
                } else {
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    
                    OrderProduct orderProduct =null;
                    boolean found = false;
                    
                    for(int i=0; i<cart.size() && !found; i++){
                        if(cart.get(i).getProductId() == id){
                            orderProduct = cart.get(i);
                            quantity += orderProduct.getQuantity();
                            orderProduct.setQuantity(quantity);
                            found = true;
                        }
                    }
                    if(!found){
                        orderProduct = new OrderProduct(id, quantity);
                        cart.add(orderProduct);
                    }
                    message = "Product added to order";
                    response.sendRedirect("main.jsp?message=" + message);
                }
                //System.out.println(cart.size());
            } else if(remove != null){
                int id = Integer.parseInt(remove);
                cart.remove(id);
                response.sendRedirect("checkout.jsp?message=Product Removed");
            } else if(clear != null){
                cart.clear();
                response.sendRedirect("checkout.jsp?message=Cart cleared!");
            } else if (pay != null){
                ProductSLSB productManager = new ProductSLSB();
                ArrayList<OrderItem> orderedList = new ArrayList<>();
                ArrayList<Product> productList = productManager.getProductList();
                String message = "";
                boolean valid = false;
                for(int i=0; i<cart.size(); i++){
                    OrderProduct orderProduct = cart.get(i);
                    boolean found = false;
                    for(int j=0; j<productList.size() && !found; j++){
                        Product product = productList.get(j);
                        if(orderProduct.getProductId() == product.getId()){
                            found = true;
                            if(orderProduct.getQuantity() < product.getStockLevel()){
                                valid = true;
                                OrderItem orderItem = new OrderItem();
                                orderItem.setName(product.getName());
                                orderItem.setPrice(product.getUnitPrice());
                                orderItem.setNumberUnit(orderProduct.getQuantity());
                                orderedList.add(orderItem);
                            } else {
                                valid = false;
                                message += "Insufficient stock of " + product.getName() + " available to satisfy order.<br/>";
                            }
                        }
                    }
                }

                if(!valid){
                    response.sendRedirect("checkout.jsp?error=" + message);
                } else {
                    OrderSLSB orderManager = new OrderSLSB();
                    orderManager.recordOrder((String) session.getAttribute("username"));
                    for(int i=0; i<cart.size(); i++){
                        productManager.updateStock(cart.get(i).getQuantity(), cart.get(i).getProductId());
                    }
                    orderManager.updateOrderItem(orderedList);
                    cart.clear();
                    response.sendRedirect("orderDetails.jsp?orderId=" + orderManager.getLatestOrderId());
                }
            }
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
