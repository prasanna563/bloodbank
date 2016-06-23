package com.full.bloodbank;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.full.bloodbank.PMF;
import com.full.bloodbank.WebSitePojo;


public class SignUp extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
   
        String fname = req.getParameter("firstname");
		String lname = req.getParameter("lastname");
		String uname = req.getParameter("username");
		String mailid = req.getParameter("email");
		String paswd = req.getParameter("password");
		String genders = req.getParameter("gender");
		String bgroup = req.getParameter("bloodgroup");
		String txtarea = req.getParameter("texta");
        String phone = req.getParameter("phonenumber");
        String subject = "Congratulations";
		String msgBody = "Dear " + fname + " "+ lname + " your account has been created successfully"; 
		Properties p=new Properties();
		p.put("mail.smtp.auth","true"); //authentication purpose 
		p.put("mail.smtp.host","smtp.gmail.com"); //only gmail accout is possible
		p.put("mail.smtp.port",587); //default port id for smtp
		p.put("mail.smtp.starttls.enable","true"); 
		Session session = Session.getDefaultInstance(p,new javax.mail.Authenticator() 
		{
		protected PasswordAuthentication getPasswordAuthentication()
		{
		return new PasswordAuthentication("prasanna.lakshman@a-cti.com","Prassy@4268");
		}
		});
		
        WebSitePojo ws = new WebSitePojo();
        ws.setFname(fname);
        ws.setLname(lname);
        ws.setUname(uname);
        ws.setMid(mailid);
        ws.setPass(paswd);
        ws.setGendr(genders);
        ws.setBgroup(bgroup);
        ws.setAddr(txtarea);
	    ws.setPhonenum(phone);
	    try 
		{
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress("prasanna.lakshman@a-cti.com","Admin"));
		msg.addRecipient(Message.RecipientType.TO,new InternetAddress(mailid));
		msg.setSubject(subject);
		msg.setText(msgBody);
		Transport.send(msg); //sends the msg using send() in Transport class
		System.out.println("Sent");
		} 
		catch (IOException e)
		{
		System.out.println(e);
		} 
		catch (MessagingException e)
		{
		System.out.println(e);
		}
		
	    PersistenceManager pm= PMF.get().getPersistenceManager();
		pm.makePersistent(ws);
		
		res.sendRedirect("index.jsp");
		/*RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
  		 rd.include(req,res);*/
		
  }
	
}	
