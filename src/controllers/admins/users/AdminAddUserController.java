package controllers.admins.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDAO;
import models.User;

public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;

	public AdminAddUserController() {
		super();
		userDao = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		// VALIDATE DỮ LIỆU
		if ("".equals(username)) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg=1");
			rd.forward(request, response);
			return;
		}
		if ("".equals(password)) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg=2");
			rd.forward(request, response);
			return;
		}
		if ("".equals(fullname)) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg=3");
			rd.forward(request, response);
			return;
		}
		if (userDao.haveUser(username)) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg=4");
			rd.forward(request, response);
			return;
		}
		password = utils.StringUtil.md5(password);
		User item = new User(0, username, password, fullname);
		if (userDao.addItem(item) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=1");
			return;
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg=0");
			rd.forward(request, response);
			return;
		}
	}
}
