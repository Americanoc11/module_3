package product_management.model.bill;

public class Payment {
    private int id;
    private String describe;
    public Payment() {

    }

    public Payment(String describe) {
        this.describe = describe;
    }

    public Payment(int id, String describe) {
        this.id = id;
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
