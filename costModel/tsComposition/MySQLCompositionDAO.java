package slmStudio.tsComposition;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import slmStudio.tsAllocation.AllocationTO;
import slmStudio.tsAllocation.MySQLAllocationDAO;
import slmStudio.tsDBConn.DAOMySQLDbConn;
import slmStudio.tsDBConn.DAODbSysException;
import slmStudio.tsDimension.DimensionTO;
import slmStudio.tsDimension.MySQLDimensionDAO;
import slmStudio.tsMatrix.ResultTO;
import slmStudio.tsMatrix.MatrixUtils;

/**
 * @author Fabio Hofer
 * 
 */
public class MySQLCompositionDAO extends DAOMySQLDbConn implements CompositionDAO {

    @SuppressWarnings("rawtypes")
	private List getCompositionIds(String poolListId) throws DAODbSysException {

        //Creates a string with the select statement
        //including where clause with schoolName parameter
        String selectStatement =
        "SELECT  COMPOSITION_ID "                
        +       "FROM POOL_LIST A "
        +       "WHERE A.POOL_LIST_ID = \"" + poolListId + "\"";
        ArrayList<String> compositionIds= new ArrayList<String>();
        try {
            //adds message to log file
            //System.out.println("query will execute:" + selectStatement);
            //executes query
            ResultSet rs = st.executeQuery(selectStatement);
            
            String composition_id=null;
            while (rs.next()) {
                int i = 1;
                composition_id = rs.getString(i++);
                compositionIds.add(composition_id);

             }
            con.close();
            //adds message to log file
            //System.out.println("Disconnected from database: " + System.currentTimeMillis());
            return compositionIds;
        } catch (Exception e) {
            throw new DAODbSysException(e.getMessage());
        }

    }  
    
    
    
    @SuppressWarnings("static-access")
	public CompositionTO getCompositionResult(String compositionId)
            throws DAODbSysException {

        String selectStatement =
        "SELECT  A.LHS, "
        +       "A.RHS, "
        +       "A.DIM, "       
        +       "A.POOL_LIST_ID "                 
        +       "FROM COMPOSITION A "
        +       "WHERE A.COMPOSITION_ID = \"" + compositionId + "\"";

        try {
            ResultSet rs = st.executeQuery(selectStatement);
            String lhs=null;
            String rhs=null;
            String dim=null;
            String pool=null; 
            while (rs.next()) {
                int i = 1;
                lhs = rs.getString(i++);
                rhs = rs.getString(i++);
                dim = rs.getString(i++);
                pool = rs.getString(i++); 
             }
            ResultTO result=null;
            CompositionTO composition=null;
            MatrixUtils mUtils = new MatrixUtils();
            if (lhs != null){                
                MySQLCompositionDAO compositionSQL = new MySQLCompositionDAO();
                composition = compositionSQL.getCompositionResult(lhs);
                result = composition.getResult();
            }
            else {
                float[][] nVal = new float[1][1];
                nVal[0][0] =1;
                result = new ResultTO(nVal);
            };
            MySQLAllocationDAO allocationSQL = new MySQLAllocationDAO();
            AllocationTO allocation = allocationSQL.getAllocation(rhs);       
            MySQLDimensionDAO dimensionSQL = new MySQLDimensionDAO();
            DimensionTO dimension  = dimensionSQL.getDimension(dim);
            result = mUtils.times(result, allocation);
            if (pool != null){
                //get list of composition IDs
                @SuppressWarnings("unchecked")
				List<String> poolCompositionId=getCompositionIds(pool);
                ResultTO resultPool=null;
                CompositionTO poolComposition;
                for (int i = 0; i < poolCompositionId.size(); i++) {
                    MySQLCompositionDAO compositionSQL = new MySQLCompositionDAO();
                    poolComposition = compositionSQL.getCompositionResult(poolCompositionId.get(i));
                    con.close();
                    resultPool = poolComposition.getResult();
                    result = mUtils.plus(result, resultPool);
                }
            }
            CompositionTO ret = new CompositionTO (result,dimension);
            con.close();
            return ret;
        } catch (Exception e) {
            throw new DAODbSysException(e.getMessage());
        }
    }    
    
}
