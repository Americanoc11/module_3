package product_management.Dao.impl_product;

import product_management.Dao.base_connection.BaseConnection;
import product_management.model.product.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao implements IProductDao {
    private static final String SELECT_ALL = "select product_id,name_product,describe_product,price,image,type_id,note,amount,suppliers_id from product where is_admin=1;";
    private static final String INSERT_INTO = "insert into product(name_product,describe_product,price,image,type_id,note,amount,suppliers_id) value (?,?,?,?,?,?,?,?);";
    private static final String DELETE_BY_ID = "update product set is_admin=0 where product_id=?;";
    private static final String SELECT_BY_ID = "select name_product,describe_product,price,image,type_id,note,amount,suppliers_id from product where is_admin=1 and product_id=?;";
    private static final String UPDATE_BY_ID = "update product set name_product=?,describe_product=?,price=?,image=?,type_id=?,note=?,amount=?,suppliers_id=? where product_id=?;";

    @Override
    public List<Product> findAll() {
        System.out.println(SELECT_ALL);
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_ALL);
            Product product;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                product = new Product();
                product.setId(resultSet.getInt("product_id"));
                product.setName(resultSet.getString("name_product"));
                product.setDescribe(resultSet.getString("describe_product"));
                product.setPrice(resultSet.getDouble("price"));
                product.setImage(resultSet.getString("image"));
                product.setTypeId(resultSet.getInt("type_id"));
                product.setNote(resultSet.getString("note"));
                product.setAmount(resultSet.getInt("amount"));
                product.setSupplierId(resultSet.getInt("suppliers_id"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public void save(Product product) {
        System.out.println(INSERT_INTO);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescribe());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getTypeId());
            preparedStatement.setString(6, product.getNote());
            preparedStatement.setInt(7, product.getAmount());
            preparedStatement.setInt(8, product.getSupplierId());
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
            PreparedStatement preparedStatemen = BaseConnection.getConnection().prepareStatement(SELECT_BY_ID);
            Product product;
            preparedStatemen.setInt(1, id);
            ResultSet resultSet = preparedStatemen.executeQuery();
            if (resultSet.next()) {
                product = new Product();
                product.setName(resultSet.getString("name_product"));
                product.setDescribe(resultSet.getString("describe_product"));
                product.setPrice(resultSet.getDouble("price"));
                product.setImage(resultSet.getString("image"));
                product.setTypeId(resultSet.getInt("type_id"));
                product.setNote(resultSet.getString("note"));
                product.setAmount(resultSet.getInt("amount"));
                product.setSupplierId(resultSet.getInt("suppliers_id"));
                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Product product) {
        System.out.println(UPDATE_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescribe());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getTypeId());
            preparedStatement.setString(6, product.getNote());
            preparedStatement.setInt(7, product.getAmount());
            preparedStatement.setInt(8, product.getSupplierId());
            preparedStatement.setInt(9, product.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
