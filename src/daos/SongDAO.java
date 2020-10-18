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
		String sql = "SELECT s.*, c.name AS cname FROM songs s "
				+ "JOIN categories c ON s.cat_id = c.id ORDER BY s.id DESC";
		List<Song> list = new ArrayList<>();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Song song = new Song(rs.getInt("id"), rs.getString("name"), rs.getString("preview_text"),
						rs.getString("detail_text"), rs.getTimestamp("date_create"), rs.getString("picture"),
						rs.getInt("counter"), new Category(rs.getInt("cat_id"), rs.getString("cname")));
				list.add(song);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;
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

	public Song findOne(int id) {
		Song items = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*, c.name AS cname FROM songs s JOIN categories c ON s.cat_id = c.id WHERE s.id = ?";
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

	public int add(Song song) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO songs (name, preview_text, detail_text, picture, cat_id) VALUES (?, ?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, song.getName());
			pst.setString(2, song.getDescription());
			pst.setString(3, song.getDetail());
			pst.setString(4, song.getPicture());
			pst.setInt(5, song.getCat().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int del(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM songs WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int edit(Song itemSong) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET name = ?, preview_text = ?, detail_text = ?, picture = ?, cat_id = ? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, itemSong.getName());
			pst.setString(2, itemSong.getDescription());
			pst.setString(3, itemSong.getDetail());
			pst.setString(4, itemSong.getPicture());
			pst.setInt(5, itemSong.getCat().getId());
			pst.setInt(6, itemSong.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}
}
