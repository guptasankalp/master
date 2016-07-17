import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.Scanner;

public class main
{
    
    public static void main( String[] args )
    {
        String portName=null;
        try
        {
             try {
                // String target1 ="sudo -i rm -f /var/lock/LCK*";
                 String target2 = "/home/sankalp/test3.sh";
                 
                 Runtime rt = Runtime.getRuntime();
                 //Process proc1 = rt.exec(target1);
                 Process proc2 = rt.exec(target2);
                 //proc1.waitFor();
                 proc2.waitFor();
                 String output = new String();
                 BufferedReader reader = new BufferedReader(new InputStreamReader(proc2.getInputStream()));
                 String line = "";                       
                 while ((line = reader.readLine())!= null) {
                         output+=(line+"\n");
                 }
                System.out.println(output);
                String[] port=output.split("\n");
                Con c=new Con();
                File file=new File("/home/sankalp/mid1.txt");
                if(!file.exists()) {
                    file.createNewFile();
                 } 
                PrintWriter writer = new PrintWriter(file, "UTF-8");
                for(int i=0;i<port.length;i++){
                    System.out.println(port[i]);
                    System.out.println((c).connect(port[i]));
                    writer.append(port[i]);
            //        writer.append("-");
          //          writer.append((char) c.readMID(writer));
                    
                  System.out.println(c.readMID(writer));
                    
                   c.disconnect();
                    
                }
                writer.close();
               
                
         } catch (Throwable t) {
                 t.printStackTrace();
         }
             
        }
        catch ( Exception e )
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}