/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.helper;

import com.model.Product;
import com.stateless.ProductSLSB;
import java.util.ArrayList;

/**
 *
 * @author FPT
 */
public class IndexPageHelper {
    
    public String printProductTable(){
        ProductSLSB manager = new ProductSLSB();
        String output = "<table class='table table-striped table-hover'>"
                + "<tr style='background-color: #adafb2;'>"
                + "<th>Product</th>"
                + "<th># in Stock</th>"
                + "<th>Unit Price</th>"
                + "</tr>";
        ArrayList<Product> productList = manager.getProductList();
        if(productList != null && !productList.isEmpty()){
            for(int i=0; i<productList.size(); i++){
                output += "<tr>"
                        + "<td>" + productList.get(i).getName() + "</td>"
                        + "<td>" + productList.get(i).getStockLevel()+ "</td>"
                        + "<td>" + productList.get(i).getUnitPriceText()+ "</td>"
                        + "</tr>";
            }
        } else {
            output += "<tr><td colspan=3>No data found!</td></td>";
        }
        output += "</table>";
        return output;
    }
}
