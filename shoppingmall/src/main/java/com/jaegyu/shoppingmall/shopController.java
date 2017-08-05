package com.jaegyu.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jaegyu.shoppingmall.member.memberDAO;
import com.jaegyu.shoppingmall.qna.qnaDAO;

@Controller
public class shopController {
	@Autowired
	private memberDAO memberDAO;
	@Autowired
	private qnaDAO qnaDAO;
	
	@RequestMapping(value="memberLogin.me")
	public ModelAndView loginMember(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws Exception {
		HttpSession session = arg0.getSession();
		ModelAndView mav = new ModelAndView();
		String id=arg0.getParameter("id");
		String passwd=arg0.getParameter("passwd");
		int member_admin=0;
		if(memberDAO.loginMember(id, passwd)){
			
			session.setAttribute("id", id);
			if(memberDAO.isAdmin(id)){
				member_admin=0;
			}
		}
		session.setAttribute("member_admin", member_admin);
		mav.setViewName("index");
		
		return mav;
	}
}
