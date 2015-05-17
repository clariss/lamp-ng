package slmStudio.tsMatrix;

import java.sql.ResultSet;
import slmStudio.tsDBConn.DAOMySQLDbConn;
import slmStudio.tsDBConn.DAODbSysException;

/**
 * @author Fabio Hofer
 * 
 */
public class MySQLMatrixDAO extends DAOMySQLDbConn implements MatrixDAO {
    
    public Matrix getMatrix(String matrixId) throws DAODbSysException {

        //Creates a string with the select statement
        //including where clause with schoolName parameter
        String selectStatement =
        "SELECT  A.ROWS, "
        +       "A.COLS "
        +       "FROM MATRIX A "
        +       "WHERE A.MATRIX_ID = \"" + matrixId + "\"";

        try {
            //adds message to log file
            //System.out.println("query will execute:" + selectStatement);
            //executes query
            ResultSet rs = st.executeQuery(selectStatement);
            int rows=0;
            int cols=0;
            while (rs.next()) {
                int i = 1;
                rows = Integer.parseInt(rs.getString(i++));
                cols = Integer.parseInt(rs.getString(i++));
             }
            Matrix ret = new Matrix(rows,cols);
            
            //close DB connection initiated by the super class
            con.close();
            //adds message to log file
            //System.out.println("Disconnected from database: " + System.currentTimeMillis());
            return ret;
        } catch (Exception e) {
            throw new DAODbSysException(e.getMessage());
        }
    }    
    
}
