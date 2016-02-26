package com.tq.requisition.presentation.dto.sysMgt;

import java.util.UUID;

/**
 * ��ԴDTO
 * 
 * @author Bless
 * @time 2015-12-24 15:36
 */
public class ResDto {
	private UUID id;
	private String name;
	private String link;
	private UUID pId;
	private String htmlId;
	private String html;
	private Integer order;
	private int hierarchy;
	private Integer type;
	private String path;
	
	/**
	 * ��ȡ��Դ���Ƚڵ�����
	 * @return
	 */
	public String getPath() {
		return path;
	}
	
	/**
	 * ������Դ���Ƚڵ�����
	 * @return
	 */

	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * ��ȡ��Դ����
	 * 
	 * @return ��Դ����
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * ������Դ����
	 * 
	 * @param type
	 *            ��Դ����
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * ��ȡ�㼶
	 * 
	 * @return �㼶
	 */
	public int getHierarchy() {
		return hierarchy;
	}

	/**
	 * ���ò㼶
	 * 
	 * @param hierarchy
	 *            �㼶
	 */
	public void setHierarchy(int hierarchy) {
		this.hierarchy = hierarchy;
	}

	/**
	 * ��ȡ��Դ��ʶ
	 * 
	 * @return ��Դ��ʶ
	 */
	public UUID getId() {
		return id;
	}

	/**
	 * д����Դ��ʶ
	 * 
	 * @param id
	 *            ��Դ��ʶ
	 */
	public void setId(UUID id) {
		this.id = id;
	}

	/**
	 * ��ȡ��Դ����
	 * 
	 * @return ��Դ����
	 */
	public String getName() {
		return name;
	}

	/**
	 * д����Դ����
	 * 
	 * @param name
	 *            ��Դ����
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * ��ȡ��Դ����
	 * 
	 * @return ��Դ����
	 */
	public String getLink() {
		return link;
	}

	/**
	 * д����Դ����
	 * 
	 * @param link
	 *            ��Դ����
	 */
	public void setLink(String link) {
		this.link = link;
	}

	/**
	 * ��ȡ��Դ����ʶ
	 * 
	 * @return ��Դ����ʶ
	 */
	public UUID getpId() {
		return pId;
	}

	/**
	 * д����Դ����ʶ
	 * 
	 * @param pId
	 *            ��Դ����ʶ
	 */
	public void setpId(UUID pId) {
		this.pId = pId;
	}

	/**
	 * ��ȡ��ԴHtml��ʶ
	 * 
	 * @return ��ԴHtml��ʶ
	 */
	public String getHtmlId() {
		return htmlId;
	}

	/**
	 * д����ԴHtml��ʶ
	 * 
	 * @param htmlId
	 *            ��ԴHtml��ʶ
	 */
	public void setHtmlId(String htmlId) {
		this.htmlId = htmlId;
	}

	/**
	 * ��ȡHtml��Դ
	 * 
	 * @return Html��Դ
	 */
	public String getHtml() {
		return html;
	}

	/**
	 * д��Html��Դ
	 * 
	 * @param html
	 *            Html��Դ
	 */
	public void setHtml(String html) {
		this.html = html;
	}

	/**
	 * ��ȡ��Դ����
	 * 
	 * @return ��Դ����
	 */
	public Integer getOrder() {
		return order;
	}

	/**
	 * д����Դ����
	 * 
	 * @param order
	 *            ��Դ����
	 */
	public void setOrder(Integer order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "ResDto [id=" + id + ", name=" + name + ", link=" + link
				+ ", pId=" + pId + ", htmlId=" + htmlId + ", html=" + html
				+ ", order=" + order + ", hierarchy=" + hierarchy + "]";
	}

	public ResDto(UUID id, String name, String link, UUID pId, String htmlId,
			String html, int order, int hierarchy,Integer type,String path) {
		super();
		this.id = id;
		this.name = name;
		this.link = link;
		this.pId = pId;
		this.htmlId = htmlId;
		this.html = html;
		this.order = order;
		this.hierarchy = hierarchy;
		this.type = type;
		this.path = path;
	}
	
	public ResDto(){}
	
	/*public methods*/
	public static ResDto obtain(//
			UUID _id,String _name,String _link,UUID _pid,String _htmlid,//
			String _html,Integer _order,Integer _hierarchy,Integer _type,//
			String _path
			){
			
		return new ResDto(//
				_id,//
				_name, //
				_link, //
				_pid, //
				_htmlid, //
				_html, //
				_order,//
				_hierarchy, //
				_type,//
				_path);
	}

}
