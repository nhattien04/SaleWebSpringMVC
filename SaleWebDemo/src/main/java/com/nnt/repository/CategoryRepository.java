/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nnt.repository;

import com.nnt.pojo.Category;
import java.util.List;

/**
 *
 * @author NhatTien
 */
public interface CategoryRepository {
    List<Category> getCategories();
}
