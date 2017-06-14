package io.antur.notes.dao.impl;

import io.antur.notes.dao.NoteDao;
import io.antur.notes.entity.Note;
import org.springframework.stereotype.Repository;

@Repository
public class NoteDaoImpl extends GenericDaoImpl<Note, Integer> implements NoteDao {

    public NoteDaoImpl() {
        super(Note.class);
    }
}