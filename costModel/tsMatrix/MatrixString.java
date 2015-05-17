package slmStudio.tsMatrix;

@SuppressWarnings("serial")
public abstract class MatrixString extends Matrix implements java.io.Serializable{
    protected String[][] sVal;   // M-by-N array
    
    public MatrixString(String[][] sVal) {
       super(sVal.length, sVal[0].length);
        this.sVal = new String[M][N];
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                    this.sVal[i][j] = sVal[i][j];
    }

    public String[][] getsVal() {
        return sVal;
    }
    
    public String getsVal(int M, int N) {
        return sVal[M][N];
    }
}
