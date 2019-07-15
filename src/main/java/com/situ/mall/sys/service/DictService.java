package com.situ.mall.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.sys.mapper.DictMapper;
import com.situ.mall.sys.model.DictModel;
import com.situ.mall.sys.model.UserModel;
import com.situ.util.FmtEmpty;

@Service
public class DictService {

	@Autowired
	private DictMapper dictMapper;

	public String insertByCode(DictModel model) {
		if (selectModel(model) == null)
			return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
		return "1";
	}

	public int insert(DictModel model) {
		return dictMapper.insert(model);
	}

	public String delete(DictModel model) {
		if (dictMapper.delete(model) == 1) {
			return "1";
		}
		return "0";
	}

	public String update(DictModel model) {
		if (dictMapper.updateActive(model) == 1) {
			return "1";
		}
		return "0";
	}

	public DictModel selectModel(DictModel model) {
		DictModel dm = new DictModel();
		dm.setCode(model.getCode());
		List<DictModel> list = selectList(dm);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<DictModel> selectList(DictModel um) {
		return dictMapper.selectModel(um);
	}

	public int selectCount(DictModel model) {
		return dictMapper.selectCount(model);
	}

}
