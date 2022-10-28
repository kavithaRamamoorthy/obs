package com.sm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sm.api.Student;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<Student> studentList = new ArrayList<Student>();

		Student s1 = new Student("Arun", "s1", "dep1", 35);
		studentList.add(s1);
		Student s2 = new Student("kareen", "s2", "dep1", 70);
		studentList.add(s2);
		Student s3 = new Student("Laya", "s3", "dep1", 60);
		studentList.add(s3);
		Student s4 = new Student("Lim", "s4", "dep1", 90);
		studentList.add(s4);
		Student s5 = new Student("Maya", "s5", "dep2", 30);
		studentList.add(s5);
		Student s6 = new Student("Peter", "s6", "dep3", 32);
		studentList.add(s6);
		Student s7 = new Student("Sara", "s7", "dep3", 70);
		studentList.add(s7);
		Student s8 = new Student("Harry", "s8", "dep3", 20);
		studentList.add(s8);
		String username = request.getParameter("userId");
		String password = request.getParameter("password");

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			if (username.equals("super_user") && password.equals("studpage")) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				request.setAttribute("students", studentList);
				RequestDispatcher rd = request.getRequestDispatcher("student-list.jsp");
				rd.forward(request, response);
			} else
				response.sendRedirect("login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
