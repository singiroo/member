package kr.or.ddit.member.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.WebTestConfig;
import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.common.model.SearchVO;
import kr.or.ddit.member.model.MemberVO;

public class MemberControllerTest extends WebTestConfig{
	
	@Test
	public void getListTest() throws Exception {
		/***Given***/
		PageVO pageVo = new PageVO();
		SearchVO search = new SearchVO();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageVo);
		map.put("search", search);
		MvcResult result = mockMvc.perform(get("/memberList").requestAttr("pageVo", pageVo).requestAttr("search", search))
								   .andExpect(status().isOk())
								   .andExpect(view().name("tiles/member/memberList"))
								   .andDo(print())
								   .andReturn();
		ModelAndView mav = result.getModelAndView();
		Map<String, Object> resultMap = mav.getModel();
		assertEquals(8, ((List<MemberVO>)resultMap.get("memberList")).size());
		
		/***When***/

		/***Then***/
		
	}
	
	@Test
	public void regisViewTest() throws Exception {
		/***Given***/
		mockMvc.perform(get("/memberRegistView"))
			   .andExpect(status().isOk())
			   .andExpect(view().name("tiles/member/memberRegist"));
		/***When***/

		/***Then***/
	}
	
	@Test
	public void registMemberTest() throws Exception {
		/***Given***/
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/upload/sally.png");
		MockMultipartFile file = new MockMultipartFile("realFileNames", "sally.png", "image/png", is);
		
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("userId", "test03");
		map.add("userNm", "test");
		map.add("pass",	"test001");
		map.add("alias", "test");
		map.add("addr1", "test_addr1");
		map.add("addr2", "test_addr2");
		map.add("zipcode", "00000");
		
		mockMvc.perform(fileUpload("/memberRegist").file(file)
													.params(map))
				.andExpect(status().is3xxRedirection())
				.andDo(print())
				.andExpect(redirectedUrl("/memberList"));
		
		/***When***/

		/***Then***/
	}
	
	@Test
	public void memberViewTest() throws Exception {
		/***Given***/
		MvcResult result = mockMvc.perform(get("/memberView").param("userid", "test02"))
								   .andExpect(status().isOk())
								   .andExpect(view().name("tiles/member/memberView"))
								   .andReturn();
		Map<String, Object> modelMap = result.getModelAndView().getModel();
		String pass = ((MemberVO)modelMap.get("member")).getPass();
		assertEquals("test002", pass);

		/***When***/

		/***Then***/
	}
	
	@Test
	public void updateViewTest() throws Exception{
		/***Given***/
		MvcResult result = mockMvc.perform(get("/memberUpdateView").param("userid", "test02"))
				   .andExpect(status().isOk())
				   .andExpect(view().name("tiles/member/memberUpdate"))
				   .andReturn();
		Map<String, Object> modelMap = result.getModelAndView().getModel();
		String pass = ((MemberVO)modelMap.get("member")).getPass();
		assertEquals("test002", pass);
		

		/***When***/

		/***Then***/
	}
	
	@Test
	public void updateMemberTest() throws Exception {
		/***Given***/
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/upload/brown.png");
		MockMultipartFile file = new MockMultipartFile("realFileNames", "brown.png", "image/png", is);
		
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		//MemberVO member = new MemberVO("test02", "test2", "test002", "test2", "test_addr1", "test_addr2", "00000", "", "");
		map.add("userId", "test02");
		map.add("userNm", "test2");
		map.add("pass",	"test002");
		map.add("alias", "test2");
		map.add("addr1", "");
		map.add("addr2", "");
		map.add("zipcode", "");
		
		mockMvc.perform(fileUpload("/memberUpdate").file(file).params(map))
				.andExpect(status().is3xxRedirection())
				.andDo(print())
				.andExpect(redirectedUrl("/memberView?userid=test02"));

		/***When***/

		/***Then***/
	}
	

}
