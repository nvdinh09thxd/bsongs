package controllers.admins.cat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import models.Category;

public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminAddCatController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/cat/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CatDAO catDao = new CatDAO();
		String name = request.getParameter("name");
		Category cat = new Category(0, name);
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
