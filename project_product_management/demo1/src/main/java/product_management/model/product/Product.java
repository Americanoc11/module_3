package product_management.model.product;

public class Product {
    private int id;
    private String name;
    private String describe;
    private double price;
    private String image;
    private int typeId;
    private String note;
    private int amount;
    private int supplierId;

    public Product() {

    }

    public Product(int id, String name, String describe, double price, String image,
                   int typeId, String note, int amount, int supplier_id) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.typeId = typeId;
        this.note = note;
        this.amount = amount;
        this.supplierId = supplier_id;
    }

    public Product(String name, String describe, double price,
                   String image, int typeId, String note, int amount, int supplierId) {
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.typeId = typeId;
        this.note = note;
        this.amount = amount;
        this.supplierId = supplierId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }
}
