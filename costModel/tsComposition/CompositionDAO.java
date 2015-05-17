package slmStudio.tsComposition;
/**
 * @author Fabio Hofer
 * interface to decouple the implementation of the persistent data store 
 * from the rest of the application.
 */

import slmStudio.tsDBConn.DAODbSysException;

public interface CompositionDAO {

    public CompositionTO getCompositionResult(String compositionId)
             throws DAODbSysException;

}
