/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nnt.configs;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author NhatTien
 */
@Configurable
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.nnt.controllers",
    "com.nnt.repository",
    "com.nnt.repository.impl",
    "com.nnt.service",
    "com.nnt.service.impl",
})
public class WebAppContextConfig implements WebMvcConfigurer {
    // Phan giai view
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer conf) {
        conf.enable();
    }
    
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver r = new InternalResourceViewResolver();
        r.setPrefix("/WEB-INF/jsp/");
        r.setSuffix(".jsp");
        r.setViewClass(JstlView.class);
        
        return r;
    }
}
