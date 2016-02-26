package com.tq.requisition.infrastructure.utils;

/**
 * ��ҳ��������࣬����ҳ���ҳü
 * @author jjh
 * @time 2015-12-25 20:01
 * 
 */
public final class PageHelper {
	private PageHelper(){}
	
	/**
	 * �����ҳ����
	 * @param pageStart
	 * 		��ʼҳ����
	 * @param pageNum
	 * 		ҳ��
	 * @return �������ݿ���ʵ��¼����
	 */
	public static int getPageIndex(int pageStart,int pageNum) {
		return (pageStart-1)*pageNum;
	}
}
