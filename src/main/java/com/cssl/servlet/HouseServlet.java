package com.cssl.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.alibaba.fastjson.JSON;
import com.cssl.pojo.House;
import com.cssl.service.HouseService;
import com.cssl.service.impl.HouseServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@WebServlet("/HouseServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class HouseServlet extends HttpServlet {
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
		if (param.equals("find")) {
			find(request, response);
		} else if (param.equals("add")) {
			add(request, response);
		} else if (param.equals("findById")) {
			findById(request, response);
		}
	}

	protected void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HouseService hs = new HouseServiceImpl();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		String title = request.getParameter("title");
		String didval = request.getParameter("did");
		String sidval = request.getParameter("sid");
		String tidval = request.getParameter("tid");
		String priceval = request.getParameter("price");
		String floorageval = request.getParameter("floorage");

		int did = (didval != null && !didval.isEmpty()) ? Integer.parseInt(didval) : 0;
		int sid = (sidval != null && !sidval.isEmpty()) ? Integer.parseInt(sidval) : 0;
		int tid = (tidval != null && !tidval.isEmpty()) ? Integer.parseInt(tidval) : 0;
		int price = 0;
		if (priceval != null && priceval.equals("0-1000")) {
			price = 1;
		} else if (priceval != null && priceval.equals("1000-3000")) {
			price = 2;
		} else if (priceval != null && priceval.equals("3000-1000000")) {
			price = 3;
		}

		int floorage = 0;
		if (floorageval != null && floorageval.equals("0-100")) {
			floorage = 1;
		} else if (floorageval != null && floorageval.equals("100-500")) {
			floorage = 2;
		} else if (floorageval != null && floorageval.equals("500-1000000")) {
			floorage = 3;
		}
		// int price = (priceval != null && !priceval.isEmpty()) ?
		// Integer.parseInt(priceval) : 0;
		// int floorage = (floorageval != null && !floorageval.isEmpty()) ?
		// Integer.parseInt(floorageval) : 0;
		Page<House> findAll4Page = hs.findAll4Page(pageNum, 5, title, did, sid, tid, price, floorage);

		// 获取分页信息
		PageInfo<House> pageInfo = new PageInfo<>(findAll4Page);
		int totalPages = pageInfo.getPages(); // 总页数
		int currentPage = pageInfo.getPageNum(); // 当前页码

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", findAll4Page);
		resultMap.put("totalPages", totalPages);
		resultMap.put("currentPage", currentPage);

		String json = JSON.toJSONString(resultMap);
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}

	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HouseService hs = new HouseServiceImpl();
		PrintWriter out = response.getWriter();
		// 获取表单字段的值
		String uid = request.getParameter("user");
		String title = request.getParameter("title");
		String type = request.getParameter("type_id");
		String floorage = request.getParameter("floorage");
		String price = request.getParameter("price");
		String houseDate = request.getParameter("houseDate");
		String district_id = request.getParameter("district_id");
		String street_id = request.getParameter("street_id");
		String contact = request.getParameter("contact");
		String description = request.getParameter("description");

		// 1.获取的文件
		Part part = request.getPart("file");
		// 2.获取服务器路径
		String path = request.getServletContext().getRealPath("files/");
		// 3.上传
		// 获取文件的格式
		String type2 = part.getContentType();
		String[] types = { "image/png", "image/jpeg", "image/gif" };
		List<String> list = Arrays.asList(types);
		String file_name = "";
		// 存不存在
		if (list.contains(type2)) {
			// 获取图片的名字
			// 产生一个32位的随机数
			String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
			file_name = uuid + part.getSubmittedFileName();
			// 上传
			part.write(path + File.separator + file_name);
		}
		House house = new House();
		house.setStreet_id(Integer.parseInt(street_id));
		house.setUser_id(Integer.parseInt(uid));
		house.setType_id(Integer.parseInt(type));
		house.setTitle(title);
		house.setDescript(description);
		house.setPrice(Integer.parseInt(price));
		house.setPubdate(java.sql.Date.valueOf(houseDate));
		house.setFloorage(Integer.parseInt(floorage));
		house.setContant(contact);
		house.setImage(file_name);
		int num = hs.addHouse(house);
		if (num > 0) {
			out.write("<script>");
			out.write("alert('添加成功！');");
			out.write("location.href='guanli.jsp';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('添加失败！');");
			out.write("location.href='fabu.jsp';");
			out.write("</script>");
		}
	}

	protected void findById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HouseService hs = new HouseServiceImpl();
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		House house = hs.findById(Integer.parseInt(id));
		String json = JSON.toJSONStringWithDateFormat(house,"yyyy-MM-dd HH:mm:ss.S");
		out.println(json);
		out.flush();
		out.close();
	}
}
