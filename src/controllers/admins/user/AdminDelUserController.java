package controllers.admins.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.UserDAO;
import models.User;
import utils.AuthUtil;

public class AdminDelUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelUserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=4");
			return;
		}
		UserDAO userDao = new UserDAO();

		User user = userDao.getItem(id);
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if ("admin".equals(user.getUsername())) {
			// không được phép xóa admin
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		} else {
			if ("admin".equals(userLogin.getUsername())) {
				// được phép xóa
				if (userDao.delItem(id) > 0) {
					response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=3");
					return;
				} else {
					response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=0");
					return;
				}

			} else {
				// không được phép
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
