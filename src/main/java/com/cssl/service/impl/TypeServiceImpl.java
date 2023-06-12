package com.cssl.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cssl.mapper.TypeMapper;
import com.cssl.pojo.Type;
import com.cssl.service.TypeService;
import com.cssl.util.MyBatisUtil;

public class TypeServiceImpl implements TypeService {
	SqlSession session = MyBatisUtil.createSqlSession();
	TypeMapper typeMapper = session.getMapper(TypeMapper.class);

	@Override
	public List<Type> findAll() {
		List<Type> list = typeMapper.findAll();
		MyBatisUtil.closeSqlSession(); // 关闭SqlSession
		return list;
	}

}
