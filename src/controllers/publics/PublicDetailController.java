package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.SongDAO;
import models.Song;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SongDAO songDao;

	public PublicDetailController() {
		super();
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

		Song itemSong = songDao.findItem(id);
		if (itemSong == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		// tăng lượt view
		HttpSession session = request.getSession();
		String hasVisited = (String) session.getAttribute("hasVisited: " + id);
		if (hasVisited == null) {
			session.setAttribute("hasVisited: " + id, "yes");
			session.setMaxInactiveInterval(3);
			// increase page view
			songDao.increaseView(id);
		}

		List<Song> relatedSongs = songDao.getRelatedItems(itemSong, 2);

		request.setAttribute("itemSong", itemSong);
		request.setAttribute("relatedSongs", relatedSongs);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
