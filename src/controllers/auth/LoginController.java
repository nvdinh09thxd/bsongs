package controllers.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.UserDAO;
import models.User;
import utils.AuthUtil;
import utils.StringUtil;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDao;

	public LoginController() {
		super();
		userDao = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/admin/index");
			return;
		}
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// thong tin đăng nhap
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = StringUtil.md5(password);
		// kiểm tra login
		User userInfo = userDao.findUsernameAndPassword(username, password);
		if (userInfo != null) {
			// đăng nhập đúng => Lưu thông tin đăng nhập (session)
			HttpSession session = request.getSession();
			session.setAttribute("userLogin", userInfo);
			response.sendRedirect(request.getContextPath() + "/admin/index");
			return;
		}
		// đăng nhập sai
		response.sendRedirect(request.getContextPath() + "/auth/login?msg=0");
	}

}
