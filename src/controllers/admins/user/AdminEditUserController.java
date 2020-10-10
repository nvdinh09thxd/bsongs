package controllers.admins.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDAO;
import models.User;

public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;

	public AdminEditUserController() {
		super();
		userDao = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=4");
			return;
		}
		User itemUser = userDao.getItem(id);
		request.setAttribute("itemUser", itemUser);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));

			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String fullname = request.getParameter("fullname");
			// VALIDATE DỮ LIỆU
			if ("".equals(username)) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp?msg=1");
				rd.forward(request, response);
				return;
			}
			if ("".equals(password)) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp?msg=2");
				rd.forward(request, response);
				return;
			}
			if ("".equals(fullname)) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp?msg=3");
				rd.forward(request, response);
				return;
			}
			if (userDao.haveUser(username)) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp?msg=4");
				rd.forward(request, response);
				return;
			}
			password = utils.StringUtil.md5(password);
			User item = new User(id, username, password, fullname);
			if (userDao.editItem(item) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=2");
				return;
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp?msg=0");
				rd.forward(request, response);
			}
	}

}
