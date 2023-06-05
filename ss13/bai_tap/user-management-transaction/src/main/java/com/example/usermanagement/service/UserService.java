package com.example.usermanagement.service;

import com.example.usermanagement.model.User;
import com.example.usermanagement.repository.IUserRepository;
import com.example.usermanagement.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();


    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public void insertUser(User newUser) {
        iUserRepository.insertUser(newUser);
    }

    @Override
    public void updateUser(User book) {
        iUserRepository.updateUser(book);
    }

    @Override
    public void deleteUser(int id) {
        iUserRepository.deleteUser(id);
    }
}
