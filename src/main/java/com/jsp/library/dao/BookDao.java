package com.jsp.library.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jsp.library.entity.Book;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class BookDao {

	private final EntityManager entityManager;

	public void saveBook(Book book) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(book);
		entityTransaction.commit();
	}

	public Book findBookById(int id) {
		return entityManager.find(Book.class, id);
	}

	public List<Book> fetchAllBooks() {
		return entityManager.createQuery("select b from Book b", Book.class).getResultList();
	}

	public void updateBook(Book book) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(book);
		entityTransaction.commit();
	}
	}
