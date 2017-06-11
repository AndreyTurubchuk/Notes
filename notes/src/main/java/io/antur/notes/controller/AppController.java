package io.antur.notes.controller;

import io.antur.notes.dao.NoteDao;
import io.antur.notes.entity.Note;
//import io.antur.notes.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import javax.servlet.http.HttpServletRequest;
//import com.google.gson.Gson;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
//@RequestMapping(value = "/noteList")
public class AppController {
    private static final String REDIRECT_TO_LIST = "redirect:/noteList/list";
    private static final String LIST_ADD = "noteAdd";
    private static final String LIST_EDIT = "noteEdit";
    private static final String LIST_VIEW = "noteList";


    @Autowired
    NoteDao noteDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("noteListAll", noteDao.getAll());
        return LIST_VIEW;
    }

    @GetMapping("/first")
    public
    @ResponseBody
    List<Note> getNote() {
        return noteDao.getAll();
    }


    @GetMapping("/notes/{id}")
    public ResponseEntity getNote(@PathVariable("id") Integer id) {

        Note note = noteDao.getById(id);
        if (note == null) {
            return new ResponseEntity("No Note found for ID " + id, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity(note, HttpStatus.OK);
    }



    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String noteAdd() {
        return LIST_ADD;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String doPostNotePageAdd(Note note) throws IOException {
        note.setCreatedDate(new Date());
        noteDao.save(note);
        return REDIRECT_TO_LIST;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String doGetNotePageEdit(Model model,
                                    @RequestParam("noteId") Integer noteId) {
        Note note = noteDao.getById(noteId);
        model.addAttribute("note", note);
        return LIST_EDIT;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String doPostNotePageEdit(Note note,
                                     @RequestParam("noteId") Integer noteId) {
        Note update = noteDao.getById(noteId);
        update.setReading(note.getReading());
        update.setText(note.getText());
        update.setUpdatedDate(new Date());
        noteDao.saveOrUpdate(update);
        return REDIRECT_TO_LIST;
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delNotePage(Model model, @RequestParam("noteId") Integer noteId) {
        Note note = noteDao.getById(noteId);
        noteDao.delete(note);
        model.addAttribute("note", note);
        return REDIRECT_TO_LIST;
    }

    @RequestMapping(value = "/JSON", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Note> notePage() {
        List<Note> noteAll = noteDao.getAll();
        return noteAll;
    }
















 /*   @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView getData() {
        //return back to index.jsp
        ModelAndView model = new ModelAndView("noteList");
        model.addObject("headerTitle", "Список пользователей");
        return model;
    }*/


 /*   @RequestMapping("/first")
    public String firstPage(Model model) {
        model.addAttribute("user", "myuser");
        return "first";
    }*/

/*    @RequestMapping("/second")
    public String secondPage(Model model, @ModelAttribute User modelUser) {
        model.addAttribute("user", modelUser);
        return "second";
    }*/

}
