package product_management.model.product;

public class TypeGoods {
    private int id;
    private String nameType;

    public TypeGoods(int id, String nameType) {
        this.id = id;
        this.nameType = nameType;
    }

    public TypeGoods(String nameType) {
        this.nameType = nameType;
    }

    public TypeGoods() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }
}
