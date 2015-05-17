package slmStudio.tsMatrix;

/**
 *
 * @author Fabio Hofer
 */

public class Matrix {
    protected int M;             // number of rows
    protected int N;             // number of columns

    // create matrix based on 2d array
    public Matrix(int m, int n) {
        M = m;
        N = n;
    }
    
    public int getM() {
        return M;
    }

    public int getN() {
        return N;
    }    
}


