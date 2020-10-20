package controllers.admins.song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;
import utils.FileUtil;

public class AdminDelSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SongDAO songDao;

	public AdminDelSongController() {
		super();
		songDao = new SongDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("sid"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=4");
			return;
		}

		// kiểm tra tin, nếu có ảnh thì xóa
		Song song = songDao.findOne(id);
		String picture = song.getPicture();

		if (songDao.del(id) > 0) {
			FileUtil.delFile(picture, request);
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=3");
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=0");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
