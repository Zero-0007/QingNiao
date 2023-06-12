package com.cssl.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cssl.mapper.DistrictMapper;
import com.cssl.pojo.District;
import com.cssl.service.DistrictService;
import com.cssl.util.MyBatisUtil;

public class DistrictServiceImpl implements DistrictService {
	SqlSession session = MyBatisUtil.createSqlSession();
	DistrictMapper districtMapper = session.getMapper(DistrictMapper.class);

	@Override
	public List<District> findAll() {
		List<District> list = districtMapper.findAll();
		MyBatisUtil.closeSqlSession(); // 关闭SqlSession
		return list;
	}

}
