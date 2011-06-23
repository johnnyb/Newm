// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>

@implementation NMAbstractRequest

OBJC_ACC(NSString *, contentType, contentType, setContentType)
OBJC_ACC(NSString *, queryString, queryString, setQueryString)
OBJC_ACC(NSData *, postData, postData, setPostData)
OBJC_ACC(NSString *, httpReferer, httpReferer, setHttpReferer)
OBJC_ACC(NSString *, httpUserAgent, httpUserAgent, setHttpUserAgent)
OBJC_ACC(NSString *, pathInfo, pathInfo, setPathInfo)
OBJC_ACC(NSString *, remoteAddress, remoteAddress, setRemoteAddress)
OBJC_ACC(NSString *, requestMethod, requestMethod, setRequestMethod)
OBJC_ACC(NSString *, serverName, serverName, setServerName)
OBJC_ACC(NSMutableDictionary *, params, params, setParams)
OBJC_ACC(NMCookieJar *, cookieJar, cookieJar, setCookieJar)
OBJC_ACC_ASSIGN(int, port, port, setPort)

-(void) process {
	//FIXME - this should raise an error
}

-(void) dealloc {
	[queryString release];
	[postData release];
	[httpReferer release];
	[httpUserAgent release];
	[pathInfo release];
	[remoteAddress release];
	[requestMethod release];
	[serverName release];
	[params release];
	[contentType release];

	[super dealloc];
}

@end
