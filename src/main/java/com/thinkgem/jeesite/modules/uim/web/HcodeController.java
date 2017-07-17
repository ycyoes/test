/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.uim.web;

import java.util.List;
import java.util.Map;

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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.uim.entity.Hcode;
import com.thinkgem.jeesite.modules.uim.service.HcodeService;

/**
 * H码可视化数据Controller
 * @author ycyoes
 * @version 2017-05-18
 */
@Controller
@RequestMapping(value = "${adminPath}/uim/hcode")
public class HcodeController extends BaseController {

	@Autowired
	private HcodeService hcodeService;
	
	@ModelAttribute
	public Hcode get(@RequestParam(required=false) String id) {
		Hcode entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hcodeService.get(id);
		}
		if (entity == null){
			entity = new Hcode();
		}
		return entity;
	}
	
	@RequiresPermissions("uim:hcode:view")
	@RequestMapping(value = {"list", ""})
	public String list(Hcode hcode, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Hcode> page = hcodeService.findPage(new Page<Hcode>(request, response), hcode); 
		model.addAttribute("page", page);
		return "modules/uim/hcodeList";
	}

	@RequiresPermissions("uim:hcode:view")
	@RequestMapping(value = "form")
	public String form(Hcode hcode, Model model) {
		model.addAttribute("hcode", hcode);
		return "modules/uim/hcodeForm";
	}

	@RequiresPermissions("uim:hcode:edit")
	@RequestMapping(value = "save")
	public String save(Hcode hcode, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hcode)){
			return form(hcode, model);
		}
		hcodeService.save(hcode);
		addMessage(redirectAttributes, "保存H码可视化数据成功");
		return "redirect:"+Global.getAdminPath()+"/uim/hcode/?repage";
	}
	
	@RequiresPermissions("uim:hcode:edit")
	@RequestMapping(value = "delete")
	public String delete(Hcode hcode, RedirectAttributes redirectAttributes) {
		hcodeService.delete(hcode);
		addMessage(redirectAttributes, "删除H码可视化数据成功");
		return "redirect:"+Global.getAdminPath()+"/uim/hcode/?repage";
	}
	
	@RequestMapping(value = "hcode")
	public String hcodeMap(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/uim/hcode";
	}
	
	@RequestMapping(value = "hprovince")
	public String hcodeProvince(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Hcode> list = hcodeService.findList(new Hcode());
		Hcode hcode = new Hcode();
		String province = "";
		String city = "";
		String segnum = "";
		String pCount = "";
		String cCount = "";
		Map<String, Map<String, String>> pmap = Maps.newHashMap();	//省统计
		Map<String, Map<String, String>> cmap = Maps.newHashMap();	//省统计
		
		Map<String, String> pMap = null;
		Map<String, String> cMap = null;
		Map<String, List<String>> proCity = Maps.newHashMap();
		List<String> lc = null;
		
		
		for (int i = 0; i < list.size(); i++) {
			hcode = list.get(i);
			province = hcode.getProvince();
			city = hcode.getCity();
			pCount = hcode.getPcount();
			cCount = hcode.getCcount();
			segnum = hcode.getSegnum();
			pMap = Maps.newHashMap();
			cMap = Maps.newHashMap();
			lc = Lists.newArrayList();
			
			if (proCity.containsKey(province)) {
				lc = proCity.get(province);
				if (lc.contains(city)) {

				} else {
					lc.add(city);
					proCity.put(province, lc);
				}
			} else {
				lc.add(city);
				proCity.put(province, lc);
			}
			
			//省份统计
			if(pmap.containsKey(province)) {
				pMap = pmap.get(province);
				if (pMap.containsKey(segnum)) {
					pMap.put(segnum, Integer.valueOf(pMap.get(segnum)) + Integer.valueOf(cCount) + "");
				} else {
					pMap.put(segnum, cCount);
				}
			} else {
				pMap.put(segnum, cCount);
			}
			pMap.put("count", pCount);	//省总数
			pmap.put(province, pMap);
			
			
			//地市统计
			if (cmap.containsKey(city)) {
				cMap = cmap.get(city);
				if (cMap.containsKey(segnum)) {
					cMap.put(segnum, Integer.valueOf(cMap.get(segnum)) + Integer.valueOf(cCount) + "");
				} else {
					cMap.put(segnum, cCount);
				}
				
				if (cMap.containsKey("count")) {
					cMap.put("count", Integer.valueOf(cMap.get("count")) + Integer.valueOf(cCount) + "");
				} else {
					cMap.put("count", cCount);
				}
			} else {
				cMap.put(segnum, cCount);
				cMap.put("count", cCount);
			}
			cmap.put(city, cMap);
		}
		
		/*for(Map.Entry mapEntry : pmap.entrySet()) {
			System.out.println("key: " + mapEntry.getKey() + " value: " + mapEntry.getValue());
		}
		
		for(Map.Entry mapEntry : cmap.entrySet()) {
			System.out.println("key: " + mapEntry.getKey() + " value: " + mapEntry.getValue());
		}
		
		for(Map.Entry mapEntry : proCity.entrySet()) {
			System.out.println("key: " + mapEntry.getKey() + " value: " + mapEntry.getValue());
		}*/
		
		model.addAttribute("procity", JsonMapper.toJsonString(proCity));
		model.addAttribute("pdata", JsonMapper.toJsonString(pmap));
		model.addAttribute("cdata", JsonMapper.toJsonString(cmap));
		return "modules/uim/provincecity";
	}

}