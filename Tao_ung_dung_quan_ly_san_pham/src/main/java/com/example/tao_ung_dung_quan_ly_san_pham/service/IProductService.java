package com.example.tao_ung_dung_quan_ly_san_pham.service;

import com.example.tao_ung_dung_quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductService {
    void save(Product product);
    boolean delete(int id);
    List<Product> findAll();
    void update(int id,Product product);
    Product findObject(int id);
}
