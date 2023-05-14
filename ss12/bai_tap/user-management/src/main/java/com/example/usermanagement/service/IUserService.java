package com.example.usermanagement.service;

import com.example.usermanagement.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    void create(User user);

    void delete(int id);

    Object findById(int id);

    void update(User user);

    User search(String country);
}
