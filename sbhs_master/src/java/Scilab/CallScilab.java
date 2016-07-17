/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scilab;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.scilab.modules.javasci.JavasciException;
import org.scilab.modules.javasci.Scilab;
import org.scilab.modules.types.ScilabDouble;
import org.scilab.modules.types.ScilabInteger;


/**
 *
 * @author root
 */
public class CallScilab {

                public String[] scilab(int setpoint,int fan,double temp ,Scilab sci,String filename)  {
		String[] b=new String[3];
		try
                {
                System.out.println(filename+"Scilab");
                System.out.println("wer");
                // sci.open(new File("/home/sankalp/scilabcodes/qa.sci"));
   
		sci.open(new File("/home/sankalp/scilabcodes/"+filename));
                
                System.out.println("there");
                }
                catch(JavasciException.AlreadyRunningException e){
                e.getMessage();
                }
                catch (FileNotFoundException | JavasciException ex) {
                Logger.getLogger(CallScilab.class.getName()).log(Level.SEVERE, null, ex);
                }
                finally
                {
                try 
                {
                ScilabInteger scilab_setpoint= new ScilabInteger(setpoint);
                ScilabInteger scilab_fan= new ScilabInteger(fan);
                ScilabDouble scilab_temp= new ScilabDouble(temp);
                        
                try 
                {
                sci.put("setpoint",scilab_setpoint);
                } catch (JavasciException ex) {
                Logger.getLogger(CallScilab.class.getName()).log(Level.SEVERE, null, ex);
                }
                try
                {
                            sci.put("fan",scilab_fan);
                        }
                        catch (JavasciException ex) {
                            Logger.getLogger(CallScilab.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        try
                        {
                            sci.put("temp",scilab_temp);
                        } catch (JavasciException ex) {
                            Logger.getLogger(CallScilab.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        try
                        {
                            sci.execException("[x y]=sbhs(setpoint,fan,temp)");
                            
                        }
                        catch (org.scilab.modules.javasci.JavasciException e)
                        {
                            System.err.println("An exception occurred: " + e.getLocalizedMessage());
                            b[1]=String.valueOf(-1);
                            b[0]=String.valueOf(-1);
                            b[2]=e.getLocalizedMessage();
                            return b;
                        }
                        ScilabInteger c=(ScilabInteger) sci.get("y");
                        ScilabInteger d=(ScilabInteger) sci.get("x");
                        b[0]=String.valueOf(c.getIntElement(0,0));
                        b[1]=String.valueOf(d.getIntElement(0,0));
                        b[2]=null;
                    } catch (JavasciException ex)
                   
                    {
                        Logger.getLogger(CallScilab.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
               
                return b;       
                }
                }
