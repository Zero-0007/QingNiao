package com.cssl.mapper;

import com.cssl.pojo.Users;

public interface UsersMapper {
	Users login(Users user);

	int insertUsers(Users user);
}
