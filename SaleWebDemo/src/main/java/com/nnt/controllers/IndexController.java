/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nnt.controllers;

import com.nnt.service.CategoryService;
import com.nnt.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author NhatTien
 */
@Controller
public class IndexController {
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ProductService productService;
    

    @RequestMapping("/")
    public String index(Model model,
            @RequestParam Map<String, String> params) {
//        List<String> categories = new ArrayList<>();
//        categories.add("Mobile");
//        categories.add("Tablet");
//        categories.add("Desktop");
//
//        model.addAttribute("categories", categories);   
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("products", this.productService.getProducts(params, 0));

//        List<String> products = new ArrayList<>();
//        products.add("iPhone 13 Pro Max");
//        products.add("iPhone 13 Pro");
//        products.add("iPhone 13");
//        products.add("iPhone 13 Mini");
//        products.add("iPhone 11 Pro");
//        products.add("iPhone XS Max");
//        products.add("iPhone X");
//        products.add("iPhone 12 Pro Max");
//        products.add("iPad Pro M1 2021");
//
//        String kw = params.get("kw");
//        if (kw == null) {
//            model.addAttribute("products", products);
//        } else {
//            model.addAttribute("products", products.stream().filter(p -> p.toLowerCase().contains(kw.toLowerCase())).collect(Collectors.toList()));
//        }

        return "index";
    }
}
