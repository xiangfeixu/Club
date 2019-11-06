package com.xd.service;

import java.util.List;

import com.xd.pojo.Club;

public interface ClubService {

	List<Club> findAll();

	int deleteById(Integer id);

	void addClub(Club club);

	Club findById(Integer id);

	void updateById(Club club);

	String[] findClubName();

}
