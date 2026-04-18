package com.jsp.library.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jsp.library.entity.Book;
import com.jsp.library.service.BookService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BookController {

	private final BookService bookService;

	@GetMapping("/")
	public String displayHome() {
		return "redirect:/books";
	}

	@GetMapping("books")
	public String displayBooks( Model model) {
		List<Book> list = bookService.fetchAllBooks();
		model.addAttribute("list",list);
		return "book-list";

	}
	@GetMapping("addBookPage")
	public String displayAddBookPage() {
		return "add-book";
		
	}
	@PostMapping("addBook")
	public String addBook(@ModelAttribute Book book) {
		bookService.saveBook(book);
		return "redirect:/books";
				
	}

}
