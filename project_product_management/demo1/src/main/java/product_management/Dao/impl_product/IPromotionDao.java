package product_management.Dao.impl_product;

import product_management.model.product.Product;
import product_management.model.product.Promotion;

import java.util.List;

public interface IPromotionDao {
    List<Promotion> findAll();

    void save(Promotion promotion);

    void delete(int id);

    Object findById(int id);

    void update(Promotion promotion);
}
