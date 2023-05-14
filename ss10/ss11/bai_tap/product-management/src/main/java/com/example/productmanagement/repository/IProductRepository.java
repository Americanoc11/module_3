package com.example.productmanagement.repository;

import com.example.productmanagement.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void create(Product product);

    void delete(int id);

    Object findById(int id);

    void update(Product product);

    List<Product> search(String name);
}
