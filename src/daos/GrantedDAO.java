package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Granted;
import utils.DBConnectionUtil;

public class GrantedDAO extends AbstractDAO {
	public List<Granted> findAll() {
		List<Granted> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM granted ORDER BY id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Granted granted = new Granted(rs.getInt("id"), rs.getString("name"), rs.getBoolean("addon"), rs.getBoolean("edit"), rs.getBoolean("del"));
				list.add(granted);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;
	}

	public void edit(String colName, int i, int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE granted SET " + colName + " = ?  WHERE id = ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, i);
			pst.setInt(2, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
	}
}
