package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import utils.DBConnectionUtil;

public class CatDAO extends AbstractDAO {
	public List<Category> findAll() {
		List<Category> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT id, name FROM categories ORDER BY id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Category cat = new Category(rs.getInt("id"), rs.getString("name"));
				list.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// response.sendRidrect... (ve nha xu ly)
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;
	}

	public int add(Category cat) {
		int results = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO categories (name) VALUES (?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, cat.getName());
			results = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return results;
	}

	public int del(int id) {
		int results = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM categories WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			results = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return results;
	}

	public Category findItem(int id) {
		Category cat = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT id, name FROM categories WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				cat = new Category(rs.getInt("id"), rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return cat;
	}

	public int edit(Category cat) {
		int results = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE categories SET name = ? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, cat.getName());
			pst.setInt(2, cat.getId());
			results = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return results;
	}
}
