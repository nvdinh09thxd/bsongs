package controllers.admins.cat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import models.Category;
import utils.AuthUtil;

public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditCatController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		CatDAO catDao = new CatDAO();
		int id = Integer.parseInt(request.getParameter("cid"));
		Category cat = catDao.findItem(id);
		request.setAttribute("cat", cat);
		request.getRequestDispatcher("/views/admin/cat/edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CatDAO catDao = new CatDAO();
		int id = Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		Category cat = new Category(id, name);
		request.setAttribute("cat", cat);
		if("".equals(name)) {
			request.getRequestDispatcher("/views/admin/cat/edit.jsp?err=1").forward(request, response);
			return;
		}
		int edit = catDao.edit(cat);
		if (edit > 0) {
			// thành công
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=2");
			return;
		}
		// thất bại
		request.getRequestDispatcher("/views/admin/cat/edit.jsp?err=0").forward(request, response);
	}

}
