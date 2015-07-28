package com.web.common.utils;

import java.io.UnsupportedEncodingException;

import net.sf.json.JSONObject;

public class getAccessTokenUtil {
	public static String getAccessToken(String appID , String secret){
		String accesstokenURL="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+appID+"&secret="+secret;	
		String accessTokenInfo=HttpUtil.getUrl(accesstokenURL);
		try {
			accessTokenInfo = new String(accessTokenInfo.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    JSONObject tokenInfo=JSONObject.fromObject(accessTokenInfo);
		return tokenInfo.getString("access_token");
	}
	
	public static String getJsapiTicket(String ACCESS_TOKEN){
		String jsTicketUrl="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + ACCESS_TOKEN +"&type=jsapi";
		String jsapi_ticketInfo=HttpUtil.getUrl(jsTicketUrl);
		try {
			jsapi_ticketInfo = new String(jsapi_ticketInfo.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 JSONObject ticketInfo=JSONObject.fromObject(jsapi_ticketInfo);
		 
		return ticketInfo.getString("ticket");
	}
	
	public static void main(String[] args){
		
		String accessToken=getAccessToken("wx1f31aecb83b985d7","9e8c703c6653fe88f02674a6688d380e");
		String ticket=getJsapiTicket(accessToken);
		System.out.println(accessToken);
		System.out.println(ticket);
	}
}
