package com.cssl.service;

import java.util.List;

import com.cssl.pojo.Street;

public interface StreetService {
	List<Street> findById(Integer did);
}
