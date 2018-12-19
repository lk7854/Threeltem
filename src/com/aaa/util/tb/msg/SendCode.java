package com.aaa.util.tb.msg;

import com.aaa.util.tb.help.getNum;
import com.montnets.mwgate.common.GlobalParams;
import com.montnets.mwgate.common.Message;
import com.montnets.mwgate.smsutil.ConfigManager;
import com.montnets.mwgate.smsutil.SmsSendConn;

public class SendCode {

	/**
	 * 注册成功的短信内容，例：恭喜！您在本系统中注册的账号：admin，可以使用了！初始密码：123456
	 * 
	 * @param uname
	 *            用户名
	 * @return 短信内容
	 */
	public static String getRegContent(String uname) {
		return "恭喜！您在本系统中注册的账号：" + uname + "，可以使用了！初始密码：123456";
	}

	/**
	 * 获取一个随机验证码，例：验证码：123，打死都不要告诉别人哦！
	 * 
	 * @param code
	 *            验证码
	 * @return 短信内容
	 */
	public static String getCode1(Integer code) {
		return "验证码：" + code + "，打死都不要告诉别人哦！";
	}

	/**
	 * 广告位审核通过的短信，例：恭喜，您添加的编号为：8的广告位，已审核通过！
	 * 
	 * @param s_id
	 *            广告位编号
	 * @return
	 */
	public static String getSlotCheckOk(Integer s_id) {
		return "恭喜，您添加的编号为：" + s_id + "的广告位，已审核通过！";
	}

	/**
	 * 订单审核短信通知，例：尊敬的用户，编号为：20222的订单已经有审核结果了！请登录系统查看相关信息。
	 * 
	 * @param i_id
	 *            订单编号
	 * @return
	 */
	public static String getIndentCheck(String i_id) {
		return "尊敬的用户，编号为：" + i_id + "的订单已经有审核结果了！请登录系统查看相关信息。";
	}

	/**
	 * 订单撤销成功通知，例：尊敬的用户，您申请撤销的编号为：123123的订单，已经撤销成功！
	 * 
	 * @param i_id
	 *            订单编号
	 * @return
	 */
	public static String getRollbackIndent(String i_id) {
		return "尊敬的用户，您申请撤销的编号为：" + i_id + "的订单，已经撤销成功！";
	}

	/**
	 * 即将到期的订单续费通知，例：尊敬的用户，编号为：2342的订单，冻结金额为：234元，可执行时长大概剩余1分钟，如需继续使用，请及时续费！
	 * 
	 * @param i_id
	 *            订单编号
	 * @param money
	 *            剩余的冻结金额
	 * @param min
	 *            剩余分钟
	 * @return
	 */
	public static String getXufeiIndent(String i_id, Double money, Integer min) {
		return "尊敬的用户，编号为：" + i_id + "的订单，冻结金额为：" + money + "元，可执行时长大概剩余" + min
				+ "分钟，如需继续使用，请及时续费！";
	}

	/**
	 * 广告审核后短信通知，例：尊敬的用户，编号为：9的广告，已经有审核结果，赶快去下订单吧！
	 * 
	 * @param poster
	 * @return
	 */
	public static String getPosterCheck(Integer p_id) {
		return "尊敬的用户，编号为：" + p_id + "的广告，已经有审核结果，赶快去下订单吧！";
	}

	/**
	 * @deprecated 单条信息发送
	 * @param phone
	 *            电话号码
	 * @param content
	 *            短信内容
	 */
	public static Integer singleSendByPhone(String phone, String content) {
		Integer code = getNum.getCode();
		// 用户账号
		String userid = "E104IP";
		// 创建全局参数
		GlobalParams globalParams = new GlobalParams();
		// 设置请求路径
		globalParams.setRequestPath("/sms/v2/std/");
		// 设置是否需要日志 1:需要日志;0:不需要日志
		globalParams.setNeedLog(1);
		// 设置全局参数
		ConfigManager.setGlobalParams(globalParams);
		// 设置用户账号信息
		setAccountInfo();
		// 是否保持长连接
		boolean isKeepAlive = true;
		// 实例化短信处理对象
		SmsSendConn smsSendConn = new SmsSendConn(isKeepAlive);
		// 单条发送
		singleSend(smsSendConn, phone, code, userid, content);
		// 实例化短信处理对象
		SmsSendConn smsSendConnMo = new SmsSendConn(isKeepAlive);
		// 每次请求想要获取的上行的最大条数。
		int retsizeMo = 100;
		// 实例化获取上行线程
		RecvMoThread recvMoThread = new RecvMoThread(smsSendConnMo, userid,
				retsizeMo);
		// 线程获取 启动获取上行的线程
		recvMoThread.start();
		System.out.println("获取上行的线程启动成功！");

		// 实例化短信处理对象
		SmsSendConn smsSendConnRpt = new SmsSendConn(isKeepAlive);
		// 每次请求想要获取的状态报告的最大条数。
		int retsizeRpt = 100;
		// 实例化状态报告线程
		RecvRptThread recvRptThread = new RecvRptThread(smsSendConnRpt, userid,
				retsizeRpt);
		// 线程获取 启动获取状态报告的线程
		recvRptThread.start();
		System.out.println("获取状态报告的线程启动成功！");
		// 移除用户账号(此处为移除用户账号功能示例，使用时请根据实际情况，有需要才调用此方法)
		// removeAccount(userid);
		return code;
	}

	/**
	 * @description 设置用户账号信息
	 */
	public static void setAccountInfo() {
		// 设置用户账号信息

		// 用户账号
		String userid = "E104IP";
		// 密码
		String password = "1Gx048";
		// 发送优先级
		int priority = 1;
		// 主IP信息
		String ipAddress1 = "api01.monyun.cn:7901";
		// 备用IP1信息
		String ipAddress2 = "api02.monyun.cn:7901";
		// 备用IP2信息
		String ipAddress3 = null;
		// 备用IP3信息
		String ipAddress4 = null;
		// 返回值
		int result = -310007;
		try {
			// 设置用户账号信息
			result = ConfigManager.setAccountInfo(userid, password, priority,
					ipAddress1, ipAddress2, ipAddress3, ipAddress4);
			// 判断返回结果，0设置成功，否则失败
			if (result == 0) {
				System.out.println("设置用户账号信息成功！");
			} else {
				System.out.println("设置用户账号信息失败，错误码：" + result);
			}
		} catch (Exception e) {
			// 异常处理
			e.printStackTrace();
		}
	}

	/**
	 * 移除用户账号
	 * 
	 * @param userid
	 *            用户账号
	 */
	public static void removeAccount(String userid) {
		try {
			// 调用移除用户账号的方法
			int result = ConfigManager.removeAccount(userid);

			// 返回0，代表移除成功
			if (result == 0) {
				System.out.println("移除用户账号[" + userid + "]成功！");
			}
			// 返回非0，代表移除失败
			else {
				System.out.println("移除用户账号[" + userid + "]失败！错误码：" + result);
			}
		} catch (Exception e) {
			// 异常处理
			e.printStackTrace();
		}
	}

	/**
	 * @description 单条发送
	 * @param smsSendConn
	 *            短信处理对象,在这个方法中调用发送短信功能
	 * @param phone
	 *            电话
	 * @param authcode
	 *            授权码
	 * @param userid
	 *            用户账号
	 */
	public static void singleSend(SmsSendConn smsSendConn, String phone,
			Integer authcode, String userid, String content) {
		try {
			// 参数类
			Message message = new Message();
			// 设置用户账号 指定用户账号发送，需要填写用户账号，不指定用户账号发送，无需填写用户账号
			message.setUserid(userid);
			// 设置手机号码 此处只能设置一个手机号码
			message.setMobile(phone);
			// 设置内容
			// message.setContent("您的验证码是" + authcode +
			// "，在3分钟内输入有效。如非本人操作请忽略此短信。");
			message.setContent(content);
			// 设置扩展号
			message.setExno("11");
			// 用户自定义流水编号
			message.setCustid("20160929194950100001");
			// 自定义扩展数据
			message.setExdata("abcdef");
			// 业务类型
			message.setSvrtype("SMS001");

			// 返回的流水号
			StringBuffer returnValue = new StringBuffer();
			// 返回值
			int result = -310099;
			// 发送短信
			result = smsSendConn.singleSend(message, returnValue);
			// result为0:成功
			if (result == 0) {
				System.out.println("单条发送提交成功！");
				System.out.println(returnValue.toString());
			}
			// result为非0：失败
			else {
				System.out.println("单条发送提交失败,错误码：" + result);
			}
		} catch (Exception e) {
			// 异常处理
			e.printStackTrace();
		}
	}

}
