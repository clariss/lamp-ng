package slmStudio.tsDBConn;

/**
 *
 * @author Fabio Hofer
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public abstract class DAOMySQLDbConn {

    protected Statement st = null;
    protected Connection con = null;

    public DAOMySQLDbConn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost/costmodel2?" +
                                   "user=root&password=Pass1word";
            con = DriverManager.getConnection(connectionUrl);
            st = con.createStatement();
            //System.out.println("Connected to database: " + System.currentTimeMillis());
        } catch (Exception e) {
            throw new DAODbSysException(e.getMessage());
        }

    }
}
