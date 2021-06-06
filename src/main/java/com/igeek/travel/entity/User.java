package com.igeek.travel.entity;

import java.util.Date;

/**
 * 用户类
 */
public class User {

	private String uid;
	private String uname;
	private String password;
	private String name;
	private Date birthday;
	private String sex;
	private String phone;
	private String email;
	private int status; //角色0普通 1会员 2企业会员 默认0
	private int state; //状态 0休闲 1旅游 默认0

	public User() {
	}

	public User(String uname, String password, String name, Date birthday, String sex, String phone, String email) {
		this.uname = uname;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
	}

	public User(String uid, String uname, String password, String name, Date birthday, String sex, String phone, String email, int status, int state) {
		this.uid = uid;
		this.uname = uname;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.state = state;
	}

	/**
	 * 获取
	 * @return uid
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * 设置
	 * @param uid
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 获取
	 * @return uname
	 */
	public String getUname() {
		return uname;
	}

	/**
	 * 设置
	 * @param uname
	 */
	public void setUname(String uname) {
		this.uname = uname;
	}

	/**
	 * 获取
	 * @return password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 设置
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取
	 * @return birthday
	 */
	public Date getBirthday() {
		return birthday;
	}

	/**
	 * 设置
	 * @param birthday
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	/**
	 * 获取
	 * @return sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * 设置
	 * @param sex
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * 获取
	 * @return phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 设置
	 * @param phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 获取
	 * @return email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * 设置
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 获取
	 * @return status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * 设置
	 * @param status
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * 获取
	 * @return state
	 */
	public int getState() {
		return state;
	}

	/**
	 * 设置
	 * @param state
	 */
	public void setState(int state) {
		this.state = state;
	}

	public String toString() {
		return "User{uid = " + uid + ", uname = " + uname + ", password = " + password + ", name = " + name + ", birthday = " + birthday + ", sex = " + sex + ", phone = " + phone + ", email = " + email + ", status = " + status + ", state = " + state + "}";
	}
}
