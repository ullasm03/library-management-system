package com.jsp.library.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.library.dao.BookDao;
import com.jsp.library.dao.IssueDao;
import com.jsp.library.dao.StudentDao;
import com.jsp.library.entity.Book;
import com.jsp.library.entity.Issue;
import com.jsp.library.entity.Student;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class IssueService {

	private final BookDao bookDao;
	private final StudentDao studentDao;
	private final IssueDao issueDao;

	public void saveIssue(int bookId, int studentId) {
		Book book = bookDao.findBookById(bookId);
		Student student = studentDao.fetchStudentById(studentId);
		// checking whether both book and student is present in the database
		if (book == null || student == null) {
			System.out.println("Invalid Student or Book");
			return;
		}
		// checking whether the student or the book is already issued for the same
		// student or not
		Issue activeIssues = issueDao.findActiveIssues(bookId, studentId);
		if (activeIssues != null) {
			System.out.println("The book is already issued for the same student");
			return;
		}
		// Checking the book copies is available or not
		if (book.getAvailableCopies() > 0) {
			Issue issue = new Issue();
			issue.setBook(book);
			issue.setStudent(student);
			issue.setIssueDate(LocalDate.now());
			issue.setStatus("ISSUED");
			book.setAvailableCopies(book.getAvailableCopies() - 1);
			issueDao.saveIssue(issue);
			bookDao.updateBook(book);
		}
	}

	public Issue fetchIssueById(int id) {
		return issueDao.fetchIssueById(id);
	}

	public List<Issue> fetchAllIssues() {
		return issueDao.fetchAllIssues();
	}

	public void returnBook(int id) {
		Issue issue = issueDao.fetchIssueById(id);

		if (issue == null) {
			throw new RuntimeException("Issue not found");
		}
		issue.setReturnDate(LocalDate.now());
		issue.setStatus("RETURNED");

		Book book = issue.getBook();
		book.setAvailableCopies(book.getAvailableCopies() + 1);

		// 🔹 Update DB
		bookDao.updateBook(book);
		issueDao.UpdateIssue(issue);

	}

}