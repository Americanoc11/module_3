package com.example.usermanagement.repository;

import com.example.usermanagement.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();

    void create(User user);

    void delete(int id);

    Object findById(int id);

    void update(User user);

    User search(String country);
}
