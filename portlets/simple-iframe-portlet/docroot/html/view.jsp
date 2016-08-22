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

<%@include file="/html/init.jsp"%>


<% 
String iframeHeight = heightNormal;
Map<String, String>valuesMap = (Map<String, String>)request.getAttribute(IframeConstants.VALUES_MAP);
String sourceUrl = baseUrl;
if(null != valuesMap && !valuesMap.isEmpty()){
	Set<Entry<String, String>> entriesSet =  valuesMap.entrySet();
	List<String>keysList = new ArrayList<String>();
	List<String>valuesList = new ArrayList<String>();
	int counter = 0;
	for(Entry<String, String> mapEntry : entriesSet){
		keysList.add(counter, mapEntry.getKey());
		valuesList.add(counter, mapEntry.getValue());
		counter++;
	}
	sourceUrl = StringUtil.replace(baseUrl, keysList.toArray(new String[]{}), valuesList.toArray(new String[]{}));
}
%>

<iframe
	alt="<%= HtmlUtil.escapeAttribute(alt) %>" border="<%= HtmlUtil.escapeAttribute(border) %>" 
	bordercolor="<%= HtmlUtil.escapeAttribute(bordercolor) %>" frameborder="<%= HtmlUtil.escapeAttribute(frameborder) %>" 
	height="<%= HtmlUtil.escapeAttribute(iframeHeight) %>" hspace="<%= HtmlUtil.escapeAttribute(hspace) %>" 
	id="<portlet:namespace />iframe" longdesc="<%= HtmlUtil.escapeAttribute(longdesc) %>" 
	name="<portlet:namespace />iframe" 
	scrolling="<%= HtmlUtil.escapeAttribute(scrolling) %>" src="<%= HtmlUtil.escapeHREF(sourceUrl) %>" 
	title="<%= HtmlUtil.escapeAttribute(title) %>" vspace="<%= HtmlUtil.escapeAttribute(vspace) %>" width="<%= HtmlUtil.escapeAttribute(width) %>">
</iframe>