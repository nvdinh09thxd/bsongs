package controllers.admins.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.GrantedDAO;
import daos.UserDAO;
import models.Granted;
import models.User;
import utils.AuthUtil;

public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;

	public AdminAddUserController() {
		super();
		userDao = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");

		// chỉ admin mới được thêm người dùng
		if (userLogin.getRole() != 1) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		}

		GrantedDAO grantedDAO = new GrantedDAO();
		List<Granted> listGranted = grantedDAO.findAll();

		request.setAttribute("listGranted", listGranted);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");

		// chỉ admin mới được thêm người dùng
		if (userLogin.getRole() != 1) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		}
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		int idGranted = Integer.parseInt(request.getParameter("idGranted"));
		GrantedDAO grantedDAO = new GrantedDAO();
		List<Granted> listGranted = grantedDAO.findAll();

		request.setAttribute("listGranted", listGranted);
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
		// Kiểm tra trùng username
		if (userDao.haveUser(username)) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg=4");
			rd.forward(request, response);
			return;
		}
		password = utils.StringUtil.md5(password);
		User item = new User(0, username, password, fullname, idGranted, null);
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
