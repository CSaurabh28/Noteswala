package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;

import com.entities.Notes;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				
				Notes note=new Notes(title,content,new Date());
				//System.out.println(note.getId()+","+note.getTitle()+","+note.getContent());
				Session s= FactoryProvider.getFactory().openSession();
				Transaction tx=s.beginTransaction();
				s.persist(note);
				
				tx.commit();
				
				s.close();
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>ADDED SUCCESSFULLY<h1>");
				out.println("<h1 style='text-align:center;'><a href='ViewNotes.jsp'>View All Notes</a><h1>");
		}catch(Exception e)
		{
			
		}
		
	}

}
