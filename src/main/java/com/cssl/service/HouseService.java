package com.cssl.service;

import com.cssl.pojo.House;
import com.github.pagehelper.Page;

public interface HouseService {
	Page<House> findAll4Page(int pageIndex, int pageSize,String title, Integer did, Integer sid, Integer tid, Integer price, Integer floorage);
	
	int addHouse(House house);
	
	House findById(Integer id);
}
