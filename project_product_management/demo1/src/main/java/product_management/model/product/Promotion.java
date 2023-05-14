package product_management.model.product;

public class Promotion {
    private int id;
    private String name;
    private String code;
    private String describe;
    private Double price;
    private String image;
    private int productId;

    public Promotion() {

    }

    public Promotion(String name, String code, String describe, Double price, String image) {
        this.name = name;
        this.code = code;
        this.describe = describe;
        this.price = price;
        this.image = image;
    }

    public Promotion(int id, String name, String code, String describe,
                     Double price, String image, int productId) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.productId = productId;
    }

    public Promotion(int id, String name, String code, String describe, Double price, String image) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.describe = describe;
        this.price = price;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
