package com.cssl.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cssl.pojo.Users;
import com.cssl.service.UsersService;
import com.cssl.service.impl.UsersServiceImpl;

@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		String param = request.getParameter("param");
		if (param.equals("login")) {
			login(request, response);
		} else if (param.equals("regs")) {
			regs(request, response);
		}
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("password");

		Users users = new Users();
		users.setName(name);
		users.setPassword(pwd);

		UsersService us = new UsersServiceImpl();
		Users user = us.login(users);
		PrintWriter out = response.getWriter();
		int uid = user.getUid();
		if (user != null) {
			out.write("<script>");
			out.write("alert('登录成功！');");
			if (uid == 1) {
				out.write("location.href='guanli.jsp';");
				request.getSession().setAttribute("user", user);
			} else {
				out.write("location.href='list.jsp';");
			}
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('账号或密码错误！');");
			out.write("location.href='login.jsp';");
			out.write("</script>");
		}
	}

	protected void regs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("password");
		String phone = request.getParameter("telephone");
		String username = request.getParameter("username");
		Users users = new Users();
		users.setName(name);
		users.setTelephone(phone);
		users.setPassword(pwd);
		users.setUsername(username);
		PrintWriter out = response.getWriter();

		UsersService us = new UsersServiceImpl();
		int num = us.insertUsers(users);
		if (num > 0) {
			out.write("<script>");
			out.write("alert('注册成功！');");
			out.write("location.href='login.jsp';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('注册失败！');");
			out.write("location.href='regs.jsp';");
			out.write("</script>");
		}
	}
}
