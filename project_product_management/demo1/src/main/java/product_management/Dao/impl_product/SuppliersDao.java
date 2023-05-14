package product_management.Dao.impl_product;

import product_management.Dao.base_connection.BaseConnection;
import product_management.model.product.Suppliers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SuppliersDao implements ISuppliersDao {
    private static final String SELECT_ALL =
            "select suppliers_id,name_suppliers,phone,address from suppliers where is_admin=1;";
    private static final String INSERT_INTO =
            "insert into suppliers (name_suppliers,phone,address) value (?,?,?);";
    private static final String DELETE_BY_ID =
            "update suppliers set is_admin=0 where suppliers_id=?;";
    private static final String SELECT_BY_ID =
            " suppliers_id,name_suppliers,phone,address from suppliers where is_admin=1 and suppliers_id=?;";
    private static final String UPDATE_BY_ID =
            "update suppliers set name_suppliers=?,phone=?,address=? where suppliers_id=?;";

    @Override
    public List<Suppliers> findAll() {
        System.out.println(SELECT_ALL);
        List<Suppliers> suppliersList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_ALL);
            Suppliers suppliers;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                suppliers = new Suppliers();
                suppliers.setId(resultSet.getInt("suppliers_id"));
                suppliers.setName(resultSet.getString("name_suppliers"));
                suppliers.setPhone(resultSet.getString("phone"));
                suppliers.setAddress(resultSet.getString("address"));
                suppliersList.add(suppliers);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return suppliersList;
    }

    @Override
    public void save(Suppliers suppliers) {
        System.out.println(INSERT_INTO);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, suppliers.getName());
            preparedStatement.setString(2, suppliers.getPhone());
            preparedStatement.setString(3, suppliers.getAddress());
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
        Suppliers suppliers;
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                suppliers = new Suppliers();
                suppliers.setId(resultSet.getInt("suppliers_id"));
                suppliers.setName(resultSet.getString("name_suppliers"));
                suppliers.setPhone(resultSet.getString("phone"));
                suppliers.setAddress(resultSet.getString("address"));
                return suppliers;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Suppliers suppliers) {
        System.out.println(UPDATE_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, suppliers.getName());
            preparedStatement.setString(2, suppliers.getPhone());
            preparedStatement.setString(3, suppliers.getAddress());
            preparedStatement.setInt(4, suppliers.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
