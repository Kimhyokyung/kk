package com.bit.kuku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.RatingDao;
import com.bit.kuku.vo.RatingVo;

@Service
public class RatingService {
	
	@Autowired
	RatingDao ratingDao;
	
	public void ratingListener(RatingVo vo) {
		ratingDao.insert_Rating(vo);
	}
	
	public RatingVo getRating(String tk_email, String ls_email) {
		return ratingDao.selectRating(tk_email, ls_email);
	}
	
	public List<RatingVo> getListenerRating(String ls_email) {
		return ratingDao.selectListenerRating(ls_email);
	}
}
