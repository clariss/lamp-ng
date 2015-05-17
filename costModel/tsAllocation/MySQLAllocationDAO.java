package slmStudio.tsAllocation;

import java.sql.ResultSet;
import slmStudio.tsDBConn.DAOMySQLDbConn;
import slmStudio.tsDBConn.DAODbSysException;
import slmStudio.tsMatrix.Matrix;
import slmStudio.tsMatrix.MySQLMatrixDAO;

/**
 * @author Fabio Hofer
 * 
 */
public class MySQLAllocationDAO extends DAOMySQLDbConn implements AllocationDAO {

   
        public AllocationTO getAllocation(String allocationId) 
                throws DAODbSysException {

        //Creates a string with the select statement
        String selectStatement =
        "SELECT  A.ROW, "
        +       "A.COL, "
        +       "A.VAL "
        +       "FROM ALLOCATION A "
        +       "WHERE A.ALLOCATION_ID = \"" + allocationId + "\""
        +       "ORDER BY 1,2";

        MySQLMatrixDAO matrixSQL = new MySQLMatrixDAO();
        Matrix matrix = matrixSQL.getMatrix(allocationId);
        float[][] nVal; //declare variable
        nVal = new float[matrix.getM()][matrix.getN()]; 
        try {
            //adds message to log file
            //System.out.println("query will execute:" + selectStatement);
            //executes query
            ResultSet rs = st.executeQuery(selectStatement);
            //loop to populate the list
            while (rs.next()) {
                int i = 1;
                int row = Integer.parseInt(rs.getString(i++));
                int col = Integer.parseInt(rs.getString(i++));
                float val = Float.valueOf(rs.getString(i++).trim()).floatValue();
                nVal[row-1][col-1] = val;
             }
            AllocationTO ret = new AllocationTO (nVal);
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
