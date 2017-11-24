package com.magicmoble.luzhouapp.test;

import java.net.URI;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.jiguang.common.ClientConfig;
import cn.jiguang.common.ServiceHelper;
import cn.jiguang.common.connection.NettyHttpClient;
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;

public class PushClientTest extends BaseTest {

	protected static final Logger LOG = LoggerFactory.getLogger(PushClientTest.class);

	@Test
	public void testSendPush() throws APIConnectionException, APIRequestException {
		ClientConfig clientConfig = ClientConfig.getInstance();
		JPushClient jpushClient = new JPushClient(MASTER_SECRET, APP_KEY, null, clientConfig);
		PushPayload payload = buildPushObject_all_alias_alert();
//		try {
			PushResult result = jpushClient.sendPush(payload);
			int status = result.getResponseCode();
			LOG.info("Got result - " + result);

//		} catch (APIConnectionException e) {
//			LOG.error("Connection error. Should retry later. ", e);
//			LOG.error("Sendno: " + payload.getSendno());
//
//		} catch (APIRequestException e) {
//			LOG.error("Error response from JPush server. Should review and fix it. ", e);
//			LOG.info("HTTP Status: " + e.getStatus());
//			LOG.info("Error Code: " + e.getErrorCode());
//			LOG.info("Error Message: " + e.getErrorMessage());
//			LOG.info("Msg ID: " + e.getMsgId());
//			LOG.error("Sendno: " + payload.getSendno());
//		}
	}

	public static PushPayload buildPushObject_all_alias_alert() {
		return PushPayload.newBuilder().setPlatform(Platform.all()).setAudience(Audience.alias(ALIAS))
				.setNotification(Notification.alert(ALERT)).build();
	}
}
