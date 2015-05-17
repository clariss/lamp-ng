package slmStudio.tsDimension;
/**
 * @author Fabio Hofer
 * interface to decouple the implementation of the persistent data store 
 * from the rest of the application.
 */

import slmStudio.tsDBConn.DAODbSysException;

public interface DimensionDAO {

    public DimensionTO getDimension(String itemId)
             throws DAODbSysException;

}
