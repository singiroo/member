package kr.or.ddit.profile.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberServiceI;

@Controller
public class ProfileController {
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;

	
	@RequestMapping("/profileView")
		public String proifleView(String userid, Model model) {
		
			MemberVO member = memberService.getMember(userid);
		
			model.addAttribute("member", member);
			return "profileView";
		}
	
	
}
