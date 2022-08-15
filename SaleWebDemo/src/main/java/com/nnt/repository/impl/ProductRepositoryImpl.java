/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nnt.repository.impl;

import com.nnt.pojo.Product;
import com.nnt.repository.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author NhatTien
 */
@Repository
@Transactional
@PropertySource("classpath:messages.properties")
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private Environment env;

    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root<Product> root = q.from(Product.class);
        q.select(root);
        
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fromPrice = params.get("fromprice");
            if (fromPrice != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(fromPrice));
                predicates.add(p);
            }

            String toPrice = params.get("toprice");
            if (toPrice != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(toPrice));
                predicates.add(p);
            }

            String cateId = params.get("cateId"); // Lay /cateId tren link
            if (cateId != null) {
                Predicate p = b.equal(root.get("categoryId"), Integer.parseInt(cateId)); // categoryId la doi tuong của Lop Product trong pojo
                predicates.add(p);
            }

            q.where((Predicate[]) predicates.toArray(Predicate[]::new));
        }

        // Phan trang
        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
            // Moi lan truy van chi lay so luong san pham theo SIZE ban dau
        }
        return query.getResultList();
    }

    @Override
    public int countProducts() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(*) FROM Product");
        
        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean deleteProduct(int id) {
        try {
            Session session = sessionFactory.getObject().getCurrentSession();
            Product p =  session.get(Product.class, id);
            session.delete(p);
            
            return true;
        } catch(Exception ex) {
            ex.printStackTrace();
            return false;
        }  
    }

    @Override
    public boolean addProduct(Product p) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(p);
            
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
