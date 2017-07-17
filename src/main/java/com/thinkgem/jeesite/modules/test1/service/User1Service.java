/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test1.entity.User1;
import com.thinkgem.jeesite.modules.test1.dao.User1Dao;

/**
 * dengluService
 * @author zz
 * @version 2015-09-09
 */
@Service
@Transactional(readOnly = true)
public class User1Service extends CrudService<User1Dao, User1> {

	public User1 get(String id) {
		return super.get(id);
	}
	
	public List<User1> findList(User1 user1) {
		return super.findList(user1);
	}
	
	public Page<User1> findPage(Page<User1> page, User1 user1) {
		return super.findPage(page, user1);
	}
	
	@Transactional(readOnly = false)
	public void save(User1 user1) {
		super.save(user1);
	}
	
	@Transactional(readOnly = false)
	public void delete(User1 user1) {
		super.delete(user1);
	}
	
}