package com.example.productmanagement.model;

public class Product {
    private int id;
    private String name;
    private int price;
    private String describe;
    private String goods;

    public Product() {
    }

    public Product(int id, String name, int price, String describe, String goods) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.goods = goods;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }
}
