<%-- 
/**
 * Copyright (C) 2005-2014 Rivet Logic Corporation.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; version 3 of the License.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 51
 */
--%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>


<%@ page import="java.util.List" %>
<%@ page import="com.liferay.portal.util.PortalUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.StringPool" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.kernel.util.Constants" %>
<%@ page import="com.liferay.portal.theme.ThemeDisplay" %>
<%@ page import="com.liferay.portal.kernel.util.StringUtil" %>

<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.rivetlogic.intranet.portlet.IframeConstants"%>

<%@ page import="com.liferay.portal.kernel.util.GetterUtil" %>

<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry" %>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %>
<%@ page import="com.liferay.portal.security.permission.ActionKeys" %>
<%@page import="javax.portlet.PortletURL" %>
<%@page import="javax.portlet.WindowState" %>


<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %>


<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>


<%@ page import="com.liferay.portlet.PortalPreferences" %>
<%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil" %>

<portlet:defineObjects />
<theme:defineObjects />

<%
	String baseUrl = portletPreferences.getValue("baseUrl", "");

	String heightMaximized = GetterUtil.getString(portletPreferences.getValue("heightMaximized", "600"));
	String heightNormal = GetterUtil.getString(portletPreferences.getValue("heightNormal", "600"));
	String width = GetterUtil.getString(portletPreferences.getValue("width", "100%"));

	String alt = portletPreferences.getValue("alt", StringPool.BLANK);
	String border = portletPreferences.getValue("border", "0");
	String bordercolor = portletPreferences.getValue("bordercolor", "#000000");
	String frameborder = portletPreferences.getValue("frameborder", "0");
	String hspace = portletPreferences.getValue("hspace", "0");
	String longdesc = portletPreferences.getValue("longdesc", StringPool.BLANK);
	String scrolling = portletPreferences.getValue("scrolling", "auto");
	String title = portletPreferences.getValue("title", StringPool.BLANK);
	String vspace = portletPreferences.getValue("vspace", "0");
%>