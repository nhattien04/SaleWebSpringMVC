/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nnt.service.impl;

import com.nnt.pojo.Product;
import com.nnt.repository.ProductRepository;
import com.nnt.service.ProductService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NhatTien
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository; 

    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        return this.productRepository.getProducts(params, page);
    }    

    @Override
    public int countProducts() {
        return this.productRepository.countProducts();
    }

    @Override
    public boolean deleteProduct(int id) {
        return this.productRepository.deleteProduct(id);
    }

    @Override
    public boolean addProduct(Product p) {
//        p.setImage("https://res.cloudinary.com/ou-hcm/image/upload/v1657708646/ipad-pro-m1-11-inch-wifi-bac-thumb-600x600_nt4mmn.jpg");
        return this.productRepository.addProduct(p);
    }

    @Override
    public List<Object[]> countProductByCate() {
        return this.productRepository.countProductByCate();
    }

    @Override
    public List<Object[]> revenueStats(int quarter, int year) {
        return this.productRepository.revenueStats(quarter, year);
    }
}
