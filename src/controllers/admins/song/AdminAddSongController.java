package controllers.admins.song;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminAddSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CatDAO catDao;
	SongDAO songDao;

	public AdminAddSongController() {
		super();
		catDao = new CatDAO();
		songDao = new SongDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		List<Category> listCat = catDao.findAll();
		request.setAttribute("listCat", listCat);
		request.getRequestDispatcher("/views/admin/song/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String name = request.getParameter("name");
		int catId = Integer.parseInt(request.getParameter("category"));
		String description = request.getParameter("preview");
		String detail = request.getParameter("detail");
		// upload file
		String fileName = FileUtil.upload("picture", request);
		// insert db
		Song song = new Song(name, description, detail, fileName, new Category(catId));
		if (songDao.add(song) > 0) {
			// thành công
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=1");
			return;
		}
		// thất bại
		FileUtil.delFile(fileName, request);
		request.getRequestDispatcher("/views/admin/song/add.jsp").forward(request, response);
	}

}
