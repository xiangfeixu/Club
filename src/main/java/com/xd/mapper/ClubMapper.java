package com.xd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xd.pojo.Club;

@Mapper
public interface ClubMapper extends BaseMapper<Club>{

	List<Club> findAll();

	int updateById(Club club);

	int selectMemberById(Integer id);

	String[] selectClubName();

	

	

}
