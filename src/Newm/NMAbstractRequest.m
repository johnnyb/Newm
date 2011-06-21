// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>

@implementation NMAbstractRequest

-(NSString *) contentType { return contentType; }
-(void) setContentType:(NSString *)val { [val retain]; [contentType release]; contentType = val; }

-(NSString *) queryString { return queryString; }
-(void) setQueryString:(NSString *)val { [val retain]; [queryString release]; queryString = val; }

-(NSData *) postData { return postData; }
-(void) setPostData:(NSData *)val { [val retain]; [postData release]; postData = val; }

-(NSString *) httpReferer { return httpReferer; }
-(void) setHttpReferer:(NSString *)val { [val retain]; [httpReferer release]; httpReferer = val; }

-(NSString *) httpUserAgent { return httpUserAgent; }
-(void) setHttpUserAgent:(NSString *)val { [val retain]; [httpUserAgent release]; httpUserAgent = val; }

-(NSString *) pathInfo { return pathInfo; }
-(void) setPathInfo:(NSString *)val { [val retain]; [pathInfo release]; pathInfo = val; }

-(NSString *) remoteAddress { return remoteAddress; }
-(void) setRemoteAddress:(NSString *)val { [val retain]; [remoteAddress release]; remoteAddress = val; }

-(NSString *) requestMethod { return requestMethod; }
-(void) setRequestMethod:(NSString *)val { [val retain]; [requestMethod release]; requestMethod = val; }

-(NSString *) serverName { return serverName; }
-(void) setServerName:(NSString *)val { [val retain]; [serverName release]; serverName = val; }

-(NSMutableDictionary *) params { return params; }
-(void) setParams:(NSMutableDictionary *)val { [val retain]; [params release]; params = val; }

-(int) port { return port; }
-(void) setPort:(int)val { port = val; }


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
