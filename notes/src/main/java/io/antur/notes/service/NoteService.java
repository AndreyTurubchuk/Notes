package io.antur.notes.service;

import io.antur.notes.entity.Note;
import java.util.List;

/**
 * Created by AnTur on 11.06.2017.
 */
public interface NoteService {
    List<Note> getNotes();
    List<Note> getNotes(String findText);
    void save(Note note);
    void delete(Integer noteId);
    void update(Note note, Integer noteId);
    Note getById(Integer noteId);
}
