package com.aaa.test.tb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aaa.dao.tb.InstitutionDao;
import com.aaa.service.tb.IndentService;
import com.aaa.service.tb.PosterService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Tb {

	@Autowired
	IndentService is;
	@Autowired
	PosterService ps;

	@Autowired
	InstitutionDao isdao;

	@Test
	public void t() {
		// System.out.println(ps.query(null, null, null));
		// System.out.println(ps.query(null, 1, 10));
		// System.out.println(ps.Up(new Poster(6, null, null, null, null, null,
		// null, "2")));
		System.out.println(isdao.query(null, null, null));
	}
}
