package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Song;
import utils.DBConnectionUtil;

public class SongDAO extends AbstractDAO {
	public List<Song> findAll() {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cname FROM songs s JOIN categories c ON s.cat_id = c.id ORDER BY id DESC";
		List<Song> listItems = new ArrayList<>();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Song ObjItem = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cname")));
				listItems.add(ObjItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listItems;
	}

	public List<Song> getItems(int number) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cname FROM songs s JOIN categories c ON s.cat_id = c.id ORDER BY id DESC LIMIT ?";
		List<Song> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, number);
			rs = pst.executeQuery();
			while (rs.next()) {
				Song ObjItem = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cname")));
				listItems.add(ObjItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public List<Song> getItemsByCategory(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cname FROM songs AS s JOIN categories AS c ON s.cat_id=c.id WHERE cat_id = ?";
		List<Song> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Song ObjItem = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cname")));
				listItems.add(ObjItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public Song findItem(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cname FROM songs s JOIN categories c ON s.cat_id = c.id WHERE s.id=?";
		Song items = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				items = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return items;
	}

	public void increaseView(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET counter = counter + 1 WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
	}

	public List<Song> getRelatedItems(Song itemSong, int i) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cname FROM songs s JOIN categories c ON s.cat_id=c.id WHERE  cat_id = ? AND s.id != ? LIMIT ?";
		ArrayList<Song> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, itemSong.getCat().getId());
			pst.setInt(2, itemSong.getId());
			pst.setInt(3, i);
			rs = pst.executeQuery();
			while (rs.next()) {
				Song ObjItem = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cname")));
				listItems.add(ObjItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}
}
