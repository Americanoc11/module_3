package com.example.demo.service;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}
