
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Comm.con_ol;
import Comm.con_demo;
import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.*;
import java.util.HashMap;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sankalp
 */
public class sbhs1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException, Exception {
       response.setContentType("text/event-stream;charset=UTF-8");
      // PrintWriter writer = response.getWriter();
        
       
           
            /* TODO output your page here. You may use following sample code. */
        
         
          
             
           String info = request.getParameter("info");
           System.out.println("info is "+ info);
           String inputs=request.getParameter("no_of_inputs");
          System.out.println("no of inputs is " + inputs);
           String outputs=request.getParameter("no_of_outputs");
           System.out.println("no of outputs is " + outputs);
           String nameinputs=request.getParameter("name_of_input");
           System.out.println(nameinputs+"it is the name of inputs ");
     
        if(info!=null ){
          //     System.out.println(info);
            
            con_ol c = (con_ol)(request.getSession().getAttribute("con"));
          
            String arr=info.substring(1,info.length()-1);
            String split[]=arr.split(",");
            
             String arr1=nameinputs.substring(1,nameinputs.length()-1);
             String[] name_inputs=arr1.split(",");
            
            
        
           HashMap<Integer,String> h = new HashMap<Integer,String>();
             for(int i=0;i<split.length;i++){ 
                       // h.add(Integer.parseInt(split[i])); 
                      //  h.get(split[i]);
                     //System.out.println ("name of input is " + nameinputs);
                  //    h.put(Integer.parseInt(split[i]),nameinputs);
                      h.put(Integer.parseInt(split[i]),name_inputs[i]);
                                  
             }
           
          /*       ArrayList<Integer> a=new ArrayList<Integer>();
                   for(int i=0;i<split.length;i++){ 
                   a.add(Integer.parseInt(split[i]));
                 }
        */
             c.set(h,Integer.parseInt(inputs));
                   PrintWriter writer = response.getWriter();
                  ArrayList<Double> output=c.read();
                  String op="";
                  for(int i=0;i<output.size();i++){
                      op+=output.get(i)+":";
                  }
                  System.out.println("output opset is " + op);
            writer.write(op+"\n\n");
           
                   writer.close();
              }
    }
            
          
            
             
          
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
      
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(sbhs1.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(sbhs1.class.getName()).log(Level.SEVERE, null, ex);
        }
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

