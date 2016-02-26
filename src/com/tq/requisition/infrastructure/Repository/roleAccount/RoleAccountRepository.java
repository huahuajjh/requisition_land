package com.tq.requisition.infrastructure.Repository.roleAccount;

import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.NotImplementedException;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.model.role.Role;
import com.tq.requisition.domain.model.roleAccount.IRoleAccountRepository;
import com.tq.requisition.domain.model.roleAccount.RoleAccount;
import com.tq.requisition.exception.InvalidOperationException;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.accountRole.ExistsUserAndRoleSpecification;

/**
 * ��ɫ�û���ϵ�ִ�ʵ��
 * @author jjh
 * @time 2015-12-21 17:33
 */
public class RoleAccountRepository  extends HbRepository<RoleAccount> implements IRoleAccountRepository{

	public RoleAccountRepository(IRepositoryContext context) {
		super(context);
	}

	@Override
	public Role getRoleByUid(UUID uId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Account> getUsersByRid(UUID rId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void createRelationship(UUID uid, UUID rId) {
		boolean r = exists(new ExistsUserAndRoleSpecification(RoleAccount.class,uid,rId));
		if(r)
		{
			throw new InvalidOperationException("���˻���Ӧ�Ľ�ɫ��ϵ�Ѿ����ڣ������ظ����");
		}
		RoleAccount ra = RoleAccount.obtain(uid, rId);
		add(ra);		
	}

	@Override
	public void removeRelationship(final UUID uid,final UUID rId) {
		boolean r = exists(new ExistsUserAndRoleSpecification(RoleAccount.class,uid,rId));
		if(!r)
		{
			throw new InvalidOperationException("���˻���Ӧ�Ľ�ɫ��ϵ������");
		}
		List<RoleAccount> list = getAll(new SpecificationExt<RoleAccount>(RoleAccount.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select * from tb_role_account where account_id=? and role_id=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{uid,rId};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		
		if(list==null)
		{
			throw new NullPointerException("δ��ѯ���˻����ɫ�Ķ�Ӧ��ϵ��null");
		}
		RoleAccount ra = list.get(0);
		removeByKey(RoleAccount.class, ra.getId());
	}

	@Override
	public void removeAllRelationships(final UUID uid) {
		executeUpdate(new SpecificationExt<RoleAccount>(RoleAccount.class) {
			@Override
			public String getAbsHql() {
				throw new NotImplementedException("δʹ��hql���ʽ����ʵ�ֵķ���getAbsHql()");
			}
			@Override
			public String getAbsSql() {
				return "delete from tb_role_account where account_id=?";
			}
			@Override
			public Object[] getAbsParameters() {
				return new Object[]{uid.toString()};
			}
			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
	}


	@Override
	public void changeRole(UUID uid, UUID roleid) {
		
	}
}
