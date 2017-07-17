package com.thinkgem.jeesite.modules.uim.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.modules.uim.entity.TaskOrder;

/**
 * 任务单明细Controller
 * @author ycyoes
 * @version 2017-07-04
 */
@Controller
@RequestMapping(value = "${adminPath}/uim/taskorder")
public class TaskOrderController {
	
	@RequestMapping(value = "list")
	public String list(TaskOrder taskOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/uim/taskOrderList";
	}
}
