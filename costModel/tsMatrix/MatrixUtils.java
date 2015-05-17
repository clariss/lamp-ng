package slmStudio.tsMatrix;

import slmStudio.tsAllocation.AllocationTO;
import slmStudio.tsComposition.CompositionTO;
import slmStudio.tsDimension.DimensionTO;




/**
 *
 * @author Fabio Hofer
 * based on http://introcs.cs.princeton.edu/java/95linear/Matrix.java.html
 */
public class MatrixUtils {
    
        public static ResultTO times(ResultTO A, AllocationTO B) {
        if (A.getN() != B.getM()) 
            throw new RuntimeException("Times: Illegal matrix dimensions.");
        float[][] nVal = new float[A.getM()][B.getN()];
        ResultTO C = new ResultTO(nVal);
        for (int i = 0; i < C.getM(); i++)
            for (int j = 0; j < C.getN(); j++){
                float result = 0;
                for (int k = 0; k < A.getN(); k++){
                    result += (A.getnVal(i,k) * B.getnVal(k,j));
                    C.setnVal(result, i, j);}}
        return C;
    }
        
    // return C = A + B
    public static ResultTO plus(ResultTO A, ResultTO B) {
        if (B.getM() != A.getM() || B.getN() != A.getN()) 
            throw new RuntimeException("Plus: Illegal matrix dimensions.");
        float[][] nVal = new float[A.getM()][B.getN()];
        ResultTO C = new ResultTO(nVal);
        for (int i = 0; i < A.getM(); i++)
            for (int j = 0; j < A.getN(); j++){
                float result = 0;
                result = A.getnVal(i,j) + B.getnVal(i,j);
                C.setnVal(result,i,j);
            }
        return C;
    }
    


}
