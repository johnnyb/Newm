// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NewmMacros.h>

// FIXME - no file support yet!

@class NMCookieJar;
@interface NMAbstractRequest : NSObject {
	NSString *queryString;
	NSData *postData;
	NSString *httpReferer;
	NSString *httpUserAgent;
	NSString *pathInfo;
	NSString *remoteAddress;
	NSString *requestMethod;
	NSString *serverName;
	NSString *contentType;
	NSMutableDictionary *params;
	NMCookieJar *cookieJar;
	int port;
}

-(void) process;


OBJC_ACC_DECL(NSString *, contentType, setContentType)
OBJC_ACC_DECL(NSString *, queryString, setQueryString)
OBJC_ACC_DECL(NSData *, postData, setPostData)
OBJC_ACC_DECL(NSString *, httpReferer, setHttpReferer)
OBJC_ACC_DECL(NSString *, httpUserAgent, setHttpUserAgent)
OBJC_ACC_DECL(NSString *, pathInfo, setPathInfo)
OBJC_ACC_DECL(NSString *, remoteAddress, setRemoteAddress)
OBJC_ACC_DECL(NSString *, requestMethod, setRequestMethod)
OBJC_ACC_DECL(NSString *, serverName, setServerName)
OBJC_ACC_DECL(NSMutableDictionary *, params, setParams)
OBJC_ACC_DECL(NMCookieJar *, cookieJar, setCookieJar)
OBJC_ACC_DECL(int, port, setPort)

@end
