package com.example.usermanagement.repository;

import com.example.usermanagement.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAllUsers();

    User selectUser(int id);

    void insertUser(User newUser);

    boolean updateUser(User book);

    boolean deleteUser(int id);
}
