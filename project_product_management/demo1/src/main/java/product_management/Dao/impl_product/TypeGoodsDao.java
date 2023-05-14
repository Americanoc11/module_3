package product_management.Dao.impl_product;

import product_management.Dao.base_connection.BaseConnection;
import product_management.model.product.Suppliers;
import product_management.model.product.TypeGoods;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeGoodsDao implements ITypeGoodsDao {
    private static final String SELECT_ALL =
            "select type_id,name_type from type_goods where is_admin=1;";
    private static final String INSERT_INTO =
            "insert into type_goods(name_type) value (?);";
    private static final String DELETE_BY_ID =
            "update type_goods set is_admin=0 where type_id=?;";
    private static final String SELECT_BY_ID =
            "select type_id,name_type from type_goods where is_admin=1 and type_id=?;";
    private static final String UPDATE_BY_ID =
            "update type_goods set name_type=? where type_id=?;";

    @Override
    public List<TypeGoods> findAll() {
        System.out.println(SELECT_ALL);
        List<TypeGoods> tyleList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_ALL);
            TypeGoods typeGoods;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                typeGoods = new TypeGoods();
                typeGoods.setId(resultSet.getInt("type_id"));
                typeGoods.setNameType(resultSet.getString("name_type"));
                tyleList.add(typeGoods);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tyleList;
    }

    @Override
    public void save(TypeGoods typeGoods) {
        System.out.println(INSERT_INTO);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, typeGoods.getNameType());
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
            TypeGoods typeGoods;
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                typeGoods = new TypeGoods();
                typeGoods.setId(resultSet.getInt("type_id"));
                typeGoods.setNameType(resultSet.getString("name_type"));
                return typeGoods;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(TypeGoods typeGoods) {
        System.out.println(UPDATE_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, typeGoods.getNameType());
            preparedStatement.setInt(2, typeGoods.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
