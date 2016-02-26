package com.tq.requisition.autoMapper;

import java.util.ArrayList;
import java.util.List;

import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.presentation.dto.sysMgt.AccountDto;

/**
 * accout�ۺϸ���dtoת����,���಻�ܱ��̳�
 * @author jjh
 * @time 2015-12-23 17:05
 */
public final class AccountMapper {	
	/**
	 * account dtoתaccount����ʵ��
	 * @param accountDto
	 * 		��ת����accountDto
	 * @return Account
	 * 		����Account����ʵ��
	 */
	public static Account toModel(AccountDto accountDto) {
		return new Account(accountDto.getId()//
				, accountDto.getAccount()//
				, accountDto.getPwd()//
				, accountDto.getName()//
				, accountDto.getState()//
				, accountDto.getDeptId()//
				, accountDto.getOrgId()//
				,accountDto.getRoleId());
	}
	
	/**
	 * account����ʵ��תaccount dto
	 * @param account
	 * 		��ת����account
	 * @return AccountDto
	 * 		����AccountDtoʵ��
	 */
	public static AccountDto toDto(Account account) {
		return new AccountDto(account.getId()//
				, account.getAccount()//
				, account.getPwd()//
				, account.getName()//
				, account.getDeptId()//
				, account.getOrgId()//
				, account.getRoleId()//
				, account.getState());
	}
	
	public static List<Account> toModelList(List<AccountDto> dtoList) {
		if(dtoList==null)
		{
			throw new NullPointerException("��ת����dto����Ϊnull");
		}
		List<Account> modelList = new ArrayList<Account>();
		for (AccountDto accountDto : dtoList) {
			modelList.add(toModel(accountDto));
		}
		return modelList;
	}
	
	public static List<AccountDto> toDtoList(List<Account> modelList) {
		if(modelList==null)
		{
			throw new NullPointerException("��ת����model����Ϊnull");
		}
		List<AccountDto> dtoList = new ArrayList<>();
		for (Account account : modelList) {
			dtoList.add(toDto(account));
		}
		return dtoList;
	}
	
}
