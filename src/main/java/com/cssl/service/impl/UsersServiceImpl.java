package com.cssl.service.impl;

import org.apache.ibatis.session.SqlSession;

import com.cssl.mapper.UsersMapper;
import com.cssl.pojo.Users;
import com.cssl.service.UsersService;
import com.cssl.util.MyBatisUtil;

public class UsersServiceImpl implements UsersService {
	private SqlSession session = MyBatisUtil.createSqlSession();
	private UsersMapper usersMapper = session.getMapper(UsersMapper.class);

	@Override
	public Users login(Users user) {
		Users users = usersMapper.login(user);
		MyBatisUtil.closeSqlSession(); // 关闭SqlSession
		return users;
	}

	@Override
	public int insertUsers(Users user) {
		int rows = -1;

		try {
			rows = usersMapper.insertUsers(user);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			MyBatisUtil.closeSqlSession();
		}
		return rows;
	}
}
