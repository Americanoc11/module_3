package product_management.Dao.impl_product;

import product_management.model.product.TypeGoods;

import java.util.List;

public interface ITypeGoodsDao {
    List<TypeGoods> findAll();

    void save(TypeGoods typeGoods);

    void delete(int id);

    Object findById(int id);

    void update(TypeGoods typeGoods);
}
