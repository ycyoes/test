/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test1.entity.User1;

/**
 * dengluDAO接口
 * @author zz
 * @version 2015-09-09
 */
@MyBatisDao
public interface User1Dao extends CrudDao<User1> {
	
}