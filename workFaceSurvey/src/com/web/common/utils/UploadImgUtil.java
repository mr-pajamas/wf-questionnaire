package com.web.common.utils;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class UploadImgUtil {

	String ACCESS_KEY = "ArTWIe1q_1iDUdMm2notK3vjhARjbcNa_8S1zrZ5";
	String SECRET_KEY = "N9fwW3xXTNvUCdBKQqtcYZsUmaDquwSK1xh9anFv";
	
	
	
	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

	private String getUpToken0() {
		return auth.uploadToken("wf-photos");
	}
	

	public static void main(String[] args) {
		UploadImgUtil util=new UploadImgUtil();
	   UploadManager uploadManager = new UploadManager();
		 File file=new File("c:/wangyc.jpg");
		try {
			Response res= uploadManager.put(file, "ceshi.jsp", util.getUpToken0());
			Map<String, Object> m4 = res.jsonToObject(HashMap.class);
			System.out.println(111);
		} catch (QiniuException e) {
			Response r = e.response;
			System.out.println(r.toString());
			try {
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}
