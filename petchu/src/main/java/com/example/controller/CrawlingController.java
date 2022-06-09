package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@RestController
@RequestMapping("/crawl")
public class CrawlingController {
	
	@RequestMapping("/hani.json")
	public Map<String,Object> hani(Criteria cri){
		Map<String,Object> hmap=new HashMap<>();
		List<Map<String,Object>> array= new ArrayList<>();
		try {
			ChromeOptions options=new ChromeOptions();
			options.addArguments("headless");
			System.setProperty("webdriver.chrome.driver","/Users/mission747s/downloads/chromedriver");
			WebDriver driver=new ChromeDriver(options);
			driver.get("https://www.hani.co.kr/arti/animalpeople/companion_animal/list1.html");
		      
		      	int paginationSize = 2;

		         Thread.sleep(2000);
		         int i=1;
		         for(int j = 1; j <= paginationSize; j++) {
		        	 String paginationSelector ="#section-left-scroll-in > div.paginate > a:nth-child("+j+")";
		        	 driver.findElement(By.cssSelector(paginationSelector)).click();
		        	 
		        	 List<WebElement> es = driver.findElements(By.cssSelector("#section-left-scroll-in > div.section-list-area > div.list"));
		        	 for(WebElement e : es){
		        		 
		        		 HashMap<String, Object> map = new HashMap<>();
		        		 String title = e.findElement(By.tagName("img")).getAttribute("title");
		        		 String link = e.findElement(By.tagName("a")).getAttribute("href");
		        		 String image = e.findElement(By.tagName("img")).getAttribute("src");
		        		 String content = e.findElement(By.cssSelector(".article-prologue a")).getText();	
		        		 String date = e.findElement(By.cssSelector("span.date")).getText();
		        		 
		        		 map.put("no", i);
		        		 map.put("title", title);
		        		 map.put("content", content);
		        		 map.put("link", link);
		        		 map.put("image", image);
		        		 map.put("date", date);   
		        		 array.add(map);
		        		 i++;
		        	 }
		        	 System.out.println(".......es.size:"+es.size());
		         }
		             
		         driver.quit(); //또는 driver.close();
   
			cri.setPerPageNum(15);
			PageMaker pm=new PageMaker();
			pm.setCri(cri);
			pm.setTotalCount(array.size());
			hmap.put("array",array);
			hmap.put("pm", pm);
		
		} catch (Exception e) {
			System.out.println("news error...."+e.toString());
		}
		return hmap;
		
	}
	
//	@RequestMapping("/hani.json")
//	public Map<String,Object> hani(Criteria cri){
//		Map<String,Object> hmap=new HashMap<>();
//		List<Map<String,Object>> array= new ArrayList<>();
//		try {
//			ChromeOptions options=new ChromeOptions();
//			options.addArguments("headless");
//			System.setProperty("webdriver.chrome.driver","/Users/mission747s/downloads/chromedriver");
//			WebDriver driver=new ChromeDriver(options);
//			
//			  driver.get("https://www.hani.co.kr/arti/animalpeople/companion_animal/home01.html");
//		      WebElement section = driver.findElement(By.className("article-area"));
//		      WebElement more = section.findElement(By.xpath("/html/body/div[3]/div[1]/div[1]/div/div/div[4]/a[11]"));
//		         more.click();
//		         
//		         Thread.sleep(2000);
//		         List<WebElement> es = driver.findElements(By.cssSelector("#section-left-scroll-in > div.section-list-area > div.list"));
//		         int i=1;
//		         for(WebElement e : es){
//		            HashMap<String, Object> map = new HashMap<>();
//		            String title = e.findElement(By.tagName("img")).getAttribute("title");
//		            String link = e.findElement(By.tagName("a")).getAttribute("href");
//		            String image = e.findElement(By.tagName("img")).getAttribute("src");
//		            String content = e.findElement(By.cssSelector(".article-prologue a")).getText();	
//		            String date = e.findElement(By.cssSelector("span.date")).getText();
//		            
//		            map.put("no", i);
//		            map.put("title", title);
//		            map.put("content", content);
//		            map.put("link", link);
//		            map.put("image", image);
//		            map.put("date", date);   
//		            array.add(map);
//		            i++;
//		         }
//		         System.out.println("es...");
//		         driver.quit(); //또는 driver.close();
//			
//			cri.setPerPageNum(5);
//			PageMaker pm=new PageMaker();
//			pm.setCri(cri);
//			pm.setTotalCount(array.size());
//			hmap.put("array",array);
//		hmap.put("pm", pm);
//			driver.quit();
//			System.out.println(".......es.size:"+es.size());
//			System.out.println(".......array:"+array);
//		} catch (Exception e) {
//			System.out.println("news error...."+e.toString());
//		}
//		return hmap;
//		
//	}
//	@RequestMapping("/cgv.json")
//	public Map<String,Object> cgv(Criteria cri){
//		Map<String,Object> hmap=new HashMap<>();
//		List<Map<String,Object>> array= new ArrayList<>();
//		try {
//			ChromeOptions options=new ChromeOptions();
//			options.addArguments("headless");
//			System.setProperty("webdriver.chrome.driver","/Users/mission747s/downloads/chromedriver");
//			WebDriver driver=new ChromeDriver(options);
//			
//			  driver.get("http://www.cgv.co.kr/movies/?lt=1&ft=0");
//		         WebElement content = driver.findElement(By.id("contents"));
//		         WebElement more = content.findElement(By.className("link-more"));
//		         more.click();
//		         
//		         Thread.sleep(2000);
//		         List<WebElement> es = driver.findElements(By.cssSelector(".sect-movie-chart ol li"));
//		         int i=1;
//		         for(WebElement e : es){
//		            HashMap<String, Object> map = new HashMap<>();
//		            String title = e.findElement(By.className("title")).getText();
//		            String image = e.findElement(By.tagName("img")).getAttribute("src");
//		            String link = e.findElement(By.cssSelector(".box-contents a")).getAttribute("href");
//		            String percent = e.findElement(By.cssSelector(".percent span")).getText();
//		            String date = e.findElement(By.cssSelector(".txt-info strong")).getText();
//		            String subDate = date.substring(0,11);
//		            
//		            map.put("no", i);
//		            map.put("title", title);
//		            map.put("image", image);
//		            map.put("link", link);
//		            map.put("percent", percent);
//		            map.put("date", subDate);
//		            
//		            array.add(map);
//		            i++;
//		         }
//		         driver.quit(); //또는 driver.close();
//			
//			cri.setPerPageNum(5);
//			PageMaker pm=new PageMaker();
//			pm.setCri(cri);
//			pm.setTotalCount(array.size());
//			hmap.put("array",array);
//			hmap.put("pm", pm);
//			driver.quit();
//			System.out.println("......."+es.size());
//		} catch (Exception e) {
//			System.out.println("cgv error...."+e.toString());
//		}
//		return hmap;
//		
//	}
}
