// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMCgiRequest.h>
#import <Newm/NMCookieJar.h>
#import <Newm/NSDictionary+Newm.h>
#import <Newm/NSData+Newm.h>
#import <stdlib.h>

// Return an empty string if the environment variable isn't set
char *getenv2(char *var) {
	char *val = getenv(var);
	if(val == 0) {
		return "";
	}

	return val;
}

NSString *stringForEnv(char *var) {
	return [NSString stringWithCString:getenv2(var) encoding:NSUTF8StringEncoding];
}

@implementation NMCgiRequest


-(void) loadEnvironmentVariables {
	[super init];

	[self setQueryString: stringForEnv("QUERY_STRING")];
	[self setContentType: stringForEnv("CONTENT_TYPE")];
	[self setHttpReferer: stringForEnv("HTTP_REFERER")];
	[self setHttpUserAgent: stringForEnv("HTTP_USER_AGENT")];
	[self setPathInfo: stringForEnv("PATH_INFO")];
	[self setRemoteAddress: stringForEnv("REMOTE_ADDR")];
	[self setRequestMethod: stringForEnv("REQUEST_METHOD")];
	[self setServerName: stringForEnv("SERVER_NAME")];
	[self setPort: strtol(getenv2("SERVER_PORT"), NULL, 10)];

	// Parse Query String Data
	[self setParams: [NSDictionary dictionaryFromURLEncodedQueryString:queryString]];

	// Manage POST data
	int content_length = strtol(getenv2("CONTENT_LENGTH"), NULL, 10);
	if(content_length > MAX_CGI_CONTENT_LENGTH) {
		//FIXME - give an error for too much data
	} else {
		if(content_length > 0) {
			NSFileHandle *fh = [NSFileHandle fileHandleWithStandardInput];
			[self setPostData: [fh readDataToEndOfFile]];
			NSDictionary *postDict = [NSDictionary dictionaryFromURLEncodedQueryString:[postData stringValue]];
			[params addEntriesFromDictionary:postDict];
		}
	}

	// Parse Cookies
	[self setCookieJar:[NMCookieJar cookieJarForCookieHeaderValue:stringForEnv("HTTP_COOKIE")]];
}

@end
