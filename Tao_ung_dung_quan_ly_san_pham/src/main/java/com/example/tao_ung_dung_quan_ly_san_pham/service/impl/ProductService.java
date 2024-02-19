package com.example.tao_ung_dung_quan_ly_san_pham.service.impl;

import com.example.tao_ung_dung_quan_ly_san_pham.model.Product;
import com.example.tao_ung_dung_quan_ly_san_pham.repo.RepoProduct;
import com.example.tao_ung_dung_quan_ly_san_pham.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private RepoProduct iRepoProduct=new RepoProduct();

    @Override
    public void save(Product product) {
        iRepoProduct.add(product);
    }

    @Override
    public boolean delete(int id) {
        if(iRepoProduct.findId(id)){
            iRepoProduct.delete(id);
            return true;
        }
        return false;
    }



    @Override
    public List<Product> findAll() {
        return iRepoProduct.findAll();
    }

    @Override
    public void update(int id, Product product) {
        iRepoProduct.update(id,product);
    }

    @Override
    public Product findObject(int id) {
        return iRepoProduct.findObject(id);
    }

}
