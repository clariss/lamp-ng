package slmStudio.tsDBConn;

/**
 *
 * @author Fabio Hofer
 */
@SuppressWarnings("serial")
public class DAODbSysException extends RuntimeException{
    
   public DAODbSysException(String str) {
        super(str);
    }

    public DAODbSysException() {
        super();
    }
}
