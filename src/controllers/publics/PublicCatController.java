package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;

public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CatDAO catDao;
	SongDAO songDao;

	public PublicCatController() {
		super();
		catDao = new CatDAO();
		songDao = new SongDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}

		Category itemCat = catDao.findItem(id);
		if (itemCat == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		request.setAttribute("itemCat", itemCat);

		List<Song> listSongByCategory = songDao.getItemsByCategory(id);
		request.setAttribute("listSongByCategory", listSongByCategory);

		RequestDispatcher rd = request.getRequestDispatcher("/views/public/cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
