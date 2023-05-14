package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void create(Product product);

    void delete(int id);

    Object findById(int id);

    void update(Product product);

    List<Product> search(String name);
}
