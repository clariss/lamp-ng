package slmStudio.tsDimension;

import slmStudio.tsDBConn.DAODbSysException;
import slmStudio.tsMatrix.MatrixString;

@SuppressWarnings("serial")
public class DimensionTO extends MatrixString implements java.io.Serializable{

    public DimensionTO(String[][] sVal) throws DAODbSysException{
       super(sVal);
       if (this.M != 1) {throw new DAODbSysException("invalid number of rows");}
    }
    
}

