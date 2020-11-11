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

public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;

	public AdminEditUserController() {
		super();
		userDao = new UserDAO();
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
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if ((userLogin.getRole() == 1) || (id == userLogin.getId())) {
			// chỉ có admin hoặc chính người dùng đó đăng nhập mới được phép sửa
			User itemUser = userDao.getItem(id);
			GrantedDAO grantedDAO = new GrantedDAO();
			List<Granted> listGranted = grantedDAO.findAll();

			if (itemUser != null) {
				request.setAttribute("listGranted", listGranted);
				request.setAttribute("itemUser", itemUser);
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp");
				rd.forward(request, response);
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=4");
				return;
			}

		} else {
			// không có quyền
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if ((userLogin.getRole() == 1) || (id == userLogin.getId())) {
			// chỉ có admin hoặc chính người dùng đó đăng nhập mới được phép sửa
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String fullname = request.getParameter("fullname");
			int idGranted = 0;
			try {
				idGranted = Integer.parseInt(request.getParameter("idGranted"));
			} catch (Exception e) {}
			User user = userDao.getItem(id);
			if (userLogin.getRole() != 1)
				idGranted = user.getRole();
			GrantedDAO grantedDAO = new GrantedDAO();
			List<Granted> listGranted = grantedDAO.findAll();

			request.setAttribute("listGranted", listGranted);
			request.setAttribute("idGranted", idGranted);
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
			password = utils.StringUtil.md5(password);
			User userEdit = new User(id, username, password, fullname, idGranted,
					new Granted(user.getGranted().getId(), user.getGranted().getName(), user.getGranted().getAdd(),
							user.getGranted().getEdit(), user.getGranted().getDel()));
			if (userDao.editItem(userEdit) > 0) {
				// cập nhật thông tin userLogin
				if (userLogin.getRole() != 1 || username.equals(userLogin.getUsername())) {
					session.setAttribute("userLogin", userEdit);
				}
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=2");
				return;
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp?msg=0");
				rd.forward(request, response);
			}
		} else {
			// không có quyền
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		}
	}

}
