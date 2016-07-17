<%-- 
    Document   : vlab1
    Created on : 23 June, 2016, 2:33:43 PM
    Author     : Sankalp Gupta 
--%>


<%@page import="java.lang.String"%>
<%@page import="java.lang.String"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.json.simple.JSONValue"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <title>V_LAB</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">\
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script src="https://code.highcharts.com"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!-- Additional files for the Highslide popup effect -->
<script src="https://www.highcharts.com/samples/static/highslide-full.min.js"></script>
<script src="https://www.highcharts.com/samples/static/highslide.config.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://www.highcharts.com/samples/static/highslide.css" />
  
  <style type="text/css">
      
    .ui-slider .ui-slider-handle {
    height: 15px;
    width: 5px;
    padding-left: 10px;
    
}
    .ui-slider-horizontal {
    height: 8px;
    width: 200px;
}
  </style>
  <%
       File f=new File("/home/sankalp/test.txt");
        InputStream inputStream= new FileInputStream(f);
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
       int no_of_inputs=0;
            int no_of_outputs=0;
            String arrin[]=null;
             String arrout[]=null;
        String line;
        while ((line = reader.readLine()) != null) {
            String s[]=line.split(":");
                if(s[0].equals("no_of_inputs")){
                    no_of_inputs=Integer.parseInt(s[1]);
                }
                else if(s[0].equals("no_of_outputs")){
                    no_of_outputs=Integer.parseInt(s[1]);
                }
                else if(s[0].equals("name_of_input")){
                     arrin=new String[no_of_inputs];
                    for(int i=0;i<no_of_inputs;i++){
                        arrin[i]=s[1].split(";")[i];
                       System.out.print("array is " +arrin[i]);

                    }
                }
                else if(s[0].equals("name_of_output")){
                     arrout=new String[no_of_outputs];
                    for(int i=0;i<no_of_outputs;i++){
                        arrout[i]=s[1].split(";")[i];
                        System.out.print(arrout[i]);
                    }
                }
            }
      %>
  <script>
   function start(){
        var eventSource = new EventSource("sbhs1");
          info=[];
         // name=[];
          
          colinArray=[];
     <% for (int i=0; i<arrin.length; i++) { %>
     colinArray[<%= i %>] = "<%= arrin[i] %>";
     <% } %> ; 
       
          for( var i=0;i< <%=no_of_inputs%>;i++){
              info[i]=$('#textBox_'+i).val();
                
          }
             var data = '[' + info + ']';
         //   var nam = '[' +<%= JSONValue.toJSONString(arrin) %>+ ']'
       /*for( var i=0;i< <%=no_of_inputs%>;i++){
            
                 name[i]=<%=arrin%>[i];
                  
              }
           */    var nam= '[' + colinArray + ']';

       
      
          console.log(info);
                 $.ajax({
                url: "/master/sbhs1",
                type: 'GET',   
                data: {
                   info:data,
                   no_of_inputs:<%=no_of_inputs%>,
                   no_of_outputs:<%=no_of_outputs%>,
            
                     name_of_input:nam
                  
                 },
             
                success: function (data) {
        if(data){
            if(data.split(":")[0]!==0.0){
                for(var i=0;i< <%=no_of_outputs%>;i++)
                  document.getElementById('heading_'+i).innerHTML=data.split(":")[i];
               }
               }
               for(let id=0;id<<%=no_of_inputs%>;id++){
               var index=$("#chart_"+id).data('highchartsChart');
               var chart=Highcharts.charts[index];
               chart.series[0].addPoint([(new Date()).getTime(),parseFloat(info[id])],true);
           }
           for(let id=0;id<<%=no_of_outputs%>;id++){
               var index=$("#chart_"+(id+<%=no_of_inputs%>)).data('highchartsChart');
               var chart=Highcharts.charts[index];
               chart.series[0].addPoint([(new Date()).getTime(),parseFloat(data.split(":")[id]),true]);
           }
                
}   
                
            });    
      
       
}
    
   colArray=[];
     <% for (int i=0; i<arrin.length; i++) { %>
colArray[<%= i %>] = "<%= arrin[i] %>";
<% } %> ; 
    
  function textBox(selections){
  
    selections = selections*1; // Convert to int
    if( selections !== selections ) throw 'Invalid argument'; // Check NaN
    var container = document.getElementById('yay'); //Cache container.

    for(var i = 0; i <selections; i++){
        var tb = document.createElement('input');
        var div = document.createElement('div');
        tb.type = 'text';
        tb.id = 'textBox_' + i; // Set id based on "i" value
        div.id='slider_'+i;
         container.innerHTML+='<p>';
         container.innerHTML+=colArray[i]+': ';
        container.appendChild(tb); 
         container.innerHTML+='</p>';
        container.appendChild(div);
        
    }
} 


    coloutArray=[];
     <% for (int i=0; i<arrout.length; i++) { %>
coloutArray[<%= i %>] = "<%= arrout[i] %>";

<% } %>;
  function headings(selections){
      
    selections = selections*1; // Convert to int
    
    if( selections !== selections ) throw 'Invalid argument'; // Check NaN
    var container = document.getElementById('output'); //Cache container.

    for(var i = 0; i <selections; i++){
        var h = document.createElement('h2');
        h.id = 'heading_' + i; // Set id based on "i" value
        
        
        
        container.innerHTML+=coloutArray[i]+': ';
        container.appendChild(h);
        
      
    }
}
function slider(selections) { 
     selections = selections*1; 
   for(let i = 0; i <selections; i++){  
    $( "#slider_"+i).slider({
       
     orientation: "horizontal",
    max: 100,
    step: 1,
    change: function(event, ui) {
      $('#textBox_'+i).attr('value', ui.value);
    },
    min: 0
    });
   }
    
  };
  function change(e){
      for(let i=0;i<<%=no_of_inputs%>;i++){
      $( "#slider_"+i ).on( "slidechange", function( event,ui) {
                  document.getElementById("textBox_"+i).innerHTML= ui.value;
              });
      }
    
  };
  $(document).ready(function(){ 
               
               slider(<%=no_of_inputs%>);
              change(<%=no_of_inputs%>);
          
                  
              });
function chart(title,divName,xName,yName){
   var chart = new Highcharts.Chart({
        defaultSeriesType: 'spline',
        title: {
            text: title,
            x: -20 //center
        },
        events: {
               load:function() {
            chart= this; // `this` is the reference to the chart
            setTimeout(start,50000);
           }
            },
        chart: {
                    renderTo: divName
                },
                credits: {
            enabled: false
        },
         xAxis: {
            /*
            * time axis
            * set according to datetime
            */
             type: 'datetime',
            tickPixelInterval: 100,
            title: {
                text: xName,
                margin: 40
            },
            maxZoom: 20 * 100
        },
        yAxis: {
            /*
             * heat axis
             * plots the  value of heat obtained from sbhs
             */
            minPadding: 0.2,
            maxPadding: 0.2,
            title: {
                text: yName,
                margin: 40
            }
        },exporting: {
            buttons: {
                contextButton: {
                        menuItems: [{
                            textKey: 'downloadPNG',
                            onclick: function () {
                                this.exportChart();
                            }
                        }, {
                            textKey: 'downloadJPEG',
                            onclick: function () {
                                this.exportChart({
                                    type: 'image/jpeg'
                                });
                            }
                        }]
                }
            }
        },
        series: [{
          color: '#ff0000',
           data: []
        }]
    });
    return chart;
    }
    function div(selections){
    selections = selections*1; // Convert to int
    if( selections !== selections ) throw 'Invalid argument'; // Check NaN
    var container = document.getElementById('container'); //Cache container.

    for(var i = 0; i <selections; i++){
        var div = document.createElement('div');
        div.style="min-width: 310px; height: 400px; margin: 0 ; display: none ;";
        div.id='chart_'+i;
         
       container.appendChild(div);   
      
    }
}
    function div_graph(){
    
    var container = document.getElementById('container'); //Cache container.

    for(var i = 0; i <<%=no_of_inputs%>; i++){
        var div = document.createElement('c');
            
   {div.style="padding: 5px; text-align: center; background-color: #e5eecc; border: solid 1px #c3c3c3;float:left;";
   }
  
       // div.style="padding: 5px; text-align: center; background-color: #e5eecc; border: solid 1px #c3c3c3;";
        div.id='chart_flip'+i;
        div.innerHTML=colArray[i];
         container.innerHTML+='<p>';
       container.appendChild(div);
       var div = document.createElement('div');
    // if(i%2==0)
   {div.style="min-width: 310px; height: 400px; margin: 0 ; display: none ;border: 1px solid navy;float:left;";
   }
  // else
  // {div.style="min-width: 310px; height: 400px; margin: 0 ; display: none ;border: 1px solid navy; float:right;";
  // }
       // div.style="min-width: 310px; height: 400px; margin: 0 ; display: none ;";
        div.id='chart_'+i;
         
       container.appendChild(div); 
       container.innerHTML+='</p>';
        
      
    }
    for(var i = 0; i <<%=no_of_outputs%>; i++){
        var div = document.createElement('c');
        div.style="padding: 5px; text-align: center; background-color: #e5eecc; border: solid 1px #c3c3c3;float:left;";
        div.id='chart_flip'+(i+<%=no_of_inputs%>);
        div.innerHTML=coloutArray[i];
         container.innerHTML+='<p>';
       container.appendChild(div);
       var div = document.createElement('div');
        div.style="min-width: 310px; height: 400px; margin: 0 ; display: none ;float:left;border: solid 1px #c3c3c3;";
        div.id='chart_'+(i+<%=no_of_inputs%>);
         
       container.appendChild(div); 
        container.innerHTML+='</p>';
        
      
    }
} 
    $(function () {
        //div(2);
        div_graph();
       // var a= chart('heat vs time','chart_1','time','heat');
        point=1;
        //a.series[0].addPoint([(new Date()).getTime(),parseFloat(point)],true);
        //var b= chart('heat vs time','chart_0','time','heat');
        for(let i=0;i<<%=no_of_inputs%>;i++){
            var s= chart((colArray[i]+' vs time'),('chart_'+i),'time',(colArray[i]));
        }
         for(let i=0;i<<%=no_of_outputs%>;i++){
            var s= chart((coloutArray[i]+' vs time'),('chart_'+(i+<%=no_of_inputs%>)),'time',(coloutArray[i]));
        }
        for(let i=0;i<<%=no_of_inputs%>+<%=no_of_outputs%>;i++){
          (  function(){
              var click=document.getElementById("chart_flip"+i);
        click.addEventListener("click", function() { $("#chart_"+i).slideToggle("slow"); }, false);
        }());
    }
    });

</script>
    </head>
    <body>
         <h1>VIRTUAL LABS - Open Loop</h1>
        <form method="post">
         <div id="yay">
         
             
             <script>textBox(<%=no_of_inputs%>);</script>
                     
         </div>
    </form>
             <div id='output'>
                 <script>headings(<%=no_of_outputs%>);</script>
             </div>
             <div id="container"></div>
         

<script>
  
  </script>
         <script type="text/javascript">
            
            var container = document.getElementById('yay');
            container.addEventListener("slideChange",change,false);
             
       
        
        </script>
        
        <script>
            setInterval(start,1000);
        </script>
        
        
    </body>
</html>