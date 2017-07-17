/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.test1.entity.User1;
import com.thinkgem.jeesite.modules.test1.service.User1Service;

/**
 * dengluController
 * @author zz
 * @version 2015-09-09
 */
@Controller
@RequestMapping(value = "${adminPath}/test1/user1")
public class User1Controller extends BaseController {

	@Autowired
	private User1Service user1Service;
	
	@ModelAttribute
	public User1 get(@RequestParam(required=false) String id) {
		User1 entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = user1Service.get(id);
		}
		if (entity == null){
			entity = new User1();
		}
		return entity;
	}
	
	@RequiresPermissions("test1:user1:view")
	@RequestMapping(value = {"list", ""})
	public String list(User1 user1, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User1> page = user1Service.findPage(new Page<User1>(request, response), user1); 
		model.addAttribute("page", page);
		return "modules/test1/user1List";
	}

	@RequiresPermissions("test1:user1:view")
	@RequestMapping(value = "form")
	public String form(User1 user1, Model model) {
		model.addAttribute("user1", user1);
		return "modules/test1/user1Form";
	}

	@RequiresPermissions("test1:user1:edit")
	@RequestMapping(value = "save")
	public String save(User1 user1, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, user1)){
			return form(user1, model);
		}
		user1Service.save(user1);
		addMessage(redirectAttributes, "保存curd成功");
		return "redirect:"+Global.getAdminPath()+"/test1/user1/?repage";
	}
	
	@RequiresPermissions("test1:user1:edit")
	@RequestMapping(value = "delete")
	public String delete(User1 user1, RedirectAttributes redirectAttributes) {
		user1Service.delete(user1);
		addMessage(redirectAttributes, "删除curd成功");
		return "redirect:"+Global.getAdminPath()+"/test1/user1/?repage";
	}

}