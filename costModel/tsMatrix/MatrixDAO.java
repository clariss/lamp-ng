package slmStudio.tsMatrix;
/**
 * @author Fabio Hofer
 * interface to decouple the implementation of the persistent data store 
 * from the rest of the application.
 */

import slmStudio.tsDBConn.DAODbSysException;

public interface MatrixDAO {

   public Matrix getMatrix(String matrixId) 
             throws DAODbSysException;

}
