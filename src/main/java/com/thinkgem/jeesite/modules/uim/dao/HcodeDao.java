/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.uim.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.uim.entity.Hcode;

/**
 * H码可视化数据DAO接口
 * @author ycyoes
 * @version 2017-05-18
 */
@MyBatisDao
public interface HcodeDao extends CrudDao<Hcode> {
	
}