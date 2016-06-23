package com.full.bloodbank;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
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
import com.full.bloodbank.AdminPojo;

public class ForgotPassword extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		String email = req.getParameter("mailid");

		String pass = null;

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(AdminPojo.class);
		q.setFilter("mid == '" + email + "'");
		List<AdminPojo> adminList = (List<AdminPojo>) q.execute();

		Query q1 = pm.newQuery(WebSitePojo.class);
		q1.setFilter("mid == '" + email + "'");
		List<WebSitePojo> userList = (List<WebSitePojo>) q1.execute();

		if (!adminList.isEmpty()) {
			for (AdminPojo ws1 : adminList) {
				pass = ws1.getPass();
			}
		} else if (!userList.isEmpty()) {
			for (WebSitePojo ws1 : userList) {
				pass = ws1.getPass();
			}
		} else {
			pw.println("Sorry no match found");
		}

		String subject = "Password Details";
		String msgBody = "Dear user your password is " + " " + pass;
		Properties p = new Properties();
		p.put("mail.smtp.auth", "true"); // authentication purpose
		p.put("mail.smtp.host", "smtp.gmail.com"); // only gmail accout is
													// possible
		p.put("mail.smtp.port", 587); // default port id for smtp
		p.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getDefaultInstance(p,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(
								"prasanna.lakshman@a-cti.com", "Prassy@4268");
					}
				});

		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("prasanna.lakshman@a-cti.com",
					"Admin"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
					email));
			msg.setSubject(subject);
			msg.setText(msgBody);
			Transport.send(msg); // sends the msg using send() in Transport
									// class
			System.out.println("Sent");
		} catch (IOException e) {
			System.out.println(e);
		} catch (MessagingException e) {
			System.out.println(e);
		}

		res.sendRedirect("index.jsp");
		/*
		 * RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		 * rd.include(req,res);
		 */

	}

}
