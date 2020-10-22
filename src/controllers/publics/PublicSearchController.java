package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;

public class PublicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SongDAO songDao;

	public PublicSearchController() {
		super();
		songDao = new SongDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		List<Song> listSong = songDao.getItems(name);
		request.setAttribute("songName", name);
		request.setAttribute("numberOfPages", 1);
		request.setAttribute("currentPage", 1);
		for (Song itemSong : listSong) {
			String songName = itemSong.getName();
			itemSong.setName(songName.replaceAll("(?i)" + name, "<b>" + name + "</b>"));
			// (?i) : thay thế không phân biệt hoa thường
		}
		request.setAttribute("listSong", listSong);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
