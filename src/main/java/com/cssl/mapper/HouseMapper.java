package com.cssl.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cssl.pojo.House;

public interface HouseMapper {
	List<House> findAll4Page(@Param("title") String title, @Param("did") Integer did, @Param("sid") Integer sid,
			@Param("tid") Integer tid, @Param("price") Integer price, @Param("floorage") Integer floorage);

	int addHouse(House house);

	House findById(@Param("id") Integer id);
}
