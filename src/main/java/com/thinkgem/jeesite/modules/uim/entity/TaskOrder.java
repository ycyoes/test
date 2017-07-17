package com.thinkgem.jeesite.modules.uim.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TaskOrder {
	private String taskNum; // 任务单号
	private String count; // 任务单数量
	private String spName; // 卡商名称
	private String makeCardType; // 制卡类型
	private String province; // 省份
	private Date completeTime; // 完成时间
	private String taskDetailNum; // 任务单明细号
	private String orderNum; // 任务单号
	private String standardPackage; // 标包
	private String city; // 地市
	private String cardProductType; // 卡产品类型
	private String cardBusinessType; // 卡业务类型
	private String cardType; // 卡类型
	private String functionType; // 功能类型
	private String hlr; // hlr
	private String needCount; // 需求数量
	private String makeCount; // 制卡数量
	private String ndc; // ndc
	private String mdn; // mdn
	private String uimid; // uimid
	private Date completeTimeDetail; // 任务单明细对应完成时间
	private String deliveryAddress; // 收货地址
	private String encapsulationBrochure; // 封装宣传册
	private String printUserPhone; // 打印用户电话
	private String phoneAndFile; // 电话号码段/文件
	private String sid; // sid
	private String nid; // nid
	private String repealStatus; // 已申请撤单
	private String imsiStatus; // 是否制定IMSI
	private String gOperator; // G运营商
	private String iccidStart; // ICCID起始号
	private String iccidEnd; // ICCID终止号
	private String seqNumStart; // 空卡序列号起始号
	private String seqNumEnd; // 空卡序列号终止号
	private String orderStatus; // 订单状态
	private String logisticsNum; // 物流单号
	private String isDelaySend; // 是否延迟发货
	private Date createTime; // 任务单生成时间
	private Date recordTime; // 该条记录插入时间

	public String getTaskNum() {
		return taskNum;
	}

	public void setTaskNum(String taskNum) {
		this.taskNum = taskNum;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getMakeCardType() {
		return makeCardType;
	}

	public void setMakeCardType(String makeCardType) {
		this.makeCardType = makeCardType;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	public String getTaskDetailNum() {
		return taskDetailNum;
	}

	public void setTaskDetailNum(String taskDetailNum) {
		this.taskDetailNum = taskDetailNum;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getStandardPackage() {
		return standardPackage;
	}

	public void setStandardPackage(String standardPackage) {
		this.standardPackage = standardPackage;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCardProductType() {
		return cardProductType;
	}

	public void setCardProductType(String cardProductType) {
		this.cardProductType = cardProductType;
	}

	public String getCardBusinessType() {
		return cardBusinessType;
	}

	public void setCardBusinessType(String cardBusinessType) {
		this.cardBusinessType = cardBusinessType;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getFunctionType() {
		return functionType;
	}

	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}

	public String getHlr() {
		return hlr;
	}

	public void setHlr(String hlr) {
		this.hlr = hlr;
	}

	public String getNeedCount() {
		return needCount;
	}

	public void setNeedCount(String needCount) {
		this.needCount = needCount;
	}

	public String getMakeCount() {
		return makeCount;
	}

	public void setMakeCount(String makeCount) {
		this.makeCount = makeCount;
	}

	public String getNdc() {
		return ndc;
	}

	public void setNdc(String ndc) {
		this.ndc = ndc;
	}

	public String getMdn() {
		return mdn;
	}

	public void setMdn(String mdn) {
		this.mdn = mdn;
	}

	public String getUimid() {
		return uimid;
	}

	public void setUimid(String uimid) {
		this.uimid = uimid;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCompleteTimeDetail() {
		return completeTimeDetail;
	}

	public void setCompleteTimeDetail(Date completeTimeDetail) {
		this.completeTimeDetail = completeTimeDetail;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getEncapsulationBrochure() {
		return encapsulationBrochure;
	}

	public void setEncapsulationBrochure(String encapsulationBrochure) {
		this.encapsulationBrochure = encapsulationBrochure;
	}

	public String getPrintUserPhone() {
		return printUserPhone;
	}

	public void setPrintUserPhone(String printUserPhone) {
		this.printUserPhone = printUserPhone;
	}

	public String getPhoneAndFile() {
		return phoneAndFile;
	}

	public void setPhoneAndFile(String phoneAndFile) {
		this.phoneAndFile = phoneAndFile;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getRepealStatus() {
		return repealStatus;
	}

	public void setRepealStatus(String repealStatus) {
		this.repealStatus = repealStatus;
	}

	public String getImsiStatus() {
		return imsiStatus;
	}

	public void setImsiStatus(String imsiStatus) {
		this.imsiStatus = imsiStatus;
	}

	public String getgOperator() {
		return gOperator;
	}

	public void setgOperator(String gOperator) {
		this.gOperator = gOperator;
	}

	public String getIccidStart() {
		return iccidStart;
	}

	public void setIccidStart(String iccidStart) {
		this.iccidStart = iccidStart;
	}

	public String getIccidEnd() {
		return iccidEnd;
	}

	public void setIccidEnd(String iccidEnd) {
		this.iccidEnd = iccidEnd;
	}

	public String getSeqNumStart() {
		return seqNumStart;
	}

	public void setSeqNumStart(String seqNumStart) {
		this.seqNumStart = seqNumStart;
	}

	public String getSeqNumEnd() {
		return seqNumEnd;
	}

	public void setSeqNumEnd(String seqNumEnd) {
		this.seqNumEnd = seqNumEnd;
	}
	
	

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}

	public String getLogisticsNum() {
		return logisticsNum;
	}

	public void setLogisticsNum(String logisticsNum) {
		this.logisticsNum = logisticsNum;
	}

	public String getIsDelaySend() {
		return isDelaySend;
	}

	public void setIsDelaySend(String isDelaySend) {
		this.isDelaySend = isDelaySend;
	}
	

}
