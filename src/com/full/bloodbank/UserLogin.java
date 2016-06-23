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
import com.full.bloodbank.WebSitePojo;

public class UserLogin extends HttpServlet {
	
protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		
		res.setContentType("text/html");
		
		 PrintWriter pw = res.getWriter();
		 PersistenceManager pm= PMF.get().getPersistenceManager();
		
		 try{
       
        String usrname = req.getParameter("username");
        String psd = req.getParameter("password");
      
        Query q = pm.newQuery(WebSitePojo.class,"uname == '"+usrname+"' && pass == '"+psd+"'"); 
        
        List<WebSitePojo> lst = (List<WebSitePojo>)q.execute();
       
   	 if(!lst.isEmpty()){
   		 HttpSession session = req.getSession();
   		session.setAttribute("name", usrname);
   		session.setMaxInactiveInterval(2*60*60);
        Cookie userName = new Cookie("name", usrname);
        res.addCookie(userName);
   		res.sendRedirect("homepage.jsp");
   		
   	 }
   	 
   	 else{
   		
   		
        //res.sendRedirect("index.jsp");
   		RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
   		rd.include(req, res);
   		pw.println("<script type=\"text/javascript\">");
   		pw.println("alert(\'User or password incorrect\');");
   		pw.println("</script>");
   		
   	 }
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
		 finally{
			pw.close();
			pm.close();
		}
   		 
	}
	


}
