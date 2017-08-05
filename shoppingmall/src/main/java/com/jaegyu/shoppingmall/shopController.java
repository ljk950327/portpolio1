package com.jaegyu.shoppingmall;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jaegyu.shoppingmall.member.memberDAO;
import com.jaegyu.shoppingmall.member.memberDTO;
import com.jaegyu.shoppingmall.member.memberMapper;
import com.jaegyu.shoppingmall.member.zipcode.zipcodeDTO;
import com.jaegyu.shoppingmall.qna.qnaDAO;

@Controller
public class shopController {
	@Autowired
	private memberDAO memberDAO;
	@Autowired
	private qnaDAO qnaDAO;
	
	@RequestMapping(value = "index.me", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
				
		return "index";
	}
	
	@RequestMapping(value="memberLogin.me")
	public ModelAndView loginMember(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws Exception {
		HttpSession session = arg0.getSession();
		ModelAndView mav = new ModelAndView();
		String id=arg0.getParameter("id");
		String passwd=arg0.getParameter("passwd");
		String login=arg0.getParameter("login");
		
		if(login!=null){
		if(memberDAO.loginMember(id).getId().equals(id)&&memberDAO.loginMember(id).getPasswd().equals(passwd)){
			
			session.setAttribute("id", id);
			if(memberDAO.isAdmin(id)){
				mav.addObject("member_admin","true");

			}else{
				mav.addObject("member_admin","false");
			}

		} else{
			mav.addObject("msg","로그인에 실패했습니다.");
			mav.addObject("url","index.me");
			mav.setViewName("message");
			return mav;
		}
		}else{
			session.invalidate();
			mav.addObject("msg","로그아웃");
			mav.addObject("url","index.me");
			mav.setViewName("message");
			return mav;
		}
		
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping(value="memberCheck.me", method=RequestMethod.GET)
	public ModelAndView checkMember(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws Exception {
		
		return new ModelAndView("memberSSN");
	}
	
	@RequestMapping(value="memberCheck.me", method=RequestMethod.POST)
	public ModelAndView checkMemberPro(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws Exception {
		ModelAndView mav=new ModelAndView();
		String name=arg0.getParameter("name");
		int ssn1 =ServletRequestUtils.getIntParameter(arg0, "ssn1");
		int ssn2 =ServletRequestUtils.getIntParameter(arg0, "ssn2");
		memberDTO dto = new memberDTO();
		dto.setSsn1(ssn1);
		dto.setSsn2(ssn2);
		
		if(memberDAO.checkMember(dto)>0){
			String msg = "사용하고 있는 주민번호입니다. 로그인을 해주세요.";
			String url = "index.me";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.setViewName("message");
			return mav;
		}
		mav.addObject("name", name);
		mav.addObject("ssn1", ssn1);
		mav.addObject("ssn2", ssn2);
		mav.setViewName("memberJoin");
		return mav;
		
	}
	
	@RequestMapping(value="memberIDConfirm.me")
	public ModelAndView confirmID(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws Exception {
		ModelAndView mav=new ModelAndView();
		String id = arg0.getParameter("id");
		String cid=memberDAO.confirmId(id);
		
		mav.addObject("id",id);
		mav.addObject("cid",cid);
		mav.setViewName("member_idchk");
		return mav;
	}
	
	@RequestMapping(value="zipcode.me", method=RequestMethod.GET)
	public ModelAndView zipcodeID(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws Exception {
		ModelAndView mav=new ModelAndView();
		String dong = arg0.getParameter("dong");
		List<zipcodeDTO> list=memberMapper.searchZipcode(dong);
		
		mav.addObject("list", list);
		mav.setViewName("member_zipcode");
		return mav;
	}
	
	
}
