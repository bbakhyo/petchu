package com.example.controller;

import java.io.Console;
import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.OrderlistDAO;
import com.example.dao.ProductDAO;
import com.example.dao.ReviewDAO;
import com.example.dao.UserDAO;
import com.example.domain.Criteria;
import com.example.domain.OrderlistVO;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.domain.ReviewVO;
import com.example.domain.shopproductVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ReviewDAO dao;
	
	@Autowired
	OrderlistDAO odao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	ProductDAO pdao;
	
	@Resource(name="uploadPath")
	String path;

	//리뷰 입력페이지
		@RequestMapping("/insert")
		public String insert(Model model,int pno, int bno){
			model.addAttribute("vo",odao.read(pno,bno));
			model.addAttribute("rvo",dao.list(bno));
			model.addAttribute("pageName", "review/insert.jsp");
			return "/home";
		}
	//orderlist/review 목록 json 데이터 생성
	@RequestMapping("/list.json")
	@ResponseBody //데이터를 리턴
	public HashMap<String,Object> listJSON(Criteria cri, int bno){
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(odao.count(cri));
		
		map.put("pm", pm);
		map.put("review", dao.list(bno));
		map.put("join", odao.join(cri));
		return map;

	}
	//리뷰 페이지
	//orderlist의 값과 user의 name을 가져오고 싶음
	@RequestMapping("/list")
	public String list(Model model,Criteria cri){ //model에 출력하고자하는 페이지를 담아줌
		//model.addAttribute("name",udao.read(session.getAttribute("id").toString()));
		//session.setAttribute("username", "red"); //로그인프로그램했다고 가정했다 생각하고
		cri.setPerPageNum(5);
		//cri.setPage(1);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(odao.count(cri));

		
		model.addAttribute("pm", pm);
		model.addAttribute("page",cri.getPage());
		model.addAttribute("join" ,odao.join(cri));
		model.addAttribute("pageName", "review/list.jsp");
	
		return "/home";
	}
	//리뷰 페이지
		@RequestMapping("/reviewable")
		public String reviewable(Model model,int bno){
			
			model.addAttribute("list",dao.list(bno));
			model.addAttribute("pageName", "review/reviewable.jsp");
			return "/home";
		}
	
	
	//파일업로드페이지
	@RequestMapping("/fileupload")
	public String fileupload(Model model){
		model.addAttribute("pageName", "review/fileupload.jsp");
		return "/home";
	}
	//이거 수정해야함
	@ResponseBody
	@RequestMapping(value="/fileupload", method=RequestMethod.POST)
	public String fileuploadPost(@RequestParam("article_file")List<MultipartFile> multi,
	HttpServletRequest request){
		String strResult = "{\"result\":\"FAIL\"}";
		System.out.println(strResult+"..");
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
			try{
				if(multi.size()>0 && !multi.get(0).getOriginalFilename().equals("")){
					for(MultipartFile file:multi){
						fileRoot = path;
						System.out.println(fileRoot);
						String originFileName = file.getOriginalFilename();
						String extension = originFileName.substring(originFileName.lastIndexOf("."));
						//저장될 파일명
						String saveFileName ="review/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
						//이거 이해안됨
						File targetFile = new File(fileRoot+saveFileName);
						try{
							InputStream fileStream = file.getInputStream();
							//파일저장
							FileUtils.copyInputStreamToFile(fileStream, targetFile);
						}catch(Exception e){
							//파일 삭제
							FileUtils.deleteQuietly(targetFile);
							//저장된 현재 파일 삭제
							e.printStackTrace();
							break;
						}
					}
					strResult = "{\"result\" : \"OK\" }";
				}
				//파일 첨부 안했을 때
				else{
					strResult = "{\"result\" : \"OK\"}";
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		return strResult;
		
			
	}
	
	
}