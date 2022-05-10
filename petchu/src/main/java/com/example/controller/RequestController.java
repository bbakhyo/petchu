package com.example.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.BeautyDAO;
import com.example.dao.CleaningDAO;
import com.example.dao.DoctorDAO;
import com.example.dao.DoctorRequestDAO;
import com.example.dao.LessonDAO;
import com.example.dao.PointhistoryDAO;
import com.example.dao.ServiceCoDAO;
import com.example.dao.UserDAO;
import com.example.dao.UserRequestDAO;
import com.example.domain.DoctorRequestVO;
import com.example.domain.DoctorVO;
import com.example.domain.PointhistoryVO;
import com.example.domain.UserRequestVO;

@Controller
@RequestMapping("/request")
public class RequestController {
	@Resource(name="uploadPath")
	String  path;
		
	@Autowired
	UserRequestDAO dao;
	
	@Autowired
	DoctorDAO ddao;

	//포인트 추가
	@Autowired
	PointhistoryDAO phdao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	BeautyDAO bdao;
	
	@Autowired
	CleaningDAO cdao;
	
	@Autowired
	LessonDAO ldao;
	
	@Autowired
	ServiceCoDAO scdao;
	
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String send(UserRequestVO vo, HttpSession session, MultipartHttpServletRequest multi) throws Exception{
		List<MultipartFile> fileList = multi.getFiles("uploadFile");
		int i=0;
		if(fileList.size()!=0){
			for(MultipartFile mf : fileList){
				String image = "request/user/" + System.currentTimeMillis() + "_" + mf.getOriginalFilename();
				
				mf.transferTo(new File(path + image));
				i++;
				System.out.println("갸아아아아아아악" + image + ":" + i + "번째");
				if(i==1){
					vo.setDimg1(image);
				}
				if(i==2){
					vo.setDimg2(image);
				}
				if(i==3){
					vo.setDimg3(image);
				}if(i==4){
					vo.setDimg4(image);
				}
			}
			
		}
		
		dao.sendRequest(vo);
		
		//포인트추가
		PointhistoryVO phvo = new PointhistoryVO();
		phvo.setId(session.getAttribute("id").toString());
		phvo.setAmount(500);
		phvo.setContent("견적서작성");
		
		udao.updatePoint(500, session.getAttribute("id").toString());
		phdao.insertPH(phvo);
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/list")
	public String requestList(Model model){
		model.addAttribute("list", dao.requestList());
		System.out.println("1111111111111");
		model.addAttribute("pageName", "user/doctor/receRequestList.jsp");
		return "/home";
	}
	
	//서비스 요청서 리스트
	@RequestMapping(value="/servicelist")
	public String serviceRequestList(Model model, HttpSession session){
		model.addAttribute("beautyList", bdao.beautyList());
		model.addAttribute("cleanList", cdao.cleanList());
		model.addAttribute("lessonList", ldao.lessonList());
		model.addAttribute("pageName", "service/sclist.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/read")
	public String receRequest(Model model, int rno, HttpSession session){
		model.addAttribute("hospital", ddao.selectDno(session.getAttribute("id").toString()));
		model.addAttribute("vo", dao.receRequest(rno));
		model.addAttribute("pageName", "user/doctor/receRequest.jsp");
		return "/home";
	}
	
	@Autowired
	DoctorRequestDAO drdao;
	
	@RequestMapping(value="/result")
	public String resultRequestList(Model model, HttpSession session){
		model.addAttribute("list", drdao.resultRequestList(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "user/resultRequestList.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/resultread")
	public String resultRequest(Model model, int drno){
		model.addAttribute("vo", drdao.resultRequest(drno));
		model.addAttribute("pageName", "user/resultRequest.jsp");
		return "/home";
	}
	
	@ResponseBody
	@RequestMapping(value="doctorinfo")
	public DoctorVO doctorinfo(int dno){
		return ddao.hospital(dno);
	}
	
	@ResponseBody
	@RequestMapping(value="regdatechk")
	public List<UserRequestVO> regdatechk(int pno){
		return dao.regdatechk(pno);
	}
	
}
