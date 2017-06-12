package io.antur.notes.controller;

import io.antur.notes.entity.Note;
import io.antur.notes.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.util.List;

@Controller
public class AppController {
    private static final String REDIRECT_TO_LIST = "redirect:/";
    private static final String LIST_ADD = "noteAdd";
    private static final String LIST_EDIT = "noteEdit";

    NoteService noteService;

    @Autowired
    public AppController(NoteService noteService) {
        this.noteService = noteService;

    }

    @RequestMapping("/list")
    @ResponseBody
    public List<Note> notes(@RequestParam(value = "findText", required = false) String findText) {
        if (findText == null || findText.equals("")) {
            return noteService.getNotes();
        }
        else return noteService.getNotes(findText);
    }

        @RequestMapping(value = "/add", method = RequestMethod.GET)
        public String doGetNotePageAdd () {
            return LIST_ADD;
        }

        @RequestMapping(value = "/add", method = RequestMethod.POST)
        public String doPostNotePageAdd (Note note) throws IOException {
            noteService.save(note);
            return REDIRECT_TO_LIST;
        }

        @RequestMapping(value = "/edit", method = RequestMethod.GET)
        public String doGetNotePageEdit (Model model,
                @RequestParam("noteId") Integer noteId){
            Note note = noteService.getById(noteId);
            model.addAttribute("note", note);
            return LIST_EDIT;
        }

        @RequestMapping(value = "/getEditJSON", params = "noteId")
        @ResponseBody
        public Note getByIdFromParam (@RequestParam("noteId") Integer noteId){
            return noteService.getById(noteId);
        }

        @RequestMapping(value = "/edit", method = RequestMethod.POST)
        public String doPostNotePageEdit (Note note,
                @RequestParam("noteId") Integer noteId){
            noteService.update(note, noteId);
            return REDIRECT_TO_LIST;
        }

        @RequestMapping(value = "/delete", method = RequestMethod.GET)
        public String doGetNotePageDel (@RequestParam("noteId") Integer noteId){
            noteService.delete(noteId);
            return REDIRECT_TO_LIST;
        }
    }
