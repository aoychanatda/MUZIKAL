<%-- 
    Document   : Test
    Created on : Apr 18, 2017, 5:22:20 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String mins = request.getParameter("mins");
            if (mins == null) {
                mins = "15";
            }
            String secs = request.getParameter("secs");
            if (secs == null) {
                secs = "1";
            }
        %>
        <script>
            <!--
            var mins = <%=mins%>; // write mins to            javascript
            var secs = <%=secs%>; // write secs to javascript
            function timer()
            {
// tic tac
            if (--secs == - 1)
            {
            secs = 59;
                    --mins;
            }
// leading zero? formatting
            if (secs < 10)
                    secs = "0" + secs;
                    if (mins < 10)
                    mins = "0" + parseInt(mins, 10);
// display
                    document.forma.mins.value = mins;
                    document.forma.secs.value = secs;
// continue?
                    if (secs == 0 && mins == 0) // time over
            {
            document.forma.ok.disabled = true;
                    document.formb.results.style.display = "block";
            } else // call timer() recursively every 1000 ms == 1 sec
            {
            window.setTimeout("timer()", 1000);
            }
            }
//-->
            </script></head>
            <body>
            <form action="<%=request.getRequestURL()%>" name="forma">
                    Time remaining: <input type="text" name="mins" size="1" style="border:0px solid black;text-align:right">:<input type="text" name="secs" size="1" style="border:0px solid black">                   
            </form>    
            <script>
            <!--
            timer(); // call timer() after page is loaded
            //-->
            </script>
    </body>
</html>
