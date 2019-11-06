package com.xd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.xd.pojo.Type;

@Mapper
public interface TypeMapper {

	List<Type> findAll();

}
