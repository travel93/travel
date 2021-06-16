package com.igeek.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
//ba1f2816775cb276 隧道id
public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000117670857";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjz/iOOi28XiTpdjU0/bgv/822n7NAw6hnWchOJtexd6rMxK1XHLXXsI5Ldb186rKji2Ee5abeNWnSOXn+wV+R3rimGBCfofkMcdtanVQeGP12iGcMa0L+rkUdCK1QlrWijEJqAwLiNGgd7U2bv0biwjNTjQt68qlXTx5++sayqsCKUgTi17XmECuDCvi5VRR2NN8lYewG7APp5TeQypTPC90IikTLBgASKF1nduJLfCsDw+QZZbJmx11xoGyWmDUOPBA7lCCSLgkdaX71IS0/XdOp62dIrqSwWwIFKcMyeILjOhTkDjAwYf4YRfxGKEZ8hvlppnUNcN877/1yYlvjAgMBAAECggEAElYcAH6oTcAaInx0PeaqG5rwWOGz0OOuu1rbp4ay18L1CXRPK3LRJCI+4c4BSXuuk0FVuOHtM3eDI/uiWSIBakFOBXhsZhzoadsEN9/v9Fg4loDWIobDprIqN/MJ2DG5PvMhKV1CryhetQHzvDSCJSBSd0gkA2pivPdOUhQnSBwVbZgyyYztROlO/8aYYKL2I3wH1C/cCWX2FR/7doLX723QhMPETNJdomka7UvxTou82+ZxQhfBb/iNjLlOBPGggtWnZSUygsuzLLMHMuYrDtfQkF9mtt9QqssyQieFOgphRiARgELMIffDJlc/y0lSKpcopIU4q7zkgVfODWvzeQKBgQD38jQ+HcVoYZmWAs8a8ow5SYdfsjvU7nnO9flHy3FlT5XU0/ASBO16DJhal6SehqMNQ5+GjZ7QTk6A3NiTDnpvUmzlAk6lubKOppF8VYvvAQXsMAZ5F6GSbM4TOGgeLADighGV3KK5fZ21nZ+1VFk1dZMeO8egh/FBrSOKNoiujwKBgQDrNlhJO5j8CsS5EeT9Hbw/wdpsE1DJVi1qVSAs/im/0La55a1p0+UPCPjrD4xyuRn7dPQFY1mdVzkRIGktuHhbejAGcnXhuzVBeD3Ixzb/lveAlO13tvI1Jvj1uQPe5TG6E4pzEw19Kg+ACrfWtyEong/McP7BEAbPfAz6FwPnbQKBgCJ2SqabkrWYYzWDfG+9aJoJy0QUzNYis1F9xMEi2McBEc08C/ElODCvkXl9/EaAZidQz9pu0rUXPTgR+hQuffv9E9+cu3uzXMsRAcWrSkDU/pK+dhfcnftxHg9z1pzi9tiExZbzzLZFbGcy2mDksWWJywH3wx5f5rt/KiJqxAKnAoGACPVI54EdknvWgjXsQrefM85uQy95JDHkCOi1EQGdFXEdhHb648zuLGRrFojBEJ18H9eUc6AVCakIw144o0UjUFiW+6fgVXiLzrKFp9/ueE2Hn54MbULKdrvFP5aMTzDrc+rKmxderCWt8XJ3DfZrjOB4OZEUIsY5fC19UQkPXQECgYEApLcp8eoch7SbqhbN1mHHCwhuiYiv23EYAzmH5lOPHO9HfeW0s+0kz5GXpK9nw2JWhSi5bgHOGTq7uDX3qQDd28oyX4Hd6i4U0ANEzVRoIrIPq4KuAqIT0WBOhS5pzbduAgBI+ltZS+XWcTFrjp4QVkmz21NmMFprtPL1iiihyDM=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqOEY9mvNWzKyLwpeLKUEPpqng6FCfnpe8BB5ijsLAKwur8ecJFolhazGaC/YSRrr2fzNiFon6LmhRuw9ZBkgnSn3v7TtZSaMhfNsjpQilrRGkLZuxtjX4nbMUdeof9UYzWCdWPqsqukJknAvrTUpAv6OjF8aMwdgT/ERVfkhiE+jqGmgA+PWhFPWG+Hx2PH/2FK/ZAuFmh67krocHNV3VXXRYfUv5k9RDSdRiyX9l/ZJ43ZRFfcbrw6z1BBpdtDPAxdOhXx6OqCR+dVErC2McAl1I9PPT6QG0WzHHCod+KZlNn3OQFe8M5tjQMZxL7fqFoaeLrdONLLuNFFz9rJAewIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://ljjfree.free.idcfengye.com/travelSystem/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://ljjfree.free.idcfengye.com/travelSystem/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\java\\ailipay\\log\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

