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
import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

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
	
	//���� �Է�������(���)
			@RequestMapping("/update")
			public String update(Model model,int rid){
				model.addAttribute("vo",dao.updateread(rid));
				model.addAttribute("pageName", "review/update.jsp");
				
				return "/home";
			}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(ReviewVO vo,MultipartHttpServletRequest multi)throws Exception{
		System.out.println(".................file: "+vo.getRimage1());
		List<MultipartFile> fileList = multi.getFiles("uploadFile");
		int i = 0;
		System.out.println(".................if�� ����: "+vo.getRimage1());
		if(fileList.size() != 0){
			
				if(fileList.isEmpty()){
					System.out.println(".................if�� ����: "+vo.getRimage1());
					for(MultipartFile mf : fileList){
						String image = System.currentTimeMillis() + "_" + mf.getOriginalFilename();
							mf.transferTo(new File(path + image ));
							i++;
							System.out.println("..." + image + ":" + i + "��°" );
							
							if(i==1){
								vo.setRimage1(image);
								
							}
							if(i==2){
								vo.setRimage2(image);
							}	
					}
				}
			
		}
		
		dao.update(vo);
		System.out.println(vo.toString());
		return "redirect:/review/list";
	
	}
	//���� delete
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(int rid){
		dao.delete(rid);
	}
	//���� ����������
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "review/list.jsp");
	
		return "/home";
	}
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String,Object> readJOSN(Criteria cri){
		HashMap<String,Object> map = new HashMap<>();
		cri.setPerPageNum(3);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(dao.count());
		
		map.put("pm", pm);
		map.put("cri", cri);
		map.put("join", dao.join(cri));
		return map;
		
	}
	//���� �Է�������(���)
		@RequestMapping("/insert")
		public String insert(Model model,int pno, int bno,ReviewVO vo){
			model.addAttribute("vo",odao.read(pno,bno));
			model.addAttribute("pageName", "review/insert.jsp");
			
			return "/home";
		}
		@RequestMapping(value="/insert", method=RequestMethod.POST)
		public String insert(ReviewVO vo,MultipartHttpServletRequest multi)throws Exception{
			System.out.println(".................file: "+vo.getRimage1());
			List<MultipartFile> fileList = multi.getFiles("uploadFile");
			int i = 0;
			System.out.println(".................if�� ����: "+vo.getRimage1());
			if(fileList.size() != 0){
				
					if(fileList.isEmpty()){
						System.out.println(".................if�� ����: "+vo.getRimage1());
						for(MultipartFile mf : fileList){
							String image = System.currentTimeMillis() + "_" + mf.getOriginalFilename();
								mf.transferTo(new File(path + image ));
								i++;
								System.out.println("..." + image + ":" + i + "��°" );
								
								if(i==1){
									vo.setRimage1(image);
									
								}
								if(i==2){
									vo.setRimage2(image);
								}	
						}
					}
				
			}
			
			dao.insert(vo);
			System.out.println(vo.toString());
			return "redirect:/review/list";
			
		
		}
	//orderlist/review ��� json ������ ����
	@RequestMapping("/reviewable.json")
	@ResponseBody //�����͸� ����
	public HashMap<String,Object> reviewableJSON(Criteria cri, int bno){
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
	//���� ������
	//orderlist�� ���� user�� name�� �������� ����
	@RequestMapping("/reviewable")
	public String reviewable(Model model,Criteria cri){ //model�� ����ϰ����ϴ� �������� �����
		//model.addAttribute("name",udao.read(session.getAttribute("id").toString()));
		//session.setAttribute("username", "red"); //�α������α׷��ߴٰ� �����ߴ� �����ϰ�
		cri.setPerPageNum(5);
		//cri.setPage(1);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(odao.count(cri));

		model.addAttribute("pm", pm);
		model.addAttribute("page",cri.getPage());
		model.addAttribute("join" ,odao.join(cri));
		model.addAttribute("pageName", "review/reviewable.jsp");
	
		return "/home";
	}
}