package com.web.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.entity.PriceEvaluate;

@Transactional
public interface IEvaluateService {
	
	public PriceEvaluate getEvaluate(Map<String,String> map);
}
