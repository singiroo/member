package kr.or.ddit.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.common.model.SearchVO;
import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberServiceI;

@Controller
public class LoginController {
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	@RequestMapping("/login")
	public String loginView(String id, Model model) {
		model.addAttribute("id", id);
		return "login/login";
	}
	
	@RequestMapping("/main")
	public String login(String id, String pwd, HttpSession session, Model model, RedirectAttributes ra) {
		MemberVO memberVo = memberService.getMember(id);
		String url = "";
		if(memberVo != null && pwd.equals(memberVo.getPass())) {
			session.setAttribute("S_MEMBER", memberVo);
			PageVO pageVo = new PageVO();
			SearchVO search = new SearchVO();
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("page", pageVo);
			paramMap.put("search", search);
			Map<String, Object> map = memberService.selectPagingComponent(paramMap);
			model.addAttribute("page", pageVo);
			model.addAttribute("map", map);
			url =  "tiles/member/memberList";
		}else {
			ra.addAttribute("id", id);
			url = "redirect:/login";
		}

		return url;
	}
}
