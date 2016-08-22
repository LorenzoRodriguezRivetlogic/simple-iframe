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

<liferay-portlet:actionURL var="configurationURL"
	portletConfiguration="true">
</liferay-portlet:actionURL>

<%
String htmlAttributes =
	"alt=" + alt + "\n" +
	"border=" + border + "\n" +
	"bordercolor=" + bordercolor + "\n" +
	"frameborder=" + frameborder + "\n" +
	"hspace=" + hspace + "\n" +
	"longdesc=" + longdesc + "\n" +
	"scrolling=" + scrolling + "\n" +
	"title=" + title + "\n" +
	"vspace=" + vspace + "\n";
%>

<aui:form action="<%=configurationURL%>" method="post" name="fm">
	<aui:input name="<%=Constants.CMD%>" type="hidden" value="<%=Constants.UPDATE%>" />
	
	<liferay-ui:panel-container extended="<%= true %>" id="iframeSettingsPanelContainer" persistState="<%= true %>">
		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="iframeGeneralPanel" persistState="<%= true %>" title="general">
			<aui:fieldset>
				<aui:input name="preferences--baseUrl--" value="<%=baseUrl%>" cssClass="input-base-url"/>
			</aui:fieldset>
			<div class="alert alert-info" role="alert">
				<h5>Variables that can be used: </h5>
				<br/>
				Related to the owner of the page:<br/>
				<b>@owner.email@</b>
				<b>@owner.firstName@</b>
				<b>@owner.lastName@</b>
				<b>@owner.screenName@</b>
				<b>@owner.userId@</b>
				<br/>
				Related to the current user: <br/>
				<b>@email@</b>
				<b>@firstName@</b>
				<b>@lastName@</b>
				<b>@screenName@</b>
				<b>@userId@</b>
			</div>
		</liferay-ui:panel>
	
		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="iframeAuthenticationPanel" persistState="<%= true %>" title="display-settings">
			<aui:fieldset>

				<div id="<portlet:namespace />displaySettings">
					<aui:input name="preferences--heightMaximized--" type="text" value="<%= heightMaximized %>">
						<aui:validator name="digits" />
						<aui:validator name="required" />
					</aui:input>

					<aui:input name="preferences--heightNormal--" type="text" value="<%= heightNormal %>">
						<aui:validator name="digits" />
						<aui:validator name="required" />
					</aui:input>

					<aui:input name="preferences--width--" type="text" value="<%= width %>" />
				</div>

				<aui:input cssClass="input-html-attributes" name="preferences--htmlAttributes--" onKeyDown="Liferay.Util.checkTab(this); Liferay.Util.disableEsc();" type="textarea" value="<%= htmlAttributes %>" wrap="soft" />
			</aui:fieldset>
		</liferay-ui:panel>
	</liferay-ui:panel-container>
	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>
