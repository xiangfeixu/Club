package com.xd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xd.mapper.ClubMapper;
import com.xd.pojo.Club;
@Service
public class ClubServiceImpl implements ClubService{

	@Autowired
	private ClubMapper clubMapper;
	@Override
	public List<Club> findAll() {
		List<Club> clubList=clubMapper.findAll();
		return clubList;
	}
	@Override
	public int deleteById(Integer id) {
		int rows=clubMapper.selectMemberById(id);
		System.out.println("rows=  "+rows);
		if(rows==0) {  //如果俱乐部会员数为0，允许删除
		clubMapper.deleteById(id);
		}else {
			return 0;
		}
		return rows;					
	}
	@Override
	public void addClub(Club club) {	
	clubMapper.insert(club);			
	}
	@Override
	public Club findById(Integer id) {
		Club club=clubMapper.selectById(id);
		return club;
	}
	@Override
	public void updateById(Club club) {
		clubMapper.updateById(club);
		
	}
	//找出所有俱乐部名称并返回
	@Override
	public String[] findClubName() {
		String[] names=clubMapper.selectClubName();
		return names;
	}

}
