package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import common.JDBCUtil;

public class UserDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private final String USER_GET = "select id, password from users where id=? and password=?";
    private final String USER_INSERT = "insert into users(id, password, name, role) values(?, ?, ?, ?)";

    public UserDO getUser(UserDO userObj) {
        UserDO user = null;

        try {
            System.out.println("===> JDBC로 getUser() 기능 처리됨 !");

            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(USER_GET);
            pstmt.setString(1, userObj.getId());
            pstmt.setString(2, userObj.getPassword());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new UserDO();
                user.setId(rs.getString("id"));
                user.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }
        return user;
    }

    public void insertUser(UserDO user) {
        try {
            System.out.println("===> JDBC로 insertUser() 기능 처리됨 !");
            System.out.println("UserDAO - ID: " + user.getId());
            System.out.println("UserDAO - Password: " + user.getPassword());
            System.out.println("UserDAO - Name: " + user.getName());
            System.out.println("UserDAO - Role: " + user.getRole());

            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(USER_INSERT);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getRole());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(pstmt, conn);
        }
    }
}
