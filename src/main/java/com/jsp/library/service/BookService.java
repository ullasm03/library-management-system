package com.jsp.library.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.library.dao.BookDao;
import com.jsp.library.entity.Book;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BookService {

	private final BookDao bookDao;

	public void saveBook(Book book) {
		bookDao.saveBook(book);

	}

	public Book FindBookById(int id) {
		 return bookDao.findBookById(id);
	}

	public List<Book> fetchAllBooks() {
		 return bookDao.fetchAllBooks();
	}

	public void updateBook(Book book) {
		bookDao.updateBook(book);

	}

}
