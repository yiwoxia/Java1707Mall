package com.situ.mall.service.front;

import com.situ.mall.pojo.User;

public interface ILoginService {

	/**
	 * 检测用户名是否存在
	 * @param user
	 * @return
	 */
	public User checkUser(User user);

}
