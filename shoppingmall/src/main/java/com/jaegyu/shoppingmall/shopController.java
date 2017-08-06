package com.jaegyu.shoppingmall;

import java.util.ArrayList;
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

import com.jaegyu.shoppingmall.goods.goodsDAO;
import com.jaegyu.shoppingmall.goods.goodsDTO;
import com.jaegyu.shoppingmall.member.memberDAO;
import com.jaegyu.shoppingmall.member.memberDTO;
import com.jaegyu.shoppingmall.member.memberMapper;
import com.jaegyu.shoppingmall.member.zipcode.zipcodeDTO;
import com.jaegyu.shoppingmall.qna.qnaDAO;
import com.jaegyu.shoppingmall.qna.qnaDTO;

@Controller
public class shopController {
	@Autowired
	private memberDAO memberDAO;
	@Autowired
	private qnaDAO qnaDAO;
	@Autowired
	private goodsDAO goodsDAO;
	
	@RequestMapping(value = "index.me", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "index";
	}

	@RequestMapping(value = "memberLogin.me")
	public ModelAndView loginMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		HttpSession session = arg0.getSession();
		ModelAndView mav = new ModelAndView();
		String id = arg0.getParameter("id");
		String passwd = arg0.getParameter("passwd");
		String login = arg0.getParameter("login");
		

		if (login != null) {
			memberDTO dto = memberDAO.loginMember(id);
			if (dto == null) {
				mav.addObject("msg", "로그인에 실패했습니다.");
				mav.addObject("url", "index.me");
				mav.setViewName("message");
				return mav;
			}
			if (dto.getId().equals(id) && dto.getPasswd().equals(passwd)) {

				session.setAttribute("id", id);
				if (memberDAO.isAdmin(id)) {
					mav.addObject("member_admin", "true");

				}

			} else {
				mav.addObject("msg", "로그인에 실패했습니다.");
				mav.addObject("url", "index.me");
				mav.setViewName("message");
				return mav;
			}
		} else {
			session.invalidate();
			mav.addObject("msg", "로그아웃");
			mav.addObject("url", "index.me");
			mav.setViewName("message");
			return mav;
		}

		mav.setViewName("index");
		return mav;
	}

	@RequestMapping(value = "memberCheck.me", method = RequestMethod.GET)
	public ModelAndView checkMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {

		return new ModelAndView("memberSSN");
	}

	@RequestMapping(value = "memberCheck.me", method = RequestMethod.POST)
	public ModelAndView checkMemberPro(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		String name = arg0.getParameter("name");
		int ssn1 = ServletRequestUtils.getIntParameter(arg0, "ssn1");
		int ssn2 = ServletRequestUtils.getIntParameter(arg0, "ssn2");
		memberDTO dto = new memberDTO();
		dto.setSsn1(ssn1);
		dto.setSsn2(ssn2);

		if (memberDAO.checkMember(dto) > 0) {
			String msg = "사용하고 있는 주민번호입니다. 로그인을 해주세요.";
			String url = "index.me";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		}
		mav.addObject("name", name);
		mav.addObject("ssn1", ssn1);
		mav.addObject("ssn2", ssn2);
		mav.setViewName("memberJoin");
		return mav;

	}

	@RequestMapping(value = "memberIDConfirm.me")
	public ModelAndView confirmID(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = arg0.getParameter("id");
		String cid = memberDAO.confirmId(id);

		mav.addObject("id", id);
		mav.addObject("cid", cid);
		mav.setViewName("member_idchk");
		return mav;
	}

	@RequestMapping(value = "zipcode.me")
	public ModelAndView zipcodeID(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		String dong = arg0.getParameter("dong");
		List<zipcodeDTO> list = memberMapper.searchZipcode(dong);

		mav.addObject("list", list);
		mav.setViewName("member_zipcode");
		return mav;
	}

	@RequestMapping(value = "memberJoin.me")
	public ModelAndView joinMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberDTO dto = new memberDTO();
		dto.setId(arg0.getParameter("id"));
		dto.setPasswd(arg0.getParameter("passwd1"));
		dto.setName(arg0.getParameter("name"));
		dto.setSsn1(ServletRequestUtils.getIntParameter(arg0, "ssn1"));
		dto.setSsn2(ServletRequestUtils.getIntParameter(arg0, "ssn2"));
		dto.setEmail(arg0.getParameter("email"));
		dto.setPh1(arg0.getParameter("ph1"));
		dto.setPh2(arg0.getParameter("ph2"));
		dto.setPh3(arg0.getParameter("ph3"));
		dto.setZipcode(arg0.getParameter("zipcode1") + " - " + arg0.getParameter("zipcode2"));
		dto.setAddr1(arg0.getParameter("addr1"));
		dto.setAddr2(arg0.getParameter("addr2"));
		dto.setMember_admin(0);
		if (!memberDAO.insertMember(dto)) {
			mav.addObject("msg", "회원가입에 실패했습니다.");
			mav.addObject("url", "index.me");
			mav.setViewName("message");
			return mav;
		}

		mav.addObject("msg", "회원가입에 성공했습니다.");
		mav.addObject("url", "index.me");
		mav.setViewName("message");
		return mav;
	}

	@RequestMapping(value = "memberModify.me", method = RequestMethod.GET)
	public ModelAndView modifyMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = arg0.getSession();
		String id = (String) session.getAttribute("id");
		memberDTO dto = memberDAO.getMember(id);

		mav.addObject("memberDTO", dto);
		mav.setViewName("memberModify");
		return mav;
	}

	@RequestMapping(value = "memberModify.me", method = RequestMethod.POST)
	public ModelAndView modifyMemberPro(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		HttpSession session = arg0.getSession();
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		memberDTO dto = new memberDTO();
		dto.setId(id);
		dto.setPasswd(arg0.getParameter("passwd1"));
		dto.setName(arg0.getParameter("name"));
		dto.setEmail(arg0.getParameter("email"));
		dto.setPh1(arg0.getParameter("ph1"));
		dto.setPh2(arg0.getParameter("ph2"));
		dto.setPh3(arg0.getParameter("ph3"));
		dto.setZipcode(arg0.getParameter("zipcode1") + " - " + arg0.getParameter("zipcode2"));
		dto.setAddr1(arg0.getParameter("addr1"));
		dto.setAddr2(arg0.getParameter("addr2"));

		if (!memberDAO.updateMember(dto)) {
			mav.addObject("msg", "정보수정에 실패했습니다.");
			mav.addObject("url", "index.me");
			mav.setViewName("message");
			return mav;
		}

		mav.addObject("msg", "정보수정에 성공했습니다.");
		mav.addObject("url", "index.me");
		mav.setViewName("message");
		return mav;
	}

	@RequestMapping(value = "memberOut.me", method = RequestMethod.GET)
	public ModelAndView deleteMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {

		return new ModelAndView("memberDelete");
	}

	@RequestMapping(value = "memberOut.me", method = RequestMethod.POST)
	public ModelAndView deleteMemberPro(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = arg0.getSession();
		String id = (String) session.getAttribute("id");
		String passwd = memberDAO.loginMember(id).getPasswd();

		if (!memberDAO.deleteMember(id, passwd)) {
			mav.addObject("msg", "회원탈퇴에 실패했습니다.");
			mav.addObject("url", "memberModify.me");
			mav.setViewName("message");
			return mav;
		}
		session.invalidate();
		mav.addObject("msg", "회원탈퇴에 성공했습니다.");
		mav.addObject("url", "index.me");
		mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping(value = "List.me")
	public ModelAndView List(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();

		int pg= Integer.parseInt(arg0.getParameter("pg"));
		int gk=ServletRequestUtils.getIntParameter(arg0, "gk"); //groupkind 그룹판별..

		int endNum=pg*2;
		int startNum=endNum-1;
		
		if(gk<2){
		List<goodsDTO> list = (ArrayList)goodsDAO.listGoods(gk);
		mav.addObject("list",list);
		}else{
		List<qnaDTO> list=(ArrayList)qnaDAO.listqna();
		mav.addObject("list",list);
		}
		int totalGoods= goodsDAO.getTotalGoods(); 
		int totalPage=(totalGoods+2)/3;

		int startPage=(pg-1)/3*3+1;
		int endPage= startPage+2;
		if(totalPage<endPage)endPage=totalPage;

		mav.addObject("pg",pg);
		mav.addObject("startPage",startPage);
		mav.addObject("endPage",endPage);
		mav.addObject("totalPage",totalPage);
		if(gk==0){
		mav.setViewName("hatList.jsp");
		}else if(gk==1){
		mav.setViewName("accessoryList.jsp");
		}else{
			mav.setViewName("QnaList.jsp");	
		}
		return mav;
	}

	
}
