package com.example.demo.model;

public class Product {
    private int id ;
    private String name;
    private String date;
    private String detail;

    public Product() {
    }

    public Product(int id, String name,String date, String detail) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.detail = detail;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
