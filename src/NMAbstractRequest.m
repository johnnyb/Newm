// Copyright 2011 Jonathan Bartlett

#import "Foundation/Foundation.h"
#import "NMAbstractRequest.h"

@implementation NMAbstractRequest

@synthesize queryString;
@synthesize postData;
@synthesize httpReferer;
@synthesize httpUserAgent;
@synthesize pathInfo;
@synthesize remoteAddress;
@synthesize requestMethod;
@synthesize serverName;
@synthesize params;
@synthesize port;

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

	[super dealloc];
}

@end
