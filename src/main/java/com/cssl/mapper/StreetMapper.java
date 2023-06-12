package com.cssl.mapper;

import java.util.List;

import com.cssl.pojo.Street;

public interface StreetMapper {
	List<Street> findById(Integer did);
}
