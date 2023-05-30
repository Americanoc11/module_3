package com.example.display_customer_list.service;

import com.example.display_customer_list.model.Customer;
import com.example.display_customer_list.repository.CustomerRepository;
import com.example.display_customer_list.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> getList() {
        return iCustomerRepository.getList();
    }
}
