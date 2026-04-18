package com.jsp.library.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jsp.library.entity.Issue;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class IssueDao {
	
	private final EntityManager entityManager;
	
	public void saveIssue(Issue issue) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(issue);
		entityTransaction.commit();
	}
	
	public Issue fetchIssueById(int id) {
	    return entityManager.find(Issue.class, id);
	}

	public List<Issue> fetchAllIssues() {
	    return entityManager.createQuery("select i from Issue i", Issue.class).getResultList();
	}
	public void UpdateIssue(Issue issue) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(issue);
		entityTransaction.commit();
	}
	public Issue findActiveIssues( int bookId, int studentId) {
		Query query = entityManager.createQuery("select i from Issue i where i.student.id = :sid AND i.book.id = :bid AND i.status = 'ISSUED'", Issue.class);
		query.setParameter("sid", studentId);
		query.setParameter("bid", bookId);
		List<Issue> list = query.getResultList();
		return list.isEmpty() ? null :list.get(0);
		
	}

	

}
