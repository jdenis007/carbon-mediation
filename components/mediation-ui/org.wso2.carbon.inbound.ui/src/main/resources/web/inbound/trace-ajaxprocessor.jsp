<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%--
  ~ *  Copyright (c) 2015, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~ *
  ~ *  WSO2 Inc. licenses this file to you under the Apache License,
  ~ *  Version 2.0 (the "License"); you may not use this file except
  ~ *  in compliance with the License.
  ~ *  You may obtain a copy of the License at
  ~ *
  ~ *    http://www.apache.org/licenses/LICENSE-2.0
  ~ *
  ~ * Unless required by applicable law or agreed to in writing,
  ~ * software distributed under the License is distributed on an
  ~ * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ * KIND, either express or implied.  See the License for the
  ~ * specific language governing permissions and limitations
  ~ * under the License.
  --%>

<%@ page import="org.wso2.carbon.utils.ServerConstants" %>
<%@ page import="org.wso2.carbon.CarbonConstants" %>
<%@ page import="org.apache.axis2.context.ConfigurationContext" %>
<%@ page import="org.wso2.carbon.ui.CarbonUIUtil" %>
<%@ page import="org.wso2.carbon.inbound.ui.internal.InboundManagementClient" %>

<%
    //ignore methods other than post
    if (!request.getMethod().equalsIgnoreCase("POST")) {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        return;
    }
    String inboundEndpointName = request.getParameter("inboundEndpointName");
    String action = request.getParameter("action");

    if (inboundEndpointName != null && action != null) {
        InboundManagementClient client = InboundManagementClient.getInstance(config, session);
        if ("enableTrace".equals(action)) {
            client.enableTracing(inboundEndpointName);
        } else if ("disableTrace".equals(action)) {
            client.disableTracing(inboundEndpointName);
        }
    }

%>
