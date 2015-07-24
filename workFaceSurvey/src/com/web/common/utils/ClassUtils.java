package com.web.common.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import com.web.entity.Admin;

/**
 * 通过java反射机制提供一些支持的方法
 * 
 * @author 高扬
 * 
 */
public class ClassUtils {

	public static void getObject(Object object) {
		// 得到对象的类
		Class c = object.getClass();
		// 得到对象中所有的方法
		Method[] methods = c.getMethods();
		// 得到对象中所有的属性
		// Field[] fields = c.getFields();

		// 得到对象所有的变量
		Field[] f = c.getDeclaredFields();

		// 得到对象类的名字
		String cName = c.getName();

		for (Field field : f) {
			System.out.println(field.getName());
			System.out.println(field.getType().getName());
		}
	}

	public static void main(String[] args) {
		ClassUtils.getObject(new Admin());
	}
}
