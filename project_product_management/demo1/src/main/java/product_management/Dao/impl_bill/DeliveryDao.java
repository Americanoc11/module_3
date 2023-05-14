package product_management.Dao.impl_bill;

import product_management.Dao.base_connection.BaseConnection;
import product_management.model.bill.Delivery;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDao implements IDeliveryDao {
    private static final String SELECT_ALL = " select delivery_id,describe_delivery from delivery_method where is_admin=1;";
    private static final String SELECT_BY_ID = "select delivery_id,describe_delivery from delivery_method where is_admin=1 and delivery_id=?;";
    private static final String INSERT_INTO = " insert into delivery_method(describe_delivery) value(?);";
    private static final String DELETE_BY_ID = "update delivery_method set is_admin=0 where delivery_id=?;";
    private static final String UPDATE = "update delivery_method set describe_delivery=? where is_admin=1 and delivery_id=?;";

    @Override
    public List<Delivery> findAll() {
        System.out.println(SELECT_ALL);
        List<Delivery> deliveryList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_ALL);
            Delivery delivery;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                delivery = new Delivery();
                delivery.setId(resultSet.getInt("delivery_id"));
                delivery.setDescribe(resultSet.getString("describe_delivery"));
                deliveryList.add(delivery);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveryList;
    }

    @Override
    public void save(Delivery delivery) {
        System.out.println(INSERT_INTO);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, delivery.getDescribe());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        System.out.println(DELETE_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Object findById(int id) {
        System.out.println(SELECT_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_BY_ID);
            Delivery delivery;
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                delivery = new Delivery();
                delivery.setId(resultSet.getInt("delivery_id"));
                delivery.setDescribe(resultSet.getString("describe_delivery"));
                return delivery;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Delivery delivery) {
        System.out.println(UPDATE);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE);
            preparedStatement.setString(1, delivery.getDescribe());
            preparedStatement.setInt(2, delivery.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
