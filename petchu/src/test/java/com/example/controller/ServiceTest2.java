package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.dao.DoctorDAO;
import com.example.dao.DoctorRequestDAO;
import com.example.dao.MysqlDAO;
import com.example.dao.RateDAO;
import com.example.dao.ReserveDAO;
import com.example.dao.UserDAO;
import com.example.dao.UserRequestDAO;
import com.example.domain.DoctorRequestVO;
import com.example.domain.RateVO;
import com.example.domain.ReserveVO;

@RunWith(SpringJUnit4ClassRunner.class)  //SpringJUnit4ClassRunner.class를 먼저 import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ServiceTest2 {
    @Autowired
    private UserDAO dao;
    
    @Test
    public void getTime(){
    	
    	dao.chartPrice();
    }
}
