package com.situ.mall.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.sys.mapper.AddrMapper;
import com.situ.mall.sys.model.AddrModel;
import com.situ.util.FmtEmpty;

@Service
public class AddrService {
	
	@Autowired
	private AddrMapper addrMapper;
	
	public String insertByCode(AddrModel model) {
		if (selectModel(model) == null)
			return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
		return "1";
	}
	
	public int insert(AddrModel model) {
		return addrMapper.insert(model);
	}
	
	public String update(AddrModel model) {
		if (addrMapper.updateActive(model) == 1) {
			return "1";
		}
		return "0";
	}
	
	public String delete(AddrModel model) {
		if (addrMapper.delete(model) == 1) {
			return "1";
		}
		return "0";
	}
	
	public AddrModel selectModel(AddrModel model) {
		List<AddrModel> list = selectList(model);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<AddrModel> selectList(AddrModel um) {
		return addrMapper.selectModel(um);
	}

	public int selectCount(AddrModel model) {
		return addrMapper.selectCount(model);
	}

}
