package com.cssl.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.cssl.service.StreetService;
import com.cssl.service.impl.StreetServiceImpl;

@WebServlet("/StreetServlet")
public class StreetServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		StreetService ss = new StreetServiceImpl();
		PrintWriter out = response.getWriter();

		String didval = request.getParameter("did");
		int did = (didval != null && !didval.isEmpty()) ? Integer.parseInt(didval) : 0;
		String json = JSON.toJSONString(ss.findById(did));
		out.print(json);
		out.flush();
		out.close();
	}

}
