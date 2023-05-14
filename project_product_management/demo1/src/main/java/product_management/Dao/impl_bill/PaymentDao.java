package product_management.Dao.impl_bill;

import product_management.Dao.base_connection.BaseConnection;
import product_management.model.bill.Payment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentDao implements IPaymentDao {
    private static final String SELECT_ALL = " select payment_id,describe_payment from payment_method where is_admin=1;";
    private static final String SELECT_BY_ID = "select payment_id,describe_payment from payment_method where is_admin=1 and payment_id=?;";
    private static final String INSERT_INTO = " insert into payment_method(describe_payment) value(?);";
    private static final String DELETE_BY_ID = "update payment_method set is_admin=0 where payment_id=? and is_admin=1;";
    private static final String UPDATE = "update payment_method set describe_payment=? where is_admin=1 and payment_id=?;";

    @Override
    public List<Payment> findAll() {
        System.out.println(SELECT_ALL);
        List<Payment> paymentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_ALL);
            Payment payment;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                payment = new Payment();
                payment.setId(resultSet.getInt("payment_id"));
                payment.setDescribe(resultSet.getString("describe_payment"));
                paymentList.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paymentList;
    }

    @Override
    public void save(Payment payment) {
        System.out.println(INSERT_INTO);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, payment.getDescribe());
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
            preparedStatement.setInt(1, id);
            Payment payment;
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                payment = new Payment();
                payment.setId(resultSet.getInt("payment_id"));
                payment.setDescribe(resultSet.getString("describe_payment"));
                return payment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Payment payment) {
        System.out.println(UPDATE);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE);
            preparedStatement.setString(1, payment.getDescribe());
            preparedStatement.setInt(2, payment.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
