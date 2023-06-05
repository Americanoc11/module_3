package com.example.usermanagement.service;

import com.example.usermanagement.model.User;
import com.example.usermanagement.repository.IUserRepository;
import com.example.usermanagement.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public void create(User user) {
        iUserRepository.create(user);
    }

    @Override
    public void delete(int id) {
        iUserRepository.delete(id);
    }

    @Override
    public Object findById(int id) {
        return iUserRepository.findById(id);
    }

    @Override
    public void update(User user) {
        iUserRepository.update(user);
    }

    @Override
    public User search(String country) {
        return iUserRepository.search(country);
    }
}
