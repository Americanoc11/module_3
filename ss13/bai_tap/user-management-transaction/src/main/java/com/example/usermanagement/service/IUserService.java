package com.example.usermanagement.service;

import com.example.usermanagement.model.User;

import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();

    User selectUser(int id);

    void insertUser(User newUser);

    void updateUser(User book);

    void deleteUser(int id);
}
