package com.example.display_customer_list.repository;

import com.example.display_customer_list.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getList();
}
