package com.example.demo.service;

import com.example.demo.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void create(Product product);
    void update(Product product);
    void delete(int id );
    Product findById(int id);
}
