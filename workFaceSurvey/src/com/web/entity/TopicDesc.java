package com.web.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "topic_desc")
public class TopicDesc {
	@Id
	@Basic(optional = false)
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "seriesid")
	private int seriesid;

	@Column(name = "series")
	private String series;

	@Column(name = "topic")
	private String topic;

	@Column(name = "topic_desc_emotion_score")
	private double topicDescEmotionScore;

	@Column(name = "content_md5_id")
	private String content_md5_id;

	@Column(name = "issatisfied")
	private int issatisfied;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setSeriesid(int seriesid) {
		this.seriesid = seriesid;
	}

	public int getSeriesid() {
		return this.seriesid;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getSeries() {
		return this.series;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getTopic() {
		return this.topic;
	}

	public double getTopicDescEmotionScore() {
		return topicDescEmotionScore;
	}

	public void setTopicDescEmotionScore(double topicDescEmotionScore) {
		this.topicDescEmotionScore = topicDescEmotionScore;
	}

	public void setContent_md5_id(String content_md5_id) {
		this.content_md5_id = content_md5_id;
	}

	public String getContent_md5_id() {
		return this.content_md5_id;
	}

	public void setIssatisfied(int issatisfied) {
		this.issatisfied = issatisfied;
	}

	public int getIssatisfied() {
		return this.issatisfied;
	}

}