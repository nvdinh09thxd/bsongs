package daos;

import java.sql.SQLException;

import models.Contact;
import utils.DBConnectionUtil;

public class ContactDAO extends AbstractDAO {

	public int addItem(Contact item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO contacts (name, email, website, message) VALUES (?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getEmail());
			pst.setString(3, item.getWebsite());
			pst.setString(4, item.getContent());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

}
