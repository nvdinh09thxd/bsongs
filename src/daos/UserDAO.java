package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Granted;
import models.User;
import utils.DBConnectionUtil;

public class UserDAO extends AbstractDAO {

	public List<User> findAll() {
		List<User> lists = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, username, password, fullname, role, g.name, g.addon, g.edit, g.del FROM users u"
				+ " JOIN granted g ON u.role = g.id  ORDER BY id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				User user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getInt("role"),
						new Granted(rs.getInt("id"), rs.getString("name"), rs.getBoolean("addon"), rs.getBoolean("edit"), rs.getBoolean("del")));
				;
				lists.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return lists;
	}

	public User getItem(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, username, password, fullname, role, g.name, g.addon, g.edit, g.del FROM users u"
				+ " JOIN granted g ON u.role = g.id WHERE u.id = ?";
		User item = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				item = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getInt("role"),
						new Granted(rs.getInt("id"), rs.getString("name"), rs.getBoolean("addon"), rs.getBoolean("edit"), rs.getBoolean("del")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return item;
	}

	public User findUsernameAndPassword(String username, String password) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, username, password, fullname, role, g.name, g.addon, g.edit, g.del FROM users u"
				+ " JOIN granted g ON u.role = g.id WHERE username = ? AND password = ?";
		User item = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				item = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getInt("role"),
						new Granted(rs.getInt("id"), rs.getString("name"), rs.getBoolean("addon"), rs.getBoolean("edit"), rs.getBoolean("del")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return item;
	}

	public int addItem(User item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO users (username, password, fullname, role) VALUES (?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getUsername());
			pst.setString(2, item.getPassword());
			pst.setString(3, item.getFullname());
			pst.setInt(4, item.getRole());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int editItem(User item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE users SET username = ?, password = ?, fullname = ?, role = ? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getUsername());
			pst.setString(2, item.getPassword());
			pst.setString(3, item.getFullname());
			pst.setInt(4, item.getRole());
			pst.setInt(5, item.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int delItem(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM users WHERE id = ?";
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

	public boolean haveUser(String username) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM users WHERE username = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return false;
	}
}
