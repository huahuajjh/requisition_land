package com.tq.requisition.domain.model.housePuraseTicket;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.model.share.TicketState;
import com.tq.requisition.domain.share.AggregateRoot;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;

/**
 * ����ȯ�ۺϸ�
 * 
 * @author jjh
 * @time 2015-12-18 16:53
 */
public class HousePuraseTicket extends AggregateRoot {
	/** ������� */
	private float bonus;
	/** ��ȯ���� */
	private Date makeDate;
	/** ȯ�� */
	private String ticketNumber;
	/** ����ȯ״̬ */
	private TicketState state;
	/** ����ȯ������id */
	private UUID fmlItemId;
	/** ����ȯ���������֤ */
	private String idNumber;
	/** �Ƿ�ɾ�� */
	private boolean del;
	/** ���� */
	private String name;

	/* constructors */
	public HousePuraseTicket() {
		this.id = UUID.randomUUID();
		this.state = TicketState.NORMAL;
		this.del = false;
	}

	public HousePuraseTicket(UUID id, float bonus, Date makeDate,
			String ticketNumber, TicketState state, UUID fmlItemId,
			String idNumber,String name) {
		this();
		this.id = UUID.randomUUID();
		this.makeDate = makeDate;		
		this.bonus = bonus;
		this.ticketNumber = ticketNumber;
		this.fmlItemId = fmlItemId;
		this.idNumber = idNumber;
		this.name = name;
		this.del = false;
	}

	/* getters and setters */
	public void setId(UUID id) {
		this.id = id;
	}

	public UUID getId() {
		return this.id;
	}

	public float getBonus() {
		return bonus;
	}

	public void setBonus(float bonus) {
		this.bonus = bonus;
	}

	public Date getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}

	public String getTicketNumber() {
		return ticketNumber;
	}

	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

	public TicketState getState() {
		return state;
	}

	public void setState(TicketState state) {
		this.state = state;
	}

	public UUID getFmlItemId() {
		return fmlItemId;
	}

	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getIdNumber() {
		return this.idNumber;
	}

	public boolean getDel() {
		return del;
	}

	public void setDel(boolean del) {
		this.del = del;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/* public methods */
	/**
	 * ���ù���ȯ
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public void receive() throws SpecifiedObjectDoesNotExistsException {
		if(this.state!=TicketState.NORMAL)
		{
			throw new SpecifiedObjectDoesNotExistsException("�޷���ȡָ���Ĺ���ȯ���ù���ȯ״̬Ϊ:"+this.state.toStr());
		}
		this.state = TicketState.RECEIVED;
	}

	/**
	 * ��ȯ,��ԭ���Ĺ���ȯ���Ϊtrue������ʹ�ã��������������Ĺ���ȯ
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public void exchange() throws SpecifiedObjectDoesNotExistsException {
		if(this.del==true)
		{
			throw new SpecifiedObjectDoesNotExistsException("��ȯ�Ѿ�����ʧ��Ϊ��ʷ��¼");
		}
		
		if(this.state==TicketState.CASHED || //�Ѷ���״̬
				this.state==TicketState.LOSSOFREPORT || //��ʧ״̬
				this.state==TicketState.NORMAL || //����״̬��δ��ȡ
				this.state==TicketState.USED)	//�Ѷһ�
		{
			throw new SpecifiedObjectDoesNotExistsException("����ִ�иò�������ǰ����ȯ״̬Ϊ:"+this.state.toStr());
		}
		this.state = TicketState.EXCHANGEED;
		this.del = true;
	}

	/**
	 * ��ʧ��������ǹ���ȯ״̬Ϊ��ʧ
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public void reportOfLoss() throws SpecifiedObjectDoesNotExistsException {
		if(this.del==true)
		{
			throw new SpecifiedObjectDoesNotExistsException("���ܹ�ʧ�ù���ȯ����ȯ�ѱ���ʧ��");
		}
		if(!(this.state==TicketState.RECEIVED || this.state==TicketState.EXCHANGEED||this.state==TicketState.MENDED))
		{
			throw new SpecifiedObjectDoesNotExistsException("���ܹ�ʧָ���Ĺ���ȯ����ǰ����ȯ״̬Ϊ:"+this.state.toStr());
		}		
		this.state = TicketState.LOSSOFREPORT;
	}

	/**
	 * ��ȯ
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public void mend() throws SpecifiedObjectDoesNotExistsException {
		if(this.state!=TicketState.LOSSOFREPORT)
		{
			throw new SpecifiedObjectDoesNotExistsException("�޷�ִ�иò���,ֻ�й�ʧ��Ĺ���ȯ���ܽ��иò�������ǰ����ȯ��״̬Ϊ:"+this.state.toStr());
		}
		this.state = TicketState.MENDED;
		//��ԭ�еĹ���ȯ��Ϊ��ʷ��¼����
		this.del = true;
	}

	/**
	 * ʹ��
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public void useAndCash() throws SpecifiedObjectDoesNotExistsException {
		if(this.del==true)
		{
			throw new SpecifiedObjectDoesNotExistsException("��ȯ����ʹ��");
		}
		if(this.state == TicketState.CASHED ||
				this.state == TicketState.LOSSOFREPORT ||
				this.state == TicketState.NORMAL||
				this.state == TicketState.USED)
		{
			throw new SpecifiedObjectDoesNotExistsException("�޷�ִ�иò������ù���ȯ״̬Ϊ:"+this.state.toStr());
		}
		this.state = TicketState.CASHED;		
	}
}
