/**
 * Copyright (C) 2005-2016 Rivet Logic Corporation.
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
 * Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

package com.rivetlogic.intranet.portlet;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.util.bridges.mvc.MVCPortlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

/**
 * Portlet implementation class IframePortlet
 */
public class SimpleIframePortlet extends MVCPortlet {
 
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException, IOException {
		
		ThemeDisplay themeDisplay = (ThemeDisplay)renderRequest.getAttribute(WebKeys.THEME_DISPLAY);
		Map<String, String>valuesMap = new HashMap<String, String>();
		long pageOwnerId;
		try {
			pageOwnerId = themeDisplay.getLayout().getGroup().getCreatorUserId();
			User pageOwnerUser = UserLocalServiceUtil.getUser(pageOwnerId);
			User currentUser = themeDisplay.getUser();
			
			//Owner of the page
			valuesMap.put(IframeConstants.OWNER_EMAIL, pageOwnerUser.getEmailAddress());
			valuesMap.put(IframeConstants.OWNER_FIRST_NAME, pageOwnerUser.getFirstName());
			valuesMap.put(IframeConstants.OWNER_LAST_NAME, pageOwnerUser.getLastName());
			valuesMap.put(IframeConstants.OWNER_USER_ID, String.valueOf(pageOwnerUser.getUserId()));
			valuesMap.put(IframeConstants.OWNER_SCREEN_NAME, pageOwnerUser.getScreenName());
			
			//Visitor
			valuesMap.put(IframeConstants.EMAIL, currentUser.getEmailAddress());
			valuesMap.put(IframeConstants.FIRST_NAME, currentUser.getFirstName());
			valuesMap.put(IframeConstants.LAST_NAME, currentUser.getLastName());
			valuesMap.put(IframeConstants.USER_ID, String.valueOf(currentUser.getUserId()));
			valuesMap.put(IframeConstants.SCREEN_NAME, currentUser.getScreenName());
			
			renderRequest.setAttribute(IframeConstants.VALUES_MAP, valuesMap);
			
		} catch (PortalException e) {
			logger.error(e);
		} catch (SystemException e) {
			logger.error(e);
		}
		
		super.render(renderRequest, renderResponse);
	}
	
	private static final Log logger = LogFactoryUtil.getLog(SimpleIframePortlet.class);
	
}
