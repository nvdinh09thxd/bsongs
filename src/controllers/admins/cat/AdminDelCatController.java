package controllers.admins.cat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import utils.AuthUtil;

public class AdminDelCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelCatController() {
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
		int add = catDao.del(id);
		if (add > 0) {
			// thành công
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=3");
			return;
		}
		// thất bại
		response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=0");
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
