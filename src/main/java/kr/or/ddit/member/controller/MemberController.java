package kr.or.ddit.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.Cookies;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.common.model.SearchVO;
import kr.or.ddit.file.util.FileUploadUtil;
import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.model.MemberVOValidator;
import kr.or.ddit.member.service.MemberServiceI;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	@RequestMapping("/memberList")
	public String memberList(PageVO pageVo, SearchVO search, Model model, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if("pageSize".equals(cookie.getName())){
				pageVo.setPageSize(Integer.parseInt(cookie.getValue()));
			}
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", pageVo);
		paramMap.put("search", search);
		Map<String, Object> map = memberService.selectPagingComponent(paramMap);
		model.addAttribute("page", pageVo);
		model.addAttribute("map", map);
		return "tiles/member/memberList";
	}
	
	
	@RequestMapping("/memberRegistView")
	public String memberRevistView() {
		return "tiles/member/memberRegist";
	}
	
	
	@RequestMapping(path = "/memberRegist", method = {RequestMethod.POST})
	public String memberRegist(MemberVO memberVo, BindingResult br,
								Model model, @RequestPart("picture") MultipartFile file) {
		
		logger.debug("memberVo : {}", memberVo);
		
		new MemberVOValidator().validate(memberVo, br);
		
		if(br.hasErrors()) {
			model.addAttribute("member", memberVo);
			return "tiles/member/memberRegist";
		}
		
		if(file.getSize() > 0) {
			String path = "D:\\profile\\";
			new File(path).mkdirs();
			String fakename = UUID.randomUUID().toString();
			String ext = FileUploadUtil.getExtension(file.getOriginalFilename());
			String filePath = path + fakename + ext;
			File uploadfile = new File(filePath);
			memberVo.setFileName(filePath);
			memberVo.setRealFileName(file.getOriginalFilename());
			
			try {
				file.transferTo(uploadfile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		int cnt = memberService.insertMember(memberVo);
		
		return "redirect:/memberList";
	
	}
	
	@RequestMapping("/memberView")
	public String memberView(String userid, Model model) {
		MemberVO member = memberService.getMember(userid);
		model.addAttribute("member", member);
		return "tiles/member/memberView";
	}
	
	@RequestMapping("/memberUpdateView")
	public String memberUpdateView(String userid, Model model) {
		MemberVO member = memberService.getMember(userid);
		model.addAttribute("member", member);
		return "tiles/member/memberUpdate";
	}
	
	@RequestMapping(path = "/memberUpdate", method = {RequestMethod.POST})
	public String memberUpdate(MemberVO memberVo, BindingResult br, @RequestPart("picture") MultipartFile file,
			Model model) {
		
		MemberVO memberOld = memberService.getMember(memberVo.getUserId());
	
		new MemberVOValidator().validate(memberVo, br);
		
		if(br.hasErrors()) {
			model.addAttribute("member", memberOld);
			return "tiles/member/memberUpdate";
		}
		
		memberVo.setFileName(memberOld.getFileName());
		memberVo.setRealFileName(memberOld.getRealFileName());
		
		if(file.getSize() > 0) {
			String path = "D:\\profile\\";
			new File(path).mkdirs();
			String fakename = UUID.randomUUID().toString();
			String ext = FileUploadUtil.getExtension(file.getOriginalFilename());
			String filePath = path + fakename + ext;
			File uploadfile = new File(filePath);
			memberVo.setFileName(filePath);
			memberVo.setRealFileName(file.getOriginalFilename());
			
			try {
				file.transferTo(uploadfile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		memberService.updateMember(memberVo);
	
		return "redirect:/memberView?userid="+memberVo.getUserId();
		
	}
	
	/*
	 * @RequestMapping(path = "/memberUpdate", method = {RequestMethod.POST}) public
	 * String memberSearch(PageVO page, SearchVO search, Model model) {
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>();
	 * 
	 * map.put("page", page); map.put("search", search);
	 * 
	 * Map<String, Object> searchMap = memberService.searchMemberList(map);
	 * 
	 * 
	 * 
	 * return ""; }
	 */
	
	
	
	
}
