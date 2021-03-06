package com.example.rockalhost.model.band.dao;

import java.util.List;
import java.util.Map;

import com.example.rockalhost.model.band.dto.AllbandDTO;
import com.example.rockalhost.model.band.dto.AllbandViewDTO;
import com.example.rockalhost.model.member.dto.MemberDTO;


public interface AllbandDAO {

	public List<AllbandViewDTO> list(Map<String, Object> map);
	public void apply(AllbandDTO dto) throws Exception;
	public void applyview(String nickName);
	public List<MemberDTO> adminlist(int idx);	
	public List<AllbandViewDTO> applylist();
	public void adminapply(AllbandDTO dto) throws Exception;
	public AllbandViewDTO applyshow(String nickName);
	public AllbandViewDTO mybandview(int b_idx);
	public void mybandupdate(AllbandDTO dto);
	public MemberDTO memberview(String nickName);
	public boolean join_idCheck(String b_name);
	public int bandCount();
	public List<AllbandViewDTO> searchList(String search_option, String keyword);
	public int getCheckNick(String b_leaderNick);
	public List<AllbandViewDTO> deletelist(Map<String, Object> map);	

	
}
