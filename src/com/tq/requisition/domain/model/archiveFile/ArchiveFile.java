package com.tq.requisition.domain.model.archiveFile;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * �鵵�ļ��ۺϸ�
 * @author jjh
 * @time 2015-12-18 19:13
 */
public class ArchiveFile extends AggregateRoot{
	/**�ĵ�·��*/
	private String filePath;
	/**�ĵ�����*/
	private String fileTypeId;
	/**�ĵ�����*/
	private String title;
}
