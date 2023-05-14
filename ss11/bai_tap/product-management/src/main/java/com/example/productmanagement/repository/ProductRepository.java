package com.example.productmanagement.repository;

import com.example.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Samsung", 4000000, "Samsung note 8", "SamSung"));
        productList.add(new Product(2, "Iphone", 4000000, "Iphone 8 pluss", "SamSung"));
        productList.add(new Product(3, "Sony", 4000000, "Sony Xperia X", "Sony"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void create(Product product) {
        product.setId(productList.size() + 1);
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.remove(i);
            }
        }
    }

    @Override
    public Object findById(int id) {
        Product product = new Product();
        for (Product p : productList) {
            if (p.getId() == id) {
                product.setId(p.getId());
                product.setName(p.getName());
                product.setPrice(p.getPrice());
                product.setDescribe(p.getDescribe());
                product.setGoods(p.getGoods());
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(Product product) {
        for (Product p : productList) {
            if (p.getId() == product.getId()) {
                p.setName(product.getName());
                p.setPrice(product.getPrice());
                p.setDescribe(product.getDescribe());
                p.setGoods(product.getGoods());
            }
        }
    }

    @Override
    public List<Product> search(String name) {
        List<Product> products = new ArrayList<>();
        for (Product p : productList) {
            if (p.getName().equals(name)) {
                Product product = new Product();
                product.setId(p.getId());
                product.setName(p.getName());
                product.setPrice(p.getPrice());
                product.setDescribe(p.getDescribe());
                product.setGoods(p.getGoods());
                products.add(product);
            }
        }
        return products;
    }
}
