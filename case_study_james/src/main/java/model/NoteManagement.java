package model;

public class NoteManagement extends Note {
    private String name;
    private String description;
    public NoteManagement(){}

    public NoteManagement(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public NoteManagement(int id, String title, String content, String name, String description) {
        super(id, title, content);
        this.name = name;
        this.description = description;
    }

    public NoteManagement(int id, String title, String content, int typeId, String name, String description) {
        super(id, title, content, typeId);
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
