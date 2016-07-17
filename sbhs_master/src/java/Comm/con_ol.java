package Comm;

import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
This  class is for making connections.
We already have the serial port connection 
to every machine via serveltcontext's hashmap
thus it will be used for connection.

@author Anamika Modi
*/

public class con_ol{
    /*
    InputStream and OutputStream objects for the port.
    */
    InputStream in=null;
    OutputStream out=null;
    int k,k2;
       String StringValue="Fan";
       String StringValue2="Heat";
    
    public con_ol(){
        super();
    }
    /*
    Returns the machine id .
    @return int - Machine Identification no
    */
    public int readMID() throws IOException{
        out.write(252);
        
                int a=0;
                try{
                	final byte[] buffer = new byte[2];
                	  int total = 0;
                	  int read = 0;
                	  while (total <1 && (read = in.read(buffer, total, 1- total)) >= 0) 
                          {
                	    total += read;
                	    out.flush();
                	  }
                        a= Integer.parseInt(String.valueOf(buffer[0]));
                }
                catch(IOException e){
                	e.printStackTrace();
                }    
        return a;
    }
    /*
    returns the temp from the ,achine
    */
    public ArrayList<Double> read() throws IOException, InterruptedException{
       ArrayList<Double> arr=new ArrayList<Double>();
       
        
          Thread.sleep(5000);
               out.write(255);
               
                try{
                	final byte[] buffer = new byte[2];
                	  int total = 0;
                	  int read = 0;
                	  while (total <=1 && (read = in.read(buffer, total, 2 - total)) >= 0) {
                	    total += read;
                	    out.flush();
                	  }
                        arr.add(Integer.parseInt(String.valueOf(buffer[0]))+0.1*(Integer.parseInt(String.valueOf(buffer[1]))));
                }
                catch(IOException e){
                	e.printStackTrace();
                }  
           
        return arr;
    }
    /*  
    Assigns inputstream and otputstream for the serial port
    */
public int connect ( SerialPort serialPort ) throws PortInUseException, UnsupportedCommOperationException, IOException 
    { 
        serialPort.setSerialPortParams(9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
                 in = serialPort.getInputStream();
                out = serialPort.getOutputStream();
      return 1;
    }
/*
for setting the input
*/

public void set(HashMap<Integer,String> input,int no_of_inputs) throws IOException{
      
 /*     Set set = input.entrySet();
      Iterator iterator = set.iterator();
      while(iterator.hasNext()) {
         Map.Entry entry = (Map.Entry)iterator.next();
      
      }
 */
     for(Map.Entry entry: input.entrySet()){
       
//   System.out.println(entry.getValue()+"entry.getvalue()");
  //  String str= (String) entry.getValue();
  // List<String> list =  Arrays.asList(str.split(","));
    //String list[]= str.split(",");

   // String x=list[1];
   // String y=list[2];
    
     //   System.out.println(list.get(1));
     //    System.out.println(list.get(2));
         
    //     System.out.println("x is "+ x);
         
      //   System.out.println("y is "+ y);
/*      if(StringValue.equals(entry.getValue())){                          //stringvalue = "Fan"
         k = (int)entry.getKey();
           System.out.print(k+"this is key for value "+StringValue);
                
             break; //breaking because its one to one map
                
               
      }
        if(StringValue2.equals(entry.getValue())){                          //Stringvalue ="Heat"
         k2 = (int)entry.getKey();
           System.out.print(k2+"this is key for value "+StringValue2);
                
             break; //breaking because its one to one map
                
               
            } 
        else{
            System.out.println("no" +StringValue2 +"found");
        }
        
        
        
   */     
        
        
      System.out.println("get value is this " +entry.getValue() +"here");
         if((entry.getValue()).equals("Fan"))
          
         { 
           k = (int) entry.getKey();
           System.out.print(k+"this is key for value "+StringValue);
               out.write(253);
               out.write(k);
           //  break; //breaking because its one to one map
         }
         if((entry.getValue()).equals("Heat"))
         {                          //Stringvalue ="Heat"
         k2 = (int)entry.getKey();
           System.out.print(k2+"this is key for value "+StringValue2);
                out.write(254);
                out.write(k2);

           //  break; //breaking because its one to one map
                
               
            } 
       
            
    

          
        
        //System.out.println(input.get(0)+"here it is ");
//       out.write(input.get(0));
  //    out.write(input.get(1));
       
     }}
/*
Close the input and output stream
*/
public void disconnect() throws IOException{
     in.close();
     out.flush();
     out.close();
     
     System.out.println("disconnect");
}

    public void set(ArrayList<Integer> a, int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}

  









