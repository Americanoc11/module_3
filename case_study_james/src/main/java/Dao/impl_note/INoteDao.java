package Dao.impl_note;

import model.Note;

import java.util.List;

public interface INoteDao {
    List<Note> findAll();

    void save(Note note);

    void delete(int id);

    Note findById(int id);

    void update(Note note);

    List<Note> search(String title);
}
