package controllers.admins.cat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CatDAO;
import models.Category;
import models.User;
import utils.AuthUtil;

public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminAddCatController() {
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
		// chỉ user được cấp quyền mới được phép thêm
		if (!userLogin.getGranted().getAdd()) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=5");
			return;
		}
		request.getRequestDispatcher("/views/admin/cat/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ user được cấp quyền mới được phép thêm
		if (!userLogin.getGranted().getAdd()) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=5");
			return;
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		CatDAO catDao = new CatDAO();
		String name = request.getParameter("name");
		Category cat = new Category(0, name);
		if ("".equals(name)) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/add?err=1");
			return;
		}
		int add = catDao.add(cat);
		if (add > 0) {
			// thành công
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=1");
			return;
		}
		// thất bại
		request.setAttribute("cat", cat);
		request.getRequestDispatcher("/views/admin/cat/add.jsp?err=0").forward(request, response);
	}

}
