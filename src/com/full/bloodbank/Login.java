package com.full.bloodbank;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.full.bloodbank.PMF;
import com.full.bloodbank.AdminPojo;

public class Login extends HttpServlet {
	
protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		
		res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        
        String usrname = req.getParameter("username");
        String psd = req.getParameter("password");
      
        
        PersistenceManager pm= PMF.get().getPersistenceManager();

        Query q = pm.newQuery(AdminPojo.class,"uname == '"+usrname+"' && pass == '"+psd+"'"); 
	
        List<AdminPojo> lst = (List<AdminPojo>)q.execute();
   	 if(!lst.isEmpty()){
   		HttpSession session = req.getSession();
   		session.setAttribute("username", usrname);
   		session.setMaxInactiveInterval(2*60*60);
        Cookie userName = new Cookie("username", usrname);
        res.addCookie(userName);
   		//res.sendRedirect("homepage.jsp");
   		 RequestDispatcher rd = req.getRequestDispatcher("homepage.jsp");
   		 rd.forward(req,res);
   		 
   	 }
   	 
   	 else{
   		// req.setAttribute("msg", "Invalid username or password");
   		 res.getWriter().write("Invaild username or password");
   		 //res.sendRedirect("index.jsp");
   		 RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
   		 rd.include(req,res);
   	 }
   		 
	}
	



}
