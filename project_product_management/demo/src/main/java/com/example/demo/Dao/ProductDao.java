package com.example.demo.Dao;

import com.example.demo.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductDao implements IProductDao {
    private final List<Product> list = new ArrayList<Product>() {{
        add(new Product(1, "Laptop", "15/2/2020", "mau xanh"));
        add(new Product(2, "Iphone", "15/2/2020", "mau den"));
        add(new Product(3, "Samsung", "15/2/2020", "mau do"));
    }};

    @Override
    public List<Product> findAll() {
        return list;
    }

    @Override
    public void create(Product product) {
        product.setId(list.size() + 1);
        product.setName(product.getName());
        product.setDate(product.getDate());
        product.setDetail(product.getDetail());
        list.add(product);
    }

    @Override
    public void update(Product product) {
        for (Product element : list) {
            if (product.getId() == element.getId()) {
                element.setName(product.getName());
                element.setDate(product.getDate());
                element.setDetail(product.getDetail());
            }
        }
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id) {
                list.remove(i);
                return;
            }
        }
    }

    @Override
    public Product findById(int id) {
        return list.get(id);
    }
}
