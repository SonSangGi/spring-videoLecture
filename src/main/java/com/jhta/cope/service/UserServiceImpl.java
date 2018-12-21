package com.jhta.cope.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.cope.dao.UserDao;
import com.jhta.cope.handler.MailHandler;
import com.jhta.cope.vo.TempKey;
import com.jhta.cope.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	@Inject
	JavaMailSender mailSender;

	@Transactional
	@Override
	public void insertUser(User user) throws Exception {
		String key = new TempKey().getKey(false, 50);

		Map<String, Object> map = new HashMap<>();
		map.put("email", user.getEmail());
		map.put("key", key);
		userDao.insertUser(user);
		
		User getUser = userDao.getUserByEmail(user.getEmail());
		if(getUser != null) {
		MailHandler mailHandler = new MailHandler(mailSender);
		mailHandler.setFrom("ssg3799@gmail.com", "CodePeople");
		mailHandler.setSubject("[CodePeople 이메일 인증]");
		mailHandler.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("<a href='http://localhost/user/emailConfirm.do?userEmail=").append(user.getEmail())
				.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		mailHandler.setTo(user.getEmail());
		mailHandler.send();

		userDao.insertUserAuth(map);
		}
	}

	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}

	@Override
	public User userAuth(Map<String, Object> map) {
		User user = userDao.getUserByEmail((String) map.get("email"));
		if (user != null) {
			userDao.userAuth(map);
		} else {
			user = null;
		}
		return user;
	}

}
