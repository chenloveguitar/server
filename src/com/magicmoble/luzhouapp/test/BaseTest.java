package com.magicmoble.luzhouapp.test;

import org.junit.Before;

import cn.jpush.api.JPushClient;

public abstract class BaseTest {

//	protected static final String APP_KEY = "d4ee2375846bc30fa51334f5";
//    protected static final String MASTER_SECRET = "cfb11ca45888cdd6388483f5";
//    protected static final String GROUP_MASTER_SECRET = "b11314807507e2bcfdeebe2e";
//    protected static final String GROUP_PUSH_KEY = "2c88a01e073a0fe4fc7b167c";
//
    public static final String ALERT = "您有一条新消息，请注意查收！";
//    public static final String MSG_CONTENT = "JPush Test - msgContent";
//    
//    public static final String REGISTRATION_ID1 = "0900e8d85ef";
//    public static final String REGISTRATION_ID2 = "0a04ad7d8b4";
//    public static final String REGISTRATION_ID3 = "18071adc030dcba91c0";
	protected static final String MASTER_SECRET = "7b68545916b439b2afa0fd0d";
	protected static final String APP_KEY = "a084742e817a012341dbbb8d";
    
	public static final String REGISTRATION_ID = "13165ffa4e0d71a2bdb";
//	public static final String ALIAS = "6808C00B0E3C06B5E5B7E1DBDECCE010";//ios
	public static final String ALIAS = "D244592F8B647E5D294ED12FA151E019";//Android
    protected JPushClient jpushClient = null;
    
    @Before
    public void before() {
        jpushClient = new JPushClient(MASTER_SECRET, APP_KEY);
        
    }

}