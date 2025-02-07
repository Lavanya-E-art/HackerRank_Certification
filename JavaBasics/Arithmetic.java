import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

class Arithmetic {
    public Integer sum(Integer[] ints){
        int s = 0;
        for(int i = 0; i< ints.length;i++){
            s = s + ints[i];
        }
        return s;
    }
    public String sum(String[] str){
        String s = "";
        for(int i =0;i<str.length;i++){
            s += str[i];
        }
        return s;
    }
}
public class Solution {
    
    public static void main(String args[] ) throws Exception {
        Arithmetic arithmetic = new Arithmetic();

        Scanner sc = new Scanner(System.in);
        String line = sc.nextLine();
        String[] values = line.split(" ");

        //check if int array
        try{
            Integer.parseInt(values[0]);

            //System.out.println("Integer array");
            Integer[] ia = new Integer[values.length];
            for (int i=0; i< values.length; i++){
                ia[i] = new Integer(values[i]);
            }
            System.out.println(arithmetic.sum(ia));
        }catch(NumberFormatException nfe){
            //then string array

            //System.out.println("String array");
            System.out.println(arithmetic.sum(values));
        }
    }
}
