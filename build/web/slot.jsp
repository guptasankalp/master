

<%@page import="bean.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Single Board Heater System &middot; Virtual Labs</title>
    <link rel="shortcut icon" href="http://vlabs.iitb.ac.in/sbhs/static/img/favicon.ico">
    <link rel="stylesheet" href="http://vlabs.iitb.ac.in/sbhs/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://vlabs.iitb.ac.in/sbhs/static/css/bootstrap-responsive.min.css">
    <script src="http://vlabs.iitb.ac.in/sbhs/static/js/jquery-latest.min.js"></script>
    <script src="http://vlabs.iitb.ac.in/sbhs/static/js/bootstrap.min.js"></script>
    
<script src="http://vlabs.iitb.ac.in/sbhs/static/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="http://vlabs.iitb.ac.in/sbhs/static/css/datepicker.css">

    <style>
    html { margin: 0; height: 100%; }
    body { padding-top: 70px; position: relative; margin: 0; min-height: 88%; }
    input {
    background-color: transparent;
    border: 0px solid;
    height: 20px;
    width: 160px;
    color: #CCC;
}   
    </style>
</head>
<body>
    <%
    String s=((user)(request.getSession().getAttribute("user"))).getusername();
    %>
    <di
    <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a href="/sbhs/" class="brand">Single Board Heater System Lab</a>

            <ul class="nav pull-right">
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome <%=s%> <b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                        <li><a href="#passwordModal" role="button" data-toggle="modal">Change Password</a></li>
                        <li><a href="#machineModal" role="button" data-toggle="modal">Request machine change</a></li>
                        <li><a href="/sbhs/logout">Logout</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </div>
    <div class="navbar-inner">
        <div class="container">
            <ul class="nav pull-right">
                <li><a href="/sbhs/info">SBHS InfoCentre</a></li>
                <li><a href="http://sbhs.os-hardware.in/downloads" target="_blank">Downloads</a></li>
                <li><a href="/sbhs/theory">Theory</a></li>
                <li><a href="/sbhs/procedure">Procedure</a></li>
                <li><a href="/master/experiment.jsp">Experiments</a></li>
                <li><a href="/sbhs/quiz ">Quiz</a></li>
                <li><a href="/sbhs/feedback">Feedback / Contact Us</a></li> 
                <li><a href="/sbhs/about">About Us</a></li>                
            </ul>
        </div>
    </div>    
</div>

    

    
<div class="container">
    <div class="row">
        <div class="span12">
    <ul class="nav nav-pills">
        <br><br>
        <li><button type="button" id="home-nav" class="btn btn-default"><a href="sbhshome.jsp">Home</a></button></li>
        <li><button type="button" id="book-slot-nav" class="btn btn-default"><a href="">Book slot</a></button></li>
        <li><button type="button" id="view-slot-nav" class="btn btn-default" ><a href="viewslot.jsp">View/Delete slot</a></button></li>
        
        </ul>
</div>

        <script>
      //document.getElementById("book-slot-nav").classList.add("active");
     // var abc=  document.getElementById("date");
//      document.getElementById('display').innerHTML=abc;/

window.onload = function() {

var timeClock = function (){

var timeObj = new Date();

var currTime  = timeObj.getHours() ;



currTime =""+currTime+":00 -- " +currTime +":55";



var showTime = "You can book Current slot "+currTime+"";
// 
     //let a = new Date();

   //  let d1 = a.getHours();
    // $("option").each(function(i) {
     //   var currTime= $("option").eq(i).append((d1+i) +":00 -- " + (d1+i) + ":55");




        document.getElementById("clock-container").innerHTML = showTime;

    }

    setInterval(timeClock, 1000);
    }();
    </script>

        <div class="span12">
            <h3>Book slot</h3>
           
               
<h4 id="clock-container"></h4>
             
            <form action="currSlot" method="POST"> 
                <input type='hidden' name='csrfmiddlewaretoken' value='lT7cp7ZiQ4sV1JckSiUiyt8XXAODtAhe' />
                <input type="hidden" name="currslots" id="currslots" value="20">
                <input type="hidden" name="currDate" id="currDate" value="CURRENT">
                <button  type="submit"  class="btn btn-primary">Book now</button>
            </form>
            
            
                                                                    
                                                                     
            <form action="slot" method="POST">
                <input type='hidden' name='csrfmiddlewaretoken' value='lT7cp7ZiQ4sV1JckSiUiyt8XXAODtAhe' />
                <label for="date">Booking date</label> <br>
                <div class="input-append date" id="dp1" data-date="2016-06-05" data-date-format="yyyy-mm-dd">
                    <input name="date" id="date" class="span2" size="16" type="text" readonly>
                    <span class="add-on"><i class="icon-calendar"></i></span>
           </div>
                <div id="slotTimingWrap">
                    <label for="slot">Free slot timings</label>
                    <select name="slot" id="slot">
       
                    </select>
                </div>
                <br>
               <button  type="submit"  class="btn btn-primary">Book this slot </button>
              
                </form>
        </div>
     








</div>

    
        
    <script>
(function(){

     let c = new Date();
     let d = c.getFullYear() + "-0" + (c.getMonth()+1) + "-0" + c.getDate(); // because getMonth starts from zero
     $("#currDate").val(d);
          $(".alert").alert();

  
  })();
  
  </script>
  
  
  
    <script>
(function(){
let c = new Date();
var currTime  = c.getHours() ;



currTime =currTime+":00 -- " +currTime +":55";
$("#currslots").val(currTime);  
  $(".alert").alert();
  


})();
        
        </script>

    
    
    <script>
(function(){
    // sankalp_gupta
     let a = new Date();
     let b = a.getFullYear() + "-0" + (a.getMonth()+1) + "-0" + a.getDate(); // because getMonth starts from zero
     $("#date").val(b);
     $(".alert").alert();

     let d1 = a.getHours();
     /*$("option").each(function(i) {
        $("option").eq.(i).append((d1+i) +":00 -- " + (d1+i) + ":55");
  });*/


     // end 
    var nowTemp = new Date();
   
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
     
    var DP1 = $('#dp1').datepicker({
        onRender: function(date) {
       //     alert(date+"hey")
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate', function(ev) {
        var newDate = new Date(ev.date);
        //alert(newDate+" "+nowTemp)
        var string = newDate.getFullYear() + "-" + (newDate.getMonth() + 1) + "-" + newDate.getDate();
        var string_nowTemp=nowTemp.getFullYear() + "-" + (nowTemp.getMonth() + 1) + "-" + nowTemp.getDate();
     //document.getElementById("display").innerHTML=string;

       
       var limit=0;
       if(string_nowTemp === string){
        limit=d1;
       }

var select = document.getElementById("slot");
    for(var i = 23; i>=limit; i--) {
        var option = document.createElement('option');
        option.text = option.value = (i+":00---"+i+":55");
        select.add(option, 0);
        if(i===limit){
           // alert(i);
            option.setAttribute('selected','true');
        } 
    }

      $.ajax({
            url: "viewslot.html" + string,
            success: function(msg) {
                $("#slotTimingWrap").html(msg);
            }
        })
    }).data('datepicker');



    /*var DP2 = $('#dp1').datepicker().onclick(

                document.getElementById("slot").reset();

    )*/

})();

</script>

<script>
(function(){
    var date_string = "2016-06-05 19:06:36";
    var a = date_string.split(/[^0-9]/);
    for(i=0;i<6;i++){a[i]=parseInt(a[i])}
    window.date = new Date(a[0],a[1]-1,a[2],a[3],a[4],a[5]);
    window.monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    window.ordinalize = function (i) {
        var j = i % 10;
        if (j == 1 && i != 11) return i + "st";
        if (j == 2 && i != 12) return i + "nd";
        if (j == 3 && i != 13) return i + "rd";
        return i + "th";
    }
    window.num_padding = function(i) {
        return i < 10 ? "0" + i : i;
    }

    var timer = function() {
        window.date.setSeconds(window.date.getSeconds() + 1);
        str = window.ordinalize(window.date.getDate()) + " " + window.monthNames[window.date.getMonth()] + " " + window.date.getFullYear() + " " + window.date.toLocaleTimeString().toUpperCase();
        document.getElementById("timer").innerHTML = str;
    }

    setInterval(timer, 1000);
})();
</script>

    
<div class="modal hide fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Change Password</h3>
    </div>
    <div class="modal-body">
        <p>Please click following button to send password change link to your email address.</p>
    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" aria-hidden="true" class="btn">Close</a>
        <a href="/sbhs/password" class="btn btn-primary">Send password change link</a>
    </div>
</div>


<div class="modal hide fade" id="machineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Machine change</h3>
    </div>
    <div class="modal-body">
        <p>Please send an email to rupakrokade@iitb.ac.in stating the reasons why machine change is required.</p>
    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" aria-hidden="true" class="btn">Close</a>
    </div>
</div>

    <script>
    $(".alert").alert();
    </script>
</body>
</html>