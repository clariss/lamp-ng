package slmStudio.tsDimension;

import java.sql.ResultSet;
import slmStudio.tsDBConn.DAOMySQLDbConn;
import slmStudio.tsDBConn.DAODbSysException;
import slmStudio.tsMatrix.Matrix;
import slmStudio.tsMatrix.MySQLMatrixDAO;

/**
 * @author Fabio Hofer
 * 
 */
public class MySQLDimensionDAO extends DAOMySQLDbConn implements DimensionDAO {


    
    public DimensionTO getDimension(String itemId) throws DAODbSysException {

        //Creates a string with the select statement
        //including where clause with schoolName parameter
        String selectStatement =
        "SELECT  A.ROW, "
        +       "A.COL, "
        +       "A.DESC "
        +       "FROM DIMENSION A "
        +       "WHERE A.DIMENSION_ID = \"" + itemId + "\"";

        //Creates an empty list of type <NewsTO> that will be
        //populated and returned to the web-service
        
        
        MySQLMatrixDAO matrixSQL = new MySQLMatrixDAO();
        Matrix matrix = matrixSQL.getMatrix(itemId);
        String[][] sVal; 
        sVal = new String[matrix.getM()][matrix.getN()]; 
        try {
            //adds message to log file
            //System.out.println("query will execute:" + selectStatement);
            //executes query
            ResultSet rs = st.executeQuery(selectStatement);
            //loop to populate the list
            //Matrix A = new Matrix(1, 9);
            
            while (rs.next()) {
                int i = 1;
                int row = Integer.parseInt(rs.getString(i++));
                int col = Integer.parseInt(rs.getString(i++));
                String val = rs.getString(i++);
                sVal[row-1][col-1] = val;
             }
            DimensionTO ret = new DimensionTO (sVal);
            //close DB connection initiated by the super class
            con.close();
            //adds message to log file
            //System.out.println("Disconnected from database: " + System.currentTimeMillis());
            //return populated list
            return ret;
        } catch (Exception e) {
            throw new DAODbSysException(e.getMessage());
        }
    }    
    
}
