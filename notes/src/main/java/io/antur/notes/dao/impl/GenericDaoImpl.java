package io.antur.notes.dao.impl;

import io.antur.notes.dao.GenericDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Transactional
public class GenericDaoImpl<T,K extends Serializable> implements GenericDao<T,K> {
    private Class<T> type;

    @Autowired
    private SessionFactory sessionFactory;

    public GenericDaoImpl(Class<T> type) {
        this.type = type;
    }

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }


   @SuppressWarnings("unchecked")
    public K save(T entity) {
        return (K) getSession().save(entity);
    }

   public void update(T entity) {
        getSession().update(entity);
    }

   public void saveOrUpdate(T entity) {
        getSession().saveOrUpdate(entity);
    }

   public void delete(T entity) {
        getSession().delete(entity);
    }

    public T getById(K key) {
        return getSession().get(type, key);
    }

   public List<T> getAll() {
        Query query = getSession().createQuery(String.format("from %s", type.getName()));
        return query.list();
    }

    public List<T> getAll(String findText) {
        org.hibernate.query.Query query = getSession().createQuery(String.format("FROM %s f WHERE f.reading like ? OR f.text like ?", type.getName()));
        query.setParameter(0, "%"+findText+"%");
        query.setParameter(1, "%"+findText+"%");
        return query.list();
    }
}
