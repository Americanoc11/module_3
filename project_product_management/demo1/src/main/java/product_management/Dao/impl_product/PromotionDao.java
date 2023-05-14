package product_management.Dao.impl_product;

import product_management.Dao.base_connection.BaseConnection;
import product_management.model.product.Promotion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PromotionDao implements IPromotionDao {
    private static final String SELECT_ALL = "select promotion_id,name_promotion,code_promotion,describe_promotion,price_promotion,image from promotion where is_admin=1;";
    private static final String INSERT_INTO = "insert into promotion(name_promotion,code_promotion,describe_promotion,price_promotion,image) value (?,?,?,?,?);";
    private static final String DELETE_BY_ID = "update promotion set is_admin=0 where promotion_id=?;";
    private static final String SELECT_BY_ID = "select promotion_id,name_promotion,code_promotion,describe_promotion,price_promotion,image from promotion where is_admin=1 and promotion_id=?;";
    private static final String UPDATE_BY_ID = "update promotion set name_promotion=?,code_promotion=?,describe_promotion=?,price_promotion=?,image=? where promotion_id=?;";

    @Override
    public List<Promotion> findAll() {
        System.out.println(SELECT_ALL);
        List<Promotion> promotionList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_ALL);
            Promotion promotion;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                promotion = new Promotion();
                promotion.setId(resultSet.getInt("promotion_id"));
                promotion.setName(resultSet.getString("name_promotion"));
                promotion.setCode(resultSet.getString("code_promotion"));
                promotion.setDescribe(resultSet.getString("describe_promotion"));
                promotion.setPrice(resultSet.getDouble("price_promotion"));
                promotion.setImage(resultSet.getString("image"));
                promotionList.add(promotion);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return promotionList;
    }

    @Override
    public void save(Promotion promotion) {
        System.out.println(INSERT_INTO);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, promotion.getName());
            preparedStatement.setString(2, promotion.getCode());
            preparedStatement.setString(3, promotion.getDescribe());
            preparedStatement.setDouble(4, promotion.getPrice());
            preparedStatement.setString(5, promotion.getImage());
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
            Promotion promotion;
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                promotion = new Promotion();
                promotion.setId(resultSet.getInt(resultSet.getInt("promotion_id")));
                promotion.setName(resultSet.getString("name_promotion"));
                promotion.setCode(resultSet.getString("code_promotion"));
                promotion.setDescribe(resultSet.getString("describe_promotion"));
                promotion.setPrice(resultSet.getDouble("price_promotion"));
                promotion.setImage(resultSet.getString("image"));
                return promotion;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Promotion promotion) {
        System.out.println(UPDATE_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, promotion.getName());
            preparedStatement.setString(2, promotion.getCode());
            preparedStatement.setString(3, promotion.getDescribe());
            preparedStatement.setDouble(4, promotion.getPrice());
            preparedStatement.setString(5, promotion.getImage());
            preparedStatement.setInt(6, promotion.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
