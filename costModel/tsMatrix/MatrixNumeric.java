package slmStudio.tsMatrix;

/**
 *
 * @author Fabio Hofer
 */
@SuppressWarnings("serial")
public abstract class MatrixNumeric extends Matrix implements java.io.Serializable{
    protected float[][] nVal;   // M-by-N array
    
    public MatrixNumeric(float[][] nVal) {
            super(nVal.length, nVal[0].length);
            this.nVal = new float[M][N];
            for (int i = 0; i < M; i++)
                for (int j = 0; j < N; j++)
                        this.nVal[i][j] = nVal[i][j];
    }

    //Getters
    public float[][] getnVal() {
        return this.nVal;
    }
    
    public float getnVal(int M, int N) {
        return nVal[M][N];
    }
    
    public void setnVal(float val, int M, int N) {
        this.nVal[M][N]=val;
    }
    

}

