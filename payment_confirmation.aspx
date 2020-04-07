<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment_confirmation.aspx.cs" Inherits="secureacceptance.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
</head>
<body>
<form id="payment_confirmation" action="https://testsecureacceptance.cybersource.com/pay" method="post"/>
<fieldset id="confirmation">
    <legend>Review Payment Details</legend>
    <div>
        <%
            foreach (var key in Request.Form.AllKeys)
            { 
                Response.Write("<div>");
                Response.Write("<span class=\"fieldName\">" + key + ":</span><span class=\"fieldValue\">" + Request.Params[key] + "</span>");
                Response.Write("</div>");
            }
        %>
    </div>
</fieldset>
    <%
        IDictionary<string, string> parameters = new Dictionary<string, string>();
        foreach (var key in Request.Form.AllKeys)
        {
            Response.Write("<input type=\"hidden\" id=\"" + key + "\" name=\"" + key + "\" value=\"" + Request.Params[key] + "\"/>\n");
            parameters.Add(key, Request.Params[key]);
        }
        Response.Write("<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" + secureacceptance.Security.sign(parameters) + "\"/>\n");
    %>
<input type="submit" id="submit" value="Confirm"/>
</form>
</body>
</html>
