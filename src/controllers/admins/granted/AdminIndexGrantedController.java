package controllers.admins.granted;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.GrantedDAO;
import models.Granted;
import models.User;
import utils.AuthUtil;

@WebServlet("/admin/granted/index")
public class AdminIndexGrantedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexGrantedController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ admin mới được phân quyền
		if (userLogin.getRole() != 1) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/index");
			return;
		}
		GrantedDAO grantedDao = new GrantedDAO();
		List<Granted> listGranted = grantedDao.findAll();
		request.setAttribute("listGranted", listGranted);

		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/granted/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ admin mới được phân quyền
		if (userLogin.getRole() != 1) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/index");
			return;
		}

		GrantedDAO grantedDao = new GrantedDAO();
		String src = request.getParameter("asrc");
		int id = Integer.parseInt(request.getParameter("aid"));
		String colName = request.getParameter("aColName");
		PrintWriter out = response.getWriter();
		int idx = src.lastIndexOf("/");
		String firstName = src.substring(0, idx + 1);
		String lastName = src.substring(idx + 1);
		String fileName = "";

		if (lastName.equals("tick.png")) {
			fileName = firstName + "cancel.png";
			grantedDao.edit(colName, 0, id);
		} else {
			fileName = firstName + "tick.png";
			grantedDao.edit(colName, 1, id);
		}
		out.print(fileName);
	}

}
