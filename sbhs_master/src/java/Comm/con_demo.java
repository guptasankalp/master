package Comm;

import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class con_demo{
    InputStream in=null;
    OutputStream out=null;
    int k,k2;
       String StringValue="Fan";
       String StringValue2="Heat";
    
    public con_demo(){
        super();
    }
    public int readMID() throws IOException{
        out.write(/***enter m_id port number in integer like 252 in sbhs ***/);
        
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
    public ArrayList<Double> read() throws IOException, InterruptedException{
       ArrayList<Double> arr=new ArrayList<Double>();
       
        
          Thread.sleep(5000);
               out.write(/*** enter read port numbr in integer like 255 for sbhs***/);
               
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
public int connect ( SerialPort serialPort ) throws PortInUseException, UnsupportedCommOperationException, IOException 
    { 
        serialPort.setSerialPortParams(9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);  /**** make sure we have serial port configuration as same, otherwise change this ***/
                 in = serialPort.getInputStream();
                out = serialPort.getOutputStream();
      return 1;
    }
public void set(HashMap<Integer,String> input,int no_of_inputs) throws IOException{
      
     for(Map.Entry entry: input.entrySet()){
       
        
      System.out.println("get value is this " +entry.getValue() +"here");
         if((entry.getValue()).equals("Fan"))     /*** change input name(Fan) if necessary ***/
          
         { 
           k = (int) entry.getKey();
           System.out.print(k+"this is key for value "+StringValue);
               out.write(/**** input the write port number in integer like 253 for sbhs ***/ );
               out.write(k);
         }
         if((entry.getValue()).equals("Heat"))     /*** change input name(Heat) if necessary ***/
         {                          
         k2 = (int)entry.getKey();
           System.out.print(k2+"this is key for value "+StringValue2);
                out.write(/**** input the write port number in integer like 254 for sbhs ***/);
                out.write(k2);

                
               
            } 
       
            
     }}
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

  











  









