package com.cssl.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cssl.mapper.DistrictMapper;
import com.cssl.mapper.StreetMapper;
import com.cssl.pojo.Street;
import com.cssl.service.StreetService;
import com.cssl.util.MyBatisUtil;

public class StreetServiceImpl implements StreetService {
	SqlSession session = MyBatisUtil.createSqlSession();
	StreetMapper streetMapper = session.getMapper(StreetMapper.class);

	@Override
	public List<Street> findById(Integer did) {
		List<Street> list = streetMapper.findById(did);
		MyBatisUtil.closeSqlSession(); // 关闭SqlSession
		return list;
	}

}
