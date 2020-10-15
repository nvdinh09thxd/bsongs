package controllers.admins.song;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;

public class AdminIndexSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SongDAO songDao;

	public AdminIndexSongController() {
		super();
		songDao = new SongDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Song> listSong = songDao.findAll();
		request.setAttribute("listSong", listSong);
		request.getRequestDispatcher("/views/admin/song/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
