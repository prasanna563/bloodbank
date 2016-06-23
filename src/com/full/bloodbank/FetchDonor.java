package com.full.bloodbank;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jdo.Query;

public class FetchDonor extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		PrintWriter pw = res.getWriter();

		String bgrp = req.getParameter("bg");

		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Query q = pm.newQuery(BloodGroupPojo.class, " bgroup == '" + bgrp + "'");

			List<BloodGroupPojo> lst = (List<BloodGroupPojo>) q.execute(bgrp);

			for (BloodGroupPojo bgp : lst) {

				int oldCount = bgp.getCount();
				if (oldCount != 0) {
					String length = String.valueOf(oldCount);
					pw.write(length);
					res.setContentType("text/plain"); // Set content type of the
														// response so that
														// jQuery
														// knows what it can
														// expect.
					res.setCharacterEncoding("UTF-8");

				}

				else {

					res.getWriter().write("Sorry No match found");

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pw.close();
			pm.close();
		}

	}

}
