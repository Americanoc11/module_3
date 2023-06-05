package com.example.usermanagement.repository;

import com.example.usermanagement.base.BaseConnection;
import com.example.usermanagement.model.User;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String SP_SELECT_ALL = " call select_all_users()";
    private static final String SP_UPDATE_BY_ID = " call update_by_id(?)";
    private static final String SP_DELETE_BY_ID = " call delete_by_id(?)";
    private static final String INSERT_INTO = " insert into users(users_name,email,country) value(?,?,?);";
    private static final String SELECT_BY_ID = " select * from users where id=?;";
    private static final String SEARCH_BY_COUNTRY = " select * from users where country = ?;";
  

    @Override
    public List<User> findAll() {
        System.out.println(SP_SELECT_ALL);
        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = BaseConnection.getConnection().prepareCall(SP_SELECT_ALL);
            User user;
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("users_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void create(User user) {
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        System.out.println(SP_DELETE_BY_ID);
        try {
            CallableStatement callableStatement = BaseConnection.getConnection().prepareCall(SP_DELETE_BY_ID);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Object findById(int id) {
        User user;
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("users_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(User user) {
        System.out.println(SP_UPDATE_BY_ID);
        try {
            CallableStatement callableStatement = BaseConnection.getConnection().prepareCall(SP_UPDATE_BY_ID);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, user.getId());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public User search(String country) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SEARCH_BY_COUNTRY);
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("users_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
