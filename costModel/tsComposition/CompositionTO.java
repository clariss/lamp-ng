package slmStudio.tsComposition;

import slmStudio.tsDimension.DimensionTO;
import slmStudio.tsMatrix.ResultTO;


/**
 *
 * @author Fabio Hofer
 */
@SuppressWarnings("serial")
public class CompositionTO implements java.io.Serializable{
    protected ResultTO result;   
    protected DimensionTO dimension;
    

    public CompositionTO(ResultTO result, DimensionTO dimension) {
        this.result = result;
        this.dimension = dimension; 
    }

    public DimensionTO getDimension() {
        return dimension;
    }

    public ResultTO getResult() {
        return result;
    }

}

