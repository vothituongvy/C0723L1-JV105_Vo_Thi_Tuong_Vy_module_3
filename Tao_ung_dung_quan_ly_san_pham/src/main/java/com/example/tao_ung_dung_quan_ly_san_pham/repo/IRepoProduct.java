package com.example.tao_ung_dung_quan_ly_san_pham.repo;


import com.example.tao_ung_dung_quan_ly_san_pham.model.Product;

import java.util.List;

public interface IRepoProduct {
    void add(Product product);
    void delete(int id);
    void update(int id,Product product);

    List<Product> findAll();

}
