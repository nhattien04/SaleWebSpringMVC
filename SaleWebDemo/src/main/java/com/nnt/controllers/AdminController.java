/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nnt.controllers;

import com.nnt.pojo.Product;
import com.nnt.service.ProductService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author NhatTien
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private ProductService productService; 
    
    @GetMapping("/products")
    public String list(Model model) {
        model.addAttribute("product", new Product());
        return "products";
    }
    
    @PostMapping("/products")
    public String add(@ModelAttribute(value = "product") @Valid Product p,
            BindingResult r) {
        if (r.hasErrors()) {
            return "products";
        }
        
        if (this.productService.addProduct(p) == true)
            return "redirect:/";
        
        return "products";
    }
    
    @GetMapping("/stats")
    public String stats(Model model,
            @RequestParam(value = "quarter", defaultValue = "0") int quarter,
            @RequestParam(value = "year", defaultValue = "2022") int year) {
        model.addAttribute("stats", this.productService.countProductByCate());
        model.addAttribute("revenueStats", this.productService.revenueStats(quarter, year));
        return "stats";
    }
}
