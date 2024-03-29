/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nnt.service;

import com.nnt.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author NhatTien
 */
public interface ProductService {
    List<Product> getProducts(Map<String, String> params, int page);
    int countProducts();
    boolean deleteProduct(int id);
    boolean addProduct(Product p);
    List<Object[]> countProductByCate();
    List<Object[]> revenueStats(int quarter, int year);
}
