package com.full.bloodbank;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jdo.Query;

public class FindDonor extends HttpServlet {
	
protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		
	String dates = req.getParameter("a");
	
	PersistenceManager pm= PMF.get().getPersistenceManager();
	
	Query q = pm.newQuery(DonatePojo.class,"date1 == '"+dates+"'");
	
	List<DonatePojo> lst = (List<DonatePojo>)q.execute(dates);
	
	if(!lst.isEmpty()){
		
		for(DonatePojo dp : lst){
			
			String name1 = dp.getName();
			String bg = dp.getBgroup();
			String area = dp.getAreas();
			String date = dp.getDate1();
			
			
			/*pw.println("Donor Name is"+" "+"<tr><td>"+name1+"</td></tr><br>");
			pw.println("Blood Group is"+" "+"<tr><td>"+bg+"</td></tr><br>");
			pw.println("Area is"+" "+"<tr><td>"+area+"</td></tr><br>");
			pw.println("Donated date is"+" "+"<tr><td>"+date+"</td></tr>");*/
			
			
			pw.println("<html>");
			/*pw.println("<P ALIGN='center'><TABLE BORDER=1>");
			pw.println("<TR>");
			pw.println("<TD>"+"Donor Name"+"</TD>");
			pw.println("<TD>"+"Blood Group"+"</TD>");
			pw.println("<TD>"+"Area is"+"</TD>");
			pw.println("<TD>"+"Donated Date"+"</TD>");
			pw.println("</TR>");

			pw.println("<TR>");
			pw.println("<TD>" + name1 +"</TD>");
			pw.println("<TD>" + bg + "</TD>");
			pw.println("<TD>" + area + "</TD>");
			pw.println("<TD>" + date + "</TD>");
			pw.println("</TR>");

			pw.println("</TABLE></P>");*/
			
			pw.println("Name: <input type='text' name='n1' value='"+ name1 +"' ><br><br>");
			
			pw.println("BloodGroup: <input type='text' name='n1' value='"+ bg +"' style='border:none' ><br><br>");
			
			pw.println("Area: <input type='text' name='n1' value='"+ area +"' ><br><br>");
			
			pw.println("Date: <input type='text' name='n1' value='"+ date +"' >");
			
			pw.println("</html>");
			
			ServletContext con=getServletContext();
			con.setAttribute("names", name1);
			con.setAttribute("bloodgrp", bg);
			con.setAttribute("areas", area);
			con.setAttribute("date", date);
			
			//System.out.println("Donated date is"+" "+"<tr><td>"+date+"</td></tr>");
		}
		
		
	}
	else{
		pw.println("Sorry no match found");
	}
	
	
	}

}

