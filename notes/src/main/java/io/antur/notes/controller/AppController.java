package io.antur.notes.controller;

import io.antur.notes.dao.NoteDao;
import io.antur.notes.entity.Note;
import io.antur.notes.entity.Person;
import io.antur.notes.service.NoteService;
import io.antur.notes.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMethod;

//import javax.servlet.http.HttpServletRequest;
//import com.google.gson.Gson;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "noteList")
public class AppController {
    private static final String REDIRECT_TO_LIST = "redirect:/";
    private static final String LIST_ADD = "noteAdd";
    private static final String LIST_EDIT = "noteEdit";
    private static final String LIST_VIEW = "noteList";


    @Autowired
    NoteDao noteDao;

    PersonService personService;
    NoteService noteService;

    @Autowired
    public AppController(PersonService personService, NoteService noteService) {
        this.personService = personService;
        this.noteService = noteService;

    }

    @RequestMapping("/list")
    @ResponseBody
    public List<Note> notes() {
        return noteService.getNote();
    }

/*    @GetMapping("/first3")
    public ResponseEntity getNote() {

        Note note = noteDao.getById(7);
        if (note == null) {
            return new ResponseEntity("No Note found for ID 7 ", HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity(note, HttpStatus.OK);
    }*/

/*    @GetMapping("/notes/{id}")
    public ResponseEntity getNote(@PathVariable("id") Integer id) {

        Note note = noteDao.getById(id);
        if (note == null) {
            return new ResponseEntity("No Note found for ID " + id, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity(note, HttpStatus.OK);
    }*/


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String doGetNotePageAdd() {
        return LIST_ADD;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String doPostNotePageAdd(Note note) throws IOException {
        noteService.save(note);
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


/*    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delNotePage(Model model, @RequestParam("noteId") Integer noteId) {
        Note note = noteDao.getById(noteId);
        noteDao.delete(note);
        model.addAttribute("note", note);
        return REDIRECT_TO_LIST;
    }*/


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String doGetNotePageDel(@RequestParam("noteId") Integer noteId) {
        noteService.delete(noteId);
        return REDIRECT_TO_LIST;
    }


}
