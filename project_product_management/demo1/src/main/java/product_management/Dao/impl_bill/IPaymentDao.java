package product_management.Dao.impl_bill;

import product_management.model.bill.Payment;
import product_management.model.product.Product;

import java.util.List;

public interface IPaymentDao {
    List<Payment> findAll();

    void save(Payment payment);

    void delete(int id);

    Object findById(int id);

    void update(Payment payment);
}
