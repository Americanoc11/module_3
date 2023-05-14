package Dao.impl_note;

import Dao.BaseConnection;
import model.Note;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoteDao implements INoteDao {
    private static final String SELECT_BY_ID = "select note_id,title,content,type_id from note where note_id=? and is_note=1;";
    private static final String INSERT_VALUE = "insert into note(title,content,type_id) value(?,?,?);";
    private static final String DELETE = "update note set is_note=0 where note_id=?;";
    private static final String UPDATE = " update note set title=?, content=?,type_id=? where note_id=? and is_note=1;";
    private static final String SEARCH_BY_NAME = " select note_id, title, content, type_id from note where is_note=1 and title like ?;";

    @Override
    public List<Note> findAll() {
        List<Note> noteList = new ArrayList<>();
        String query = "{ call select_all_table()}";
        try {
            CallableStatement callableStatement = BaseConnection.getConnection().prepareCall(query);
            Note note;
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                note = new Note();
                note.setId(resultSet.getInt("n.note_id"));
                note.setTitle(resultSet.getString("n.title"));
                note.setContent(resultSet.getString("n.content"));
                note.setTypeId(resultSet.getInt("n.type_id"));
                noteList.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noteList;
    }

    @Override
    public void save(Note note) {
        System.out.println(INSERT_VALUE);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(INSERT_VALUE);
            preparedStatement.setString(1, note.getTitle());
            preparedStatement.setString(2, note.getContent());
            preparedStatement.setInt(3, note.getTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
//        System.out.println(DELETE);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Note findById(int id) {
        System.out.println(SELECT_BY_ID);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            Note note;
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                note = new Note();
                note.setTitle(resultSet.getString("title"));
                note.setContent(resultSet.getString("content"));
                note.setTypeId(resultSet.getInt("type_id"));
                return note;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Note note) {
        System.out.println(UPDATE);
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(UPDATE);
            preparedStatement.setString(1, note.getTitle());
            preparedStatement.setString(2, note.getContent());
            preparedStatement.setInt(3, note.getTypeId());
            preparedStatement.setInt(4, note.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Note> search(String title) {
        System.out.println(SEARCH_BY_NAME);
        List<Note> noteList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(SEARCH_BY_NAME);
            preparedStatement.setString(1, title);
            ResultSet resultSet = preparedStatement.executeQuery();
            Note note;
            while (resultSet.next()) {
                note = new Note();
                note.setId(resultSet.getInt("note_id"));
                note.setTitle(resultSet.getString("title"));
                note.setContent(resultSet.getString("content"));
                note.setTypeId(resultSet.getInt("type_id"));
                noteList.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noteList;
    }
}
