package io.antur.notes.service.Impl;

import io.antur.notes.dao.NoteDao;
import io.antur.notes.entity.Note;
import io.antur.notes.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NoteServiceImpl implements NoteService {
    @Autowired
    NoteDao noteDao;

    public List<Note> getNotes() {
        return noteDao.getAll();
    }

    public List<Note> getNotes(String findText){
        return noteDao.getAll(findText);
    }

    public void save(Note note) {
        noteDao.save(note);
    }

    public void delete(Integer noteId) {
        Note note = noteDao.getById(noteId);
        noteDao.delete(note);
    }

    public Note getById(Integer noteId) {
         return  noteDao.getById(noteId);
    }

    public void update(Note note, Integer noteId){
        Note update = noteDao.getById(noteId);
        update.setReading(note.getReading());
        update.setText(note.getText());
        update.setUpdatedDate(new Date());
        noteDao.saveOrUpdate(update);
    }
}
