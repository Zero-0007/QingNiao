package com.cssl.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cssl.mapper.HouseMapper;
import com.cssl.pojo.House;
import com.cssl.service.HouseService;
import com.cssl.util.MyBatisUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

public class HouseServiceImpl implements HouseService {
	SqlSession session = MyBatisUtil.createSqlSession();
	HouseMapper houseMapper = session.getMapper(HouseMapper.class);

	@Override
	public Page<House> findAll4Page(int pageIndex, int pageSize, String title, Integer did, Integer sid, Integer tid,
			Integer price, Integer floorage) {
		// 调用分页插件的分页方法
		Page<House> page = PageHelper.startPage(pageIndex, pageSize, "id desc");
		// 调用dao层查询方法
		List<House> list = houseMapper.findAll4Page(title, did, sid, tid, price, floorage);
		System.out.println("总记录数：" + page.getTotal());
		System.out.println("总页数：" + page.getPages());
		System.out.println("当前页码：" + page.getPageNum());
		System.out.println("每页容量：" + page.getPageSize());
		List<House> result = page.getResult();
		System.out.println("**************************");
		for (House house : result) {
			System.out.println(house);
		}
		System.out.println("***************************");
		System.out.println("page:" + page);

		return page;
	}

	@Override
	public int addHouse(House house) {
		int rows = -1;

		try {
			rows = houseMapper.addHouse(house);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			MyBatisUtil.closeSqlSession();
		}
		return rows;
	}

	@Override
	public House findById(Integer id) {
		House house = houseMapper.findById(id);
		return house;
	}
}
