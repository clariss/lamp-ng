package slmStudio.tsAllocation;
/**
 * @author Fabio Hofer
 * interface to decouple the implementation of the persistent data store 
 * from the rest of the application.
 */

import slmStudio.tsDBConn.DAODbSysException;

public interface AllocationDAO {

    public AllocationTO getAllocation(String allocationMatrixId)
             throws DAODbSysException;
}
