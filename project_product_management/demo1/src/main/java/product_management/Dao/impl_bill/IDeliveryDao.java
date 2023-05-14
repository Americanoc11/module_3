package product_management.Dao.impl_bill;

import product_management.model.bill.Delivery;
import product_management.model.product.Product;

import java.util.List;

public interface IDeliveryDao {
    List<Delivery> findAll();

    void save(Delivery delivery);

    void delete(int id);

    Object findById(int id);

    void update(Delivery delivery);
}
