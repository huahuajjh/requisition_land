package com.tq.requisition.infrastructure.Repository.HPT;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.housePuraseTicket.HPTExchangeInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTMendInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTProviderInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTReportOfLossInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTUseAndCash;
import com.tq.requisition.domain.model.housePuraseTicket.HousePuraseTicket;
import com.tq.requisition.domain.model.housePuraseTicket.IHPTRepository;
import com.tq.requisition.domain.model.removeFamily.Family;
import com.tq.requisition.domain.model.share.TicketState;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTProvideCountSpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTProvideTableSpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTQueryByIdNumSpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTQueryFmlProvideSpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTUseCountSpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTUseQuerySpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HPTUseTableSpecification;
import com.tq.requisition.infrastructure.Specifications.hpt.HptUseTotalCountSpecification;
import com.tq.requisition.infrastructure.Specifications.removeFamily.FmlBasicInfoSpecification;
import com.tq.requisition.infrastructure.Specifications.removeFamily.FmlTotalCountSpecification;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.infrastructure.utils.PageHelper;
import com.tq.requisition.presentation.dto.hpt.HPTDisplayDto;
import com.tq.requisition.presentation.dto.hpt.HPTDisplayFmlDto;
import com.tq.requisition.presentation.dto.hpt.HPTFuzzyQueryModel;
import com.tq.requisition.presentation.dto.hpt.HPTQueryModel;
import com.tq.requisition.presentation.dto.hpt.HPTReceiveTableDto;
import com.tq.requisition.presentation.dto.hpt.HPTUseTableDto;
import com.tq.requisition.presentation.dto.hpt.HptUseAndCashQueryModel;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyBasicInfoDto;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ����ȯ�ִ�ʵ��
 * @author jjh
 * @time 2015-01-01 10:37
 */
public class HPTRepository extends HbRepository<HousePuraseTicket> implements IHPTRepository{

	public HPTRepository(IRepositoryContext context) {
		super(context);
	}

	@Override
	public void addHPT(final HousePuraseTicket hpt) throws DomainException {
		if(null == hpt)
		{
			throw new NullPointerException("�����Ĺ���ȯ��ϢΪ��");
		}
		//����ظ����
		int count = getTotalCount(new SpecificationExt<HousePuraseTicket>(HousePuraseTicket.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select count(1) from tb_housepurchase_ticket where is_del=0 and id_number=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{hpt.getIdNumber()};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		boolean state = exists(new SpecificationExt<HousePuraseTicket>(HousePuraseTicket.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select count(1) from tb_housepurchase_ticket where is_del=0 and id_number=? and ticket_number=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{hpt.getIdNumber(),hpt.getTicketNumber().trim()};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		if(count >= 2 || state){throw new DomainException("�Ѿ�Ϊ����Ա����˹���ȯ");}
		add(hpt);
	}

	@Override
	public void exchange(HPTExchangeInfo exHPT,HousePuraseTicket newTicket) throws SpecifiedObjectDoesNotExistsException {
		if(null == exHPT || null == newTicket)
		{
			throw new NullPointerException("��������ȯ��Ϣ���߻�ȯ��ϢΪ��");
		}
		//��ȡҪ�������Ĺ���ȯ
		HousePuraseTicket ticket = getByKey(HousePuraseTicket.class, exHPT.getOldTicketId());
		if(null == ticket){throw new NullPointerException("δ��ѯ��Ҫ�����Ĺ���ȯ��Ϣ");}
		//��ȯ����
		ticket.exchange();
		//�־û������Ĺ���ȯ
		add(newTicket);
		//���»�ȯ��Ϣ
		exHPT.setNewTicketId(newTicket.getId());
		//�־û���ȯ��Ϣ
		add(exHPT);
	}

	@Override
	public void provider(HPTProviderInfo revieveHPT) throws SpecifiedObjectDoesNotExistsException {
		if (null == revieveHPT) {
			throw new NullPointerException("����ʵ���ǿ�");
		}		
		//��ѯ����ȡ����ȯ��״̬���޸Ķ�Ӧ����ȯ״̬
		HousePuraseTicket ticket = getByKey(HousePuraseTicket.class, revieveHPT.getTicketId());
		if(null == ticket)
		{
			throw new NullPointerException("δ��ѯ��ָ���Ĺ���ȯ����Ϣ");
		}
		//ִ����ȯ���������������ҵ������׳��쳣
		ticket.receive();
		//���¹���ȯ״̬
		update(ticket);
		//�־û�����ȯ������Ϣ
		add(revieveHPT);
	}

	@Override
	public void reportOfLoss(HPTReportOfLossInfo lossPHT) throws SpecifiedObjectDoesNotExistsException {
		//���ݹ�ʧ��Ϣ�еĴ���ʧȯ��id����ѯ״̬
		HousePuraseTicket ticket = getByKey(HousePuraseTicket.class,lossPHT.getTicketId());
		if(null == ticket)
		{
			throw new NullPointerException("δ��ѯ��ָ���Ĺ���ȯ��Ϣ");
		}
		//��ʧ����
		ticket.reportOfLoss();
		//���¹���ȯ״̬Ϊ��ʧ
		update(ticket);
		//�־û���ʧ��Ϣ
		add(lossPHT);
	}

	@Override
	public void mend(HPTMendInfo mendHPT,HousePuraseTicket newTicket) throws SpecifiedObjectDoesNotExistsException {
		if(null == mendHPT || null == newTicket)
		{
			throw new NullPointerException("��ȯ��Ϣ������ȯΪ��");
		}
		//��ȡ����ȯ״̬
		HousePuraseTicket ticket = getByKey(HousePuraseTicket.class, mendHPT.getTicketId());
		if(null == ticket)
		{
			throw new NullPointerException("δ��ѯ������ȯ��Ϣ");
		}
		//��ȯ����
		ticket.mend();
		//�־û���ȯ
		newTicket.setState(TicketState.NORMAL);
		add(newTicket);
		//���¹���ȯ״̬
		update(ticket);
		//�־û���ȯ��Ϣ
		add(mendHPT);
	}

	@Override
	public void useOrCash(HPTUseAndCash useAndCashHPT) throws SpecifiedObjectDoesNotExistsException {
		if(null == useAndCashHPT){throw new NullPointerException("ʹ�û������ϢΪ��");}
		//��ѯ����ȯ		
		HousePuraseTicket ticket = getByKey(HousePuraseTicket.class, useAndCashHPT.getTicketId());
		if(null == ticket){throw new NullPointerException("δ��ѯ��ָ���Ĺ���ȯ��Ϣ");}
		//ʹ�ù���ȯ����
		ticket.useAndCash();
		//���¹���ȯ״̬
		update(ticket);
		//�־û�ʹ�û��߶һ���Ϣ
		add(useAndCashHPT);		
	}
	
	@Override
	public void addBatch(List<HousePuraseTicket> list) throws DomainException  {
		if(null==list)
		{
			throw new NullPointerException("����ȯ����Ϊ��");
		}
		for (HousePuraseTicket housePuraseTicket : list) {
			addHPT(housePuraseTicket);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public PageFormater queryProvideTable(
			HPTFuzzyQueryModel queryModel,PageModel pageModel) {
		
		int count = getTotalCount(new HPTProvideCountSpecification(HousePuraseTicket.class, queryModel));		
		if(count==0)
		{
			return PageFormater.obtain(null, count);
		}
		List<HPTReceiveTableDto> list = getAllByHqlJoin(//
				new HPTProvideTableSpecification(HousePuraseTicket.class, queryModel),//
				PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize),//
				pageModel.pageSize);
		
		return PageFormater.obtain(list, count);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public PageFormater queryUseTable(HPTFuzzyQueryModel queryModel,PageModel pageModel) {
		int count = getTotalCount(new HPTUseCountSpecification(HousePuraseTicket.class, queryModel));
		if(count==0){return PageFormater.obtain(null, count);}
		
		List<HPTUseTableDto> list = getAllByHqlJoin(//
				new HPTUseTableSpecification(HousePuraseTicket.class, queryModel), //
				PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize), //
				pageModel.pageSize);
		
		return PageFormater.obtain(list, count);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<HPTDisplayDto> queryByIdnumber(String idNumber) {
		List<HPTDisplayDto> list = getAllByHqlJoin(new HPTQueryByIdNumSpecification(HousePuraseTicket.class, idNumber), 0, 10);
		if(null == list || list.size()==0)
		{
			throw new NullPointerException("δ��ѯ������ȯ��Ϣ");
		}
		return list;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<HPTDisplayFmlDto> queryFmlByFmlId(UUID fmlId) {
		//���ݻ������֤��ѯ������Ϣ
		
		List<HPTDisplayFmlDto> list = getAllByHqlJoin(
				new HPTQueryFmlProvideSpecification(HousePuraseTicket.class, fmlId),0,999);
		
		return list;
		
	}
	
	@Override
	public HPTDisplayDto queryByIdnumberAndTicketNum(HPTQueryModel queryModel) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void provideByFml(List<HPTProviderInfo> list) throws SpecifiedObjectDoesNotExistsException {
		if(null == list){throw new NullPointerException("�����ŵĻ�������ϢΪ��");}
		for (HPTProviderInfo hptProviderInfo : list) {
			provider(hptProviderInfo);
		}
		
	}

	@Override
	public PageFormater queryByPage(HptUseAndCashQueryModel queryModel,
			PageModel pageModel) {
		int count = getTotalCount(new HptUseTotalCountSpecification(HousePuraseTicket.class, queryModel));
		if(count==0){
			return PageFormater.obtain(null, count);
		}
		
		List<HPTDisplayDto> list = getAllByHqlJoin(
				new HPTUseQuerySpecification(HPTDisplayDto.class, queryModel),PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize), //
				pageModel.pageSize);
				
		return PageFormater.obtain(list, count);
	}
	
}
