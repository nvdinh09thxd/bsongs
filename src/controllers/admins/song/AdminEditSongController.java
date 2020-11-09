package controllers.admins.song;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.SongDAO;
import models.Category;
import models.Song;
import models.User;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminEditSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SongDAO songDao;

	public AdminEditSongController() {
		super();
		songDao = new SongDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ user được cấp quyền mới được phép sửa
		if (!userLogin.getGranted().getEdit()) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=5");
			return;
		}
		int songId = 0;
		try {
			songId = Integer.parseInt(request.getParameter("sid"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=4");
			return;
		}
		Song itemSong = songDao.findOne(songId);
		request.setAttribute("itemSong", itemSong);

		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ user được cấp quyền mới được phép sửa
		if (!userLogin.getGranted().getEdit()) {
			// không được phép
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=5");
			return;
		}
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		// lay cac gia tri khong phai la file
		String songName = request.getParameter("name");
		String description = request.getParameter("preview");
		String detail = request.getParameter("detail");
		int catId = Integer.parseInt(request.getParameter("catId"));
		int songId = Integer.parseInt(request.getParameter("sid"));
		// get dữ liệu cũ
		Song song = songDao.findOne(songId);
		if (song == null) {
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=4");
			return;
		}
		// xu ly upload file
		String fileName = FileUtil.upload("picture", request);
		// Nếu không chọn ảnh thì lấy lại ảnh cũ
		if (fileName == "") {
			fileName = song.getPicture();
		}
		// 1. tao doi tuong sau do luu cac thuoc tinh vao doi tuong
		// 2. viet phuong thuc edit table
		Song itemSong = new Song(songId, songName, description, detail, null, fileName, 0, new Category(catId, null));
		// update in database
		if (songDao.edit(itemSong) > 0) {
			// Nếu có chọn file và đã thực hiện thành công thì xóa file cũ đi
			if (request.getPart("picture").getSubmittedFileName() != "") {
				FileUtil.delFile(song.getPicture(), request);
			}
			response.sendRedirect(request.getContextPath() + "/admin/song/index?msg=2");
			return;
		}
		// Nếu có chọn file và sửa không thành công thì xóa file đã upload lên
		if (request.getPart("picture").getSubmittedFileName() != "") {
			FileUtil.delFile(fileName, request);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/edit.jsp?msg=0");
		rd.forward(request, response);
	}
}