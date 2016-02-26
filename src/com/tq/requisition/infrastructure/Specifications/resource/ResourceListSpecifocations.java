package com.tq.requisition.infrastructure.Specifications.resource;

import java.util.UUID;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.model.resource.Resource;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;

public class ResourceListSpecifocations extends Specification<Resource> {

	private String resIds = "";
	private int hierarchy = -1;

	public ResourceListSpecifocations(Class<Resource> _t,int hierarchy, UUID... resIds) {
		super(_t);
		this.hierarchy = hierarchy;
		if (resIds != null && resIds.length > 0) {
			for (int i = 0; i < resIds.length; i++) {
				this.resIds = "\"" + resIds[i].toString() + "\",";
			}
			this.resIds = this.resIds.substring(0, resIds.length - 1);
		}
	}

	/**
	 * ��ȡhql���ʽ
	 * 
	 * @return IHqlExpression hql���ʽʵ��
	 */
	@Override
	public IHqlExpression getHqlExpression() {
		HqlExpression hqlExpression = new HqlExpression();
		hqlExpression.setSql("select * from tb_resource where id in (" + resIds + ") and ");
		return hqlExpression;
	}

}
