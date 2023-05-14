package product_management.Dao.impl_product;

import product_management.model.product.Product;
import product_management.model.product.Suppliers;

import java.util.List;

public interface IProductDao {
    List<Product> findAll();

    void save(Product product);

    void delete(int id);

    Object findById(int id);

    void update(Product product);
}
