package com.tq.requisition.infrastructure.Repository.department;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.department.Department;
import com.tq.requisition.domain.model.department.IDepartmentRepository;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.InvalidOperationException;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.deptMgt.DeptMgtNameExistsSpecification;

/**
 * ���žۺϲִ�
 * @author jjh
 * @time 2015-12-21 16��38
 */
public class DepartmentRepository extends HbRepository<Department> implements IDepartmentRepository{
	public DepartmentRepository(IRepositoryContext context) {
		super(context);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public boolean isDeptNameUnique(UUID orgId, String deptName) {
		// TODO Auto-generated method stub
		return false;
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Department createDept(Department dept) throws InvalidOperationException{
		boolean r = exists(new DeptMgtNameExistsSpecification(Department.class, dept));
		if(r)
		{
			throw new InvalidOperationException("����֯���Ѿ�������Ϊ["+dept.getDeptName()+"]�Ĳ������ƣ�������һ��");
		}
		Department department = Department.obtain(dept.getDeptName(), dept.getOrgId());
		add(department);
		return department;
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public void modifyDept(Department dept) throws DomainException {
		if(dept == null)
		{
			throw new NullPointerException("�������Ĳ���ʵ��Ϊnull");
		}
		Department _dept = getByKey(Department.class, dept.getId());
		if(_dept == null)
		{
			throw new NullPointerException("Ҫ�޸ĵĲ��Ų����ڣ�����ʵ��Ϊnull");
		}
		_dept.modify(dept);
		update(_dept);	
	}

	@Override
	public List<Department> getDeptByOrgId(final UUID orgId) {
		if(orgId == null)
		{
			throw new NullPointerException("��֯idΪnull");
		}
		List<Department> deptList = getAll(new SpecificationExt<Department>(Department.class) {
			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select * from tb_dept where org_id=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{orgId.toString()};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
			
		});
		return deptList;
	}
	
	@Override
	public void removeDept(UUID deptId) {
		if(deptId == null)
		{
			throw new NullPointerException("����idΪnull");
		}
		removeByKey(Department.class, deptId);
	}

}
