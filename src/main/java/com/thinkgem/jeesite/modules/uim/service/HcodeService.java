/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.uim.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.uim.entity.Hcode;
import com.thinkgem.jeesite.modules.uim.dao.HcodeDao;

/**
 * H码可视化数据Service
 * @author ycyoes
 * @version 2017-05-18
 */
@Service
@Transactional(readOnly = true)
public class HcodeService extends CrudService<HcodeDao, Hcode> {

	public Hcode get(String id) {
		return super.get(id);
	}
	
	public List<Hcode> findList(Hcode hcode) {
		return super.findList(hcode);
	}
	
	public Page<Hcode> findPage(Page<Hcode> page, Hcode hcode) {
		return super.findPage(page, hcode);
	}
	
	@Transactional(readOnly = false)
	public void save(Hcode hcode) {
		super.save(hcode);
	}
	
	@Transactional(readOnly = false)
	public void delete(Hcode hcode) {
		super.delete(hcode);
	}
	
}