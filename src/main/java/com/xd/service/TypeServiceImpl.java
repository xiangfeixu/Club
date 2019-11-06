package com.xd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xd.mapper.TypeMapper;
import com.xd.pojo.Type;
@Service
public class TypeServiceImpl implements TypeService{

	@Autowired
	private TypeMapper typeMapper;
	@Override
	public List<Type> findAll() {
		List<Type> typeList=typeMapper.findAll();
		return typeList;
	}

}
