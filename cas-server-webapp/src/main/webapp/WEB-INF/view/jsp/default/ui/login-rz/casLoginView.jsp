<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%--<jsp:directive.include file="../includes/top.jsp" />--%>

<%--<c:if test="${not pageContext.request.secure}">
  <div id="msg" class="errors">
    <h2>Non-secure Connection</h2>
    <p>You are currently accessing CAS over a non-secure connection.  Single Sign On WILL NOT WORK.  In order to have single sign on work, you MUST log in over HTTPS.</p>
  </div>
</c:if>--%>

<%--
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
--%>
<%--<jsp:directive.include file="../includes/top-rz.jsp" />--%>


<!DOCTYPE html>

<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>日照市国土资源局</title>
  <spring:theme code="standard.custom.css.file" var="customCssFile"/>
  <link rel="stylesheet" href="<c:url value="${customCssFile}" />" />
  <%--<link rel="stylesheet" type="text/css" href="images/style.css"  />--%>
  <script type="text/javascript" src="images/jquery.js"></script>
  <%--<script type="text/javascript" src="jquery-ui-1.8.18.custom.min.js"></script>--%>

</head>

<body>

  <div id="rootview">
    <div id="top">
      <div id="login-logo"></div>
    </div>
    <div id="center">
      <div id="loginwin">

          <div class="box" id="login">
          <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">

            <form:errors path="*" id="msg" cssClass="errors" element="div" htmlEscape="false" />

            <%--<h2><spring:message code="screen.welcome.instructions" /></h2>--%>

            <div id="logintitle">用 户 登 录</div>

            <section class="row" id="loginuser">
              <label for="username"><spring:message code="screen.welcome.label.netid" /></label>
              <c:choose>
                <c:when test="${not empty sessionScope.openIdLocalId}">
                  <strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
                  <input type="hidden" id="username" name="username" value="<c:out value="${sessionScope.openIdLocalId}" />" />
                </c:when>
                <c:otherwise>
                  <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                  <form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="off" htmlEscape="true" />
                </c:otherwise>
              </c:choose>
            </section>

            <section class="row" id="loginpass">
              <label for="password"><spring:message code="screen.welcome.label.password" /></label>
                <%--
                NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
                "autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
                information, see the following web page:
                http://www.technofundo.com/tech/web/ie_autocomplete.html
                --%>
              <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
              <form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
            </section>

            <%--<section class="row check">
              <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
              <label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
            </section>--%>

            <section class="row btn-row">
              <input type="hidden" name="lt" value="${loginTicket}" />
              <input type="hidden" name="execution" value="${flowExecutionKey}" />
              <input type="hidden" name="_eventId" value="submit" />

              <input class="btn-submit" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
              <input class="btn-reset" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
            </section>
          </form:form>
      </div>


      </div>






    </div>
    <div id="bottom">版权所有：日照市国土资源局</div>
  </div>

  <%--<link rel="stylesheet" href="images/style.css" type="text/css" />--%>
  <%--<jsp:directive.include file="../includes/bottom.jsp" />--%>

</body>
</html>
