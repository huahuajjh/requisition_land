package com.tq.requisition.presentation.actions;

import java.io.IOException;

import javax.servlet.http.Cookie;

import com.tq.requisition.infrastructure.log.LoggerFactory;
import com.tq.requisition.presentation.Interceptor.LoginInterceptor;
import com.tq.requisition.presentation.dto.sysMgt.AccountSafeDto;
import com.tq.requisition.presentation.serviceContract.sysManagement.IGetResService;
import com.tq.requisition.presentation.serviceContract.userAssociated.IUserService;

@SuppressWarnings("serial")
public class Index extends BaseAction {
	private String username;
	private String password;
	private String oldPassword;
	private String newPassword;
	private IUserService userService;
	private IGetResService getResService;

	public Index() {
		userService = getService("userService", IUserService.class);
		getResService = getService("getResService", IGetResService.class);
	}
		
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String execute() throws Exception {
		LoggerFactory.logger().error("Bless Login.");
		return SUCCESS;
	}

	public String login() throws IOException {
			AccountSafeDto accountDto = userService.login4session(username, password);
			if(null == accountDto){
				response().getWriter().write(ERROR);
				return null;
			}
			Cookie cookie = new Cookie(LoginInterceptor.LOGIN, accountDto.getId().toString());
			cookie.setPath("/requisition_land");
			response().addCookie(cookie);
			Cookie nameCookie = new Cookie(LoginInterceptor.LOGINNAME, accountDto.getName());
			nameCookie.setPath("/requisition_land");
			response().addCookie(nameCookie);
			response().getWriter().write(SUCCESS);
			return null;
	}

	public String editPassword() throws IOException{
		String jsonState = userService.changePwd(userId(), oldPassword, newPassword);
		response().getWriter().write(jsonState);
		return null;
	}
	
	public String getRes() throws IOException {
		String jsonData = this.getResService.getResByUserIdJson(userId());
		response().getWriter().write(jsonData);
		return null;
	}
}
