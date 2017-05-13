/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.helper;

import com.model.OrderItem;
import com.model.OrderProduct;
import com.model.Product;
import com.stateful.CartSFSB;
import com.stateless.OrderSLSB;
import com.stateless.ProductSLSB;
import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 *
 * @author FPT
 */
public class CheckOutPageHelper {
    public String printProductList(){
        String result = "<table  class='table table-striped table-hover'>"
                + "<tr style='background-color: #adafb2;'>"
                + "<th>Product</th>"
                + "<th># in Stock</th>"
                + "<th>Unit Price</th>"
                + "<th># to buy</th>"
                + "<th>Cart</th>"
                + "</tr>";
        ProductSLSB productManager = new ProductSLSB();
        ArrayList<Product> productList = productManager.getProductList();
        if(productList == null || productList.isEmpty()){
            result += "<tr><td colspan=5>No data found!</td></tr>";
        } else {
            for(int i=0; i<productList.size(); i++){
                result += "<tr><form action='CartOps' method='GET'>"
                        + "<td>" + productList.get(i).getName() + "</td>"
                        + "<td>" + productList.get(i).getStockLevel()+ "</td>"
                        + "<td>" + productList.get(i).getUnitPriceText()+ "</td>"
                        + "<td><input type='number' min='0' step='1' name='quantity' value='1'></td>"
                        + "<td><button type='submit' name='add' value='" + productList.get(i).getId() + "'><span class='glyphicon glyphicon-shopping-cart'></span>Add to Cart</button></td>"
                        + "</form></tr>";
            }
        }
        
        result += "</table>";
        return result;
    }
    
    public String printCheckout(CartSFSB cart){
        String result = "<table  class='table table-striped table-hover'>"
                + "<tr style='background-color: #adafb2;'>"
                + "<th>Product</th>"
                + "<th># ordered </th>"
                + "<th>Unit Price</th>"
                + "<th>Subtotal</th>"
                + "<th>Remove</th>"
                + "</tr>";
        ProductSLSB productManager = new ProductSLSB();
        double total = 0;
        ArrayList<Product> productList = productManager.getProductList();
        if(cart.size() != 0){
            for(int i=0; i<cart.size(); i++){
                OrderProduct orderProduct = cart.get(i);
                Product product = null;
                boolean found =false;
                double subTotal =0;
                for(int j=0; j<productList.size() && !found; j++){
                    if(productList.get(j).getId() == orderProduct.getProductId())
                    {
                        product= productList.get(j);
                        found = true;
                    }
                }
                subTotal = (orderProduct.getQuantity() * product.getUnitPrice());
                result += "<tr>"
                        + "<td>" + product.getName() + "</td>"
                        + "<td>" + orderProduct.getQuantity()+ "</td>"
                        + "<td>" + product.getUnitPriceText()+ "</td>"
                        + "<td>" + formatPrice(subTotal)+ "</td>"
                        + "<td><a href='CartOps?remove=" + orderProduct.getProductId()+ "'>Remove</a></td>";
                total += subTotal;
            }
        } else {
            result += "<tr><td colspan=5>No product found</td></tr>";
        }
        result += "<tr><td colspan=5>Total: " + formatPrice(total) +"</td></tr></table>";  
    
        if(cart.size() != 0){
            result += "</div><div class=\"col-sm-3 col-xs-12\">" +
"                    <button class=\"btn btn-primary btn-block\" onclick=\"location.href='CartOps?pay=true';\">Pay</button>" +
"                    <button class=\"btn btn-warning btn-block\" onclick=\"location.href='CartOps?clear=true';\">Clear Cart</button>" +
"                </div>";
        }
        
        return result;
    }
    
    public String printOrderDetail(int orderID){
        String result = "<table  class='table table-striped table-hover'>"
                + "<tr style='background-color: #adafb2;'>"
                + "<th>Product</th>"
                + "<th># ordered </th>"
                + "<th>Unit Price</th>"
                + "<th>Subtotal</th>"
                + "</tr>";
        OrderSLSB manager = new OrderSLSB();
        ArrayList<OrderItem> itemList = manager.getOrderItems(orderID);
        double total =0;
        for(int i=0; i<itemList.size(); i++){
            OrderItem orderItem = itemList.get(i);
            result += "<tr>"
                        + "<td>" + orderItem.getName() + "</td>"
                        + "<td>" + orderItem.getNumberUnit() + "</td>"
                        + "<td>" + formatPrice(orderItem.getPrice())+ "</td>"
                        + "<td>" + formatPrice(orderItem.getSubTotal())+ "</td>";
            total += orderItem.getSubTotal();
        }
        result += "<tr><td colspan=5>Total: " + formatPrice(total) +"</td></tr></table>";  
        return result;
    }
    
    private String formatPrice(double price){
        DecimalFormat nf = new DecimalFormat("$##0.00");
        return nf.format((price*100)/100);
    }
}
