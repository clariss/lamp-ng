/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package slmStudio;

import slmStudio.tsComposition.CompositionTO;
import slmStudio.tsComposition.MySQLCompositionDAO;
import slmStudio.tsDimension.DimensionTO;
import slmStudio.tsMatrix.ResultTO;

/**
 *
 * @author Fabio Hofer
 */
public class Main {
 
    public static void main(String[] args) {
        
        MySQLCompositionDAO composition2SQL = new MySQLCompositionDAO();
        CompositionTO composition2 = composition2SQL.getCompositionResult("CALC400");
        showResult(composition2);

    } 
    
    public static void showResult(CompositionTO composition) {
        ResultTO r = composition.getResult();
        DimensionTO d = composition.getDimension();
            for (int i = 0; i < r.getM(); i++) {
                for (int j = 0; j < r.getN(); j++) {
                    System.out.print(d.getsVal()[i][j]+"\t");
                    System.out.printf("%10.4f ", r.getnVal()[i][j]);
                    System.out.println();
                }
                System.out.println();
            }
    }    

}
