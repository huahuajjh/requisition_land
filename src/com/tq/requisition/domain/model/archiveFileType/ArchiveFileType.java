package com.tq.requisition.domain.model.archiveFileType;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * �鵵�ļ����;ۺϸ�
 * @author jjh
 * @time 2015-12-18 19:15
 */
public class ArchiveFileType extends AggregateRoot{
	/**��������*/
	private String typeName;
	/**������*/
	private ArchiveFileType parentType;
}
