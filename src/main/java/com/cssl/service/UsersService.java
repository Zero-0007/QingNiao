package com.cssl.service;

import com.cssl.pojo.Users;

public interface UsersService {
	Users login(Users user);

	int insertUsers(Users user);
}
