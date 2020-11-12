package controllers.admins.song;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;
import models.User;
import utils.AuthUtil;

public class AdminIndexSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SongDAO songDao;
	CatDAO catDao;

	public AdminIndexSongController() {
		super();
		songDao = new SongDAO();
		catDao = new CatDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		List<Song> listSong = songDao.findAll();
		List<Category> listCat = catDao.findAll();
		request.setAttribute("listSong", listSong);
		request.setAttribute("listCat", listCat);
		request.getRequestDispatcher("/views/admin/song/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int catId = Integer.parseInt(request.getParameter("acatId"));
		List<Song> listSong;
		if (catId == 0) {
			listSong = songDao.findAll();
		} else {
			listSong = songDao.getItemsByCategory(catId);
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");

		if (listSong.size() > 0) {
			for (Song song : listSong) {
				String urlEdit = request.getContextPath() + "/admin/song/edit?sid=" + song.getId();
				String urlDel = request.getContextPath() + "/admin/song/del?sid=" + song.getId();
				String urlPicture = request.getContextPath() + "/uploads/images/";
				urlPicture += !"".equals(song.getPicture()) ? song.getPicture() : "no-image.jpg";
				out.print("<tr>");
				out.print("<td>" + song.getId() + "</td>");
				out.print("<td class='center'>" + song.getName() + "</td>");
				out.print("<td class='center'>" + song.getCat().getName() + "</td>");
				out.print("<td class='center'>" + song.getCounter() + "</td>");
				out.print("<td class='center'><img width='200px' height='200px' src=" + urlPicture + " alt="
						+ urlPicture + " />");
				String styleButton = !userLogin.getGranted().getEdit() && !userLogin.getGranted().getDel()
						? "style='display: none'"
						: "";
				String styleEdit = !userLogin.getGranted().getEdit() ? "style='display: none'" : "";
				String styleDel = !userLogin.getGranted().getDel() ? "style='display: none'" : "";
				out.print("</td>");
				out.print("<td class='center' " + styleButton + ">");
				out.print("<a href=" + urlEdit + " title='Sửa' class='btn btn-primary' " + styleEdit
						+ "><i class='fa fa-edit '></i> Sửa</a>");
				out.print("<a href=" + urlDel
						+ " title='Xóa' class='btn btn-danger' onclick=\"return confirm('Bạn có chắc chắn muốn xóa không?')\" "
						+ styleDel + ">" + "<i class='fa fa-pencil'></i>Xóa</a>");
				out.print("</td>");
				out.print("</tr>");
			}
		}
	}
}
