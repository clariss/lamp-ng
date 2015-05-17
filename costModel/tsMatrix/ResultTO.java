package slmStudio.tsMatrix;

import slmStudio.tsDBConn.DAODbSysException;


/**
 *
 * @author Fabio Hofer
 */
@SuppressWarnings("serial")
public class ResultTO extends MatrixNumeric implements java.io.Serializable {
    
    public ResultTO(float[][] nVal) throws DAODbSysException {
            super(nVal);
            if (this.M != 1) {throw new DAODbSysException("invalid number of rows");}
    }
}

