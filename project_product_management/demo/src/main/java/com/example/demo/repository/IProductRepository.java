package com.example.demo.repository;

import com.example.demo.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void delete(int id);

    Product findById(int id);


    void update(Product product);

    void create(Product product);
}
