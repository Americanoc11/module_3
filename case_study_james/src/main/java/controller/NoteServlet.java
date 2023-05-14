package controller;

import Dao.impl_note.NoteDao;
import model.Note;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NoteServlet", value = "/note")
public class NoteServlet extends HttpServlet {
    private NoteDao noteDao = new NoteDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                showNewForm(request, response);
                break;
            case "update":
                showEditForm(request, response);
                break;
            case "delete":
                deleteNote(request, response);
                break;
            case "search":
                formSearch(request, response);
                break;
            default:
                listNote(request, response);
                break;
        }

    }

    private void formSearch(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        List<Note> noteList = noteDao.search(title);
        request.setAttribute("noteList", noteList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Note note = noteDao.findById(id);
        request.setAttribute("note", note);
        try {
            request.getRequestDispatcher("/view/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        noteDao.delete(id);
        try {
            response.sendRedirect("/note");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listNote(HttpServletRequest request, HttpServletResponse response) {
        List<Note> noteList = noteDao.findAll();
        request.setAttribute("noteList", noteList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                save(request, response);
                break;
            case "update":
                updateNote(request, response);
                break;
        }
    }

    private void updateNote(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        Note note = new Note(id, title, content, typeId);
        noteDao.update(note);
        try {
            response.sendRedirect("/note");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        Note note = new Note(title, content, typeId);
        noteDao.save(note);
        try {
            response.sendRedirect("/note");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}


