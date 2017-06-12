package io.antur.notes.entity;

import javax.persistence.*;

@Entity
@Table(name = "NOTES")
public class Note extends GeneralEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "NOTE_ID")
    private Integer noteId;

    @Column(name = "READING")
    private String reading;

    @Column(name = "TEXT")
    private String text;

    public Note() {
    }

    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public String getReading() {
        return reading;
    }

    public void setReading(String reading) {
        this.reading = reading;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
