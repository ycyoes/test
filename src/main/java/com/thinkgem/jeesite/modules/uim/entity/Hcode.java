/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.uim.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * H码可视化数据Entity
 * @author ycyoes
 * @version 2017-05-18
 */
public class Hcode extends DataEntity<Hcode> {
	
	private static final long serialVersionUID = 1L;
	private String province;		// 省份
	private String city;		// 城市
	private String segnum;		// 号段
	private String pcount;		// 省号段总数
	private String ccount;		// 地市号段总数
	
	public Hcode() {
		super();
	}

	public Hcode(String id){
		super(id);
	}

	@Length(min=0, max=20, message="省份长度必须介于 0 和 20 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	@Length(min=0, max=30, message="城市长度必须介于 0 和 30 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=0, max=10, message="号段长度必须介于 0 和 10 之间")
	public String getSegnum() {
		return segnum;
	}

	public void setSegnum(String segnum) {
		this.segnum = segnum;
	}
	
	@Length(min=0, max=10, message="省号段总数长度必须介于 0 和 10 之间")
	public String getPcount() {
		return pcount;
	}

	public void setPcount(String pcount) {
		this.pcount = pcount;
	}
	
	@Length(min=0, max=10, message="地市号段总数长度必须介于 0 和 10 之间")
	public String getCcount() {
		return ccount;
	}

	public void setCcount(String ccount) {
		this.ccount = ccount;
	}
	
}