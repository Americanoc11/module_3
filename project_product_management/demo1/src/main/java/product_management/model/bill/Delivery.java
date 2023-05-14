package product_management.model.bill;

public class Delivery {
    private int id;
    private String describe;
    public Delivery() {}

    public Delivery(int id, String describe) {
        this.id = id;
        this.describe = describe;
    }

    public Delivery(String describe) {
        this.describe = describe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
