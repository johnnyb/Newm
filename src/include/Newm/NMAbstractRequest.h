// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>

// FIXME - no file support yet!

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
	int port;
}

-(void) process;


-(NSString *) queryString;
-(void)setQueryString:(NSString *)val;

-(NSData *) postData;
-(void)setPostData:(NSData *)val;

-(NSString *) httpReferer;
-(void)setHttpReferer:(NSString *)val;

-(NSString *) httpUserAgent;
-(void)setHttpUserAgent:(NSString *)val;

-(NSString *) pathInfo;
-(void)setPathInfo:(NSString *)val;

-(NSString *) remoteAddress;
-(void)setRemoteAddress:(NSString *)val;

-(NSString *) requestMethod;
-(void)setRequestMethod:(NSString *)val;

-(NSString *) serverName;
-(void)setServerName:(NSString *)val;

-(NSString *) contentType;
-(void)setContentType:(NSString *)val;

-(NSMutableDictionary *) params;
-(void)setParams:(NSMutableDictionary *)val;

-(int) port;
-(void)setPort:(int)val;

@end
