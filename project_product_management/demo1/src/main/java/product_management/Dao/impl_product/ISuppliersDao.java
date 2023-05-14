package product_management.Dao.impl_product;

import product_management.model.product.Suppliers;

import java.util.List;

public interface ISuppliersDao {
    List<Suppliers> findAll();

    void save(Suppliers suppliers);

    void delete(int id);

    Object findById(int id);

    void update(Suppliers suppliers);
}
