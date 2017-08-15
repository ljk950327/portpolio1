package com.jaegyu.shoppingmall;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.GeneratorStrategy;
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
import com.jaegyu.shoppingmall.order.cartDTO;
import com.jaegyu.shoppingmall.order.orderDAO;
import com.jaegyu.shoppingmall.order.orderDTO;
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
	@Autowired
	private orderDAO orderDAO;

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

		int pg = Integer.parseInt(arg0.getParameter("pg"));
		int gk = ServletRequestUtils.getIntParameter(arg0, "gk"); // groupkind
		int totalPage; 

		int endNum = pg * 5;
		int startNum = endNum - 4;
		if (gk < 3) {
			int totalGoods = goodsDAO.getTotalGoods(gk);
			totalPage = (totalGoods + 4) / 5;
		} else {
			int totalQna = qnaDAO.getTotalQna();
			totalPage = (totalQna + 4) / 5;
		}

		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (totalPage < endPage)
			endPage = totalPage;

		if (gk < 3) {
			List<goodsDTO> list = (ArrayList) goodsDAO.listGoods(gk, startNum, endNum);
			mav.addObject("list", list);
		} else {
			List<qnaDTO> list = (ArrayList) qnaDAO.listqna(startNum, endNum);
			mav.addObject("list", list);
		}

		mav.addObject("pg", pg);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		mav.addObject("gk", gk);
		if (gk < 3) {
			mav.setViewName("goodsList");
		} else {
			mav.setViewName("Qnalist");
		}
		return mav;
	}

	@RequestMapping(value = "Content.me")
	public ModelAndView Content(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		int num = ServletRequestUtils.getIntParameter(arg0, "num");
		int pg = Integer.parseInt(arg0.getParameter("pg"));
		goodsDTO dto = goodsDAO.getGoods(num);
		mav.addObject("pg", pg);
		mav.addObject("dto", dto);
		mav.setViewName("goodsContent");
		return mav;
	}

	@RequestMapping(value = "Cart.me", method = RequestMethod.POST)
	public ModelAndView CartReq(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = arg0.getSession();
		String id = (String) session.getAttribute("id");
		memberDTO memberDTO = memberDAO.getMember(id);

		String command = arg0.getParameter("command");

		if (command.equals("add")) {
			int goodsnum = ServletRequestUtils.getIntParameter(arg0, "num");
			String goodsname = arg0.getParameter("goodsname");
			int price = ServletRequestUtils.getIntParameter(arg0, "price");
			int qty = ServletRequestUtils.getIntParameter(arg0, "qty");
			cartDTO dto = new cartDTO();
			mav.addObject("msg", "장바구니에 넣었습니다.");
			mav.addObject("url", "Cart.me");
			if (orderDAO.isCart(id, goodsname)) {
				orderDAO.cartUpdate(id, goodsname, qty);
			} else {
				dto.setQty(qty);
				dto.setNum(goodsnum);
				dto.setBuyer(id);
				dto.setGoodsname(goodsname);
				dto.setPrice(price);
				orderDAO.cartInput(dto);

			}
		} else if (command.equals("del")) {
			int index = ServletRequestUtils.getIntParameter(arg0, "index");
			orderDAO.cartDelete(id, index);
			mav.addObject("msg", "삭제");
			mav.addObject("url", "Cart.me");
			mav.setViewName("message");
		} else {
			orderDTO orderdto = new orderDTO();
			List<cartDTO> list = orderDAO.cartList(id);

			for (cartDTO cartdto : list) {
				orderdto.setBuyer(cartdto.getBuyer());
				orderdto.setGoodsnum(cartdto.getNum());
				orderdto.setQty(cartdto.getQty());
				int sum = cartdto.getQty() * cartdto.getPrice();
				orderdto.setSum(sum);
				orderDAO.orderInput(orderdto);
				orderDAO.cartDelete(cartdto.getBuyer(), cartdto.getNum());
			}

			mav.addObject("msg", "주문완료");
			mav.addObject("url", "order.me");
		}

		mav.setViewName("message");
		return mav;

	}

	@RequestMapping(value = "Cart.me", method = RequestMethod.GET)
	public ModelAndView CartList(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = arg0.getSession();
		String buyer = (String) session.getAttribute("id");
		List<cartDTO> list = orderDAO.cartList(buyer);
		if (list != null) {
			mav.addObject("list", list);
		}
		mav.setViewName("cart");
		return mav;

	}

	@RequestMapping(value = "order.me")
	public ModelAndView order(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = arg0.getSession();
		String buyer = (String) session.getAttribute("id");
		List<orderDTO> list = orderDAO.orderList(buyer);

		mav.addObject("list", list);
		mav.setViewName("bill");
		return mav;
	}

	@RequestMapping(value = "QnaWrite.me", method = RequestMethod.GET)
	public ModelAndView QnaWrite(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QnaWrite");
		return mav;
	}

	@RequestMapping(value = "QnaWrite.me", method = RequestMethod.POST)
	public ModelAndView QnaWritePro(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {

		qnaDTO dto = getQnaDTO(arg0);
		int res = qnaDAO.insertqna(dto);
		return new ModelAndView("redirect:List.me?pg=1&gk=3");

	}

	protected qnaDTO getQnaDTO(HttpServletRequest arg0) throws Exception {
		qnaDTO dto = new qnaDTO();
		dto.setNum(ServletRequestUtils.getIntParameter(arg0, "num"));
		dto.setSubject(arg0.getParameter("subject"));
		dto.setContent(arg0.getParameter("content"));
		dto.setIp(arg0.getRemoteAddr());
		dto.setWriter(arg0.getParameter("writer"));
		dto.setRe_step(ServletRequestUtils.getIntParameter(arg0, "re_step"));
		dto.setRe_level(ServletRequestUtils.getIntParameter(arg0, "re_level"));
		return dto;
	}

	@RequestMapping(value = "QnaContent.me")
	public ModelAndView QnaContent(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		int pg = ServletRequestUtils.getIntParameter(arg0, "pg");
		int num = ServletRequestUtils.getIntParameter(arg0, "num");
		qnaDAO.readCountPlus(num);
		qnaDTO dto = qnaDAO.getqna(num);
		if (dto != null) {
			mav.addObject("dto", dto);
			mav.addObject("pg", pg);
			mav.setViewName("QnaContent");
		} else {
			mav.addObject("msg", "오류!");
			mav.addObject("url", "List.me?pg=1&gk=3");
			mav.setViewName("message");
		}
		return mav;
	}

}
