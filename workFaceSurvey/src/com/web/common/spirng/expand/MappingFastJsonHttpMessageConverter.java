/**   
 * @Title: MappingFastJsonHttpMessageConverter.java 
 * @Package com.haistand.web.spring.expand 
 * @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
 */
package com.web.common.spirng.expand;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class MappingFastJsonHttpMessageConverter extends
		AbstractHttpMessageConverter<Object> {
	/**
	 * @ClassName: MappingFastJsonHttpMessageConverter
	 * @Description: spring支持fastjson
	 * @author 陈超
	 * @date 2015年7月6日 下午3:26:30
	 * 
	 */
	public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

	// fastjson特性参数
	private SerializerFeature[] serializerFeature;

	public SerializerFeature[] getSerializerFeature() {
		return serializerFeature;
	}

	public void setSerializerFeature(SerializerFeature[] serializerFeature) {
		this.serializerFeature = serializerFeature;
	}

	public MappingFastJsonHttpMessageConverter() {
		super(new MediaType("application", "json", DEFAULT_CHARSET));
	}

	@Override
	public boolean canRead(Class<?> clazz, MediaType mediaType) {
		// JavaType javaType = getJavaType(clazz);
		// return this.objectMapper.canDeserialize(javaType) &&
		// canRead(mediaType);
		return true;
	}

	@Override
	public boolean canWrite(Class<?> clazz, MediaType mediaType) {
		// return this.objectMapper.canSerialize(clazz) && canWrite(mediaType);
		return true;
	}

	@Override
	protected boolean supports(Class<?> clazz) {
		// should not be called, since we override canRead/Write instead
		throw new UnsupportedOperationException();
	}

	@Override
	protected Object readInternal(Class<?> clazz, HttpInputMessage inputMessage)
			throws IOException, HttpMessageNotReadableException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int i;
		while ((i = inputMessage.getBody().read()) != -1) {
			baos.write(i);
		}
		String data = baos.toString();
		data = data.replace("rows", "Rows");
		data = data.replace("total", "Total");		
		return JSON.parseArray(data, clazz);
	}

	@Override
	protected void writeInternal(Object o, HttpOutputMessage outputMessage)
			throws IOException, HttpMessageNotWritableException {
		String jsonString = JSON.toJSONString(o, serializerFeature);
		OutputStream out = outputMessage.getBody();
		jsonString = jsonString.replace("rows", "Rows");
		jsonString = jsonString.replace("total", "Total");
		out.write(jsonString.getBytes(DEFAULT_CHARSET));
		out.flush();
	}
}
