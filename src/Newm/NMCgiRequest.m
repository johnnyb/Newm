// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMCgiRequest.h>
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

	self.queryString = stringForEnv("QUERY_STRING");
	self.contentType = stringForEnv("CONTENT_TYPE");
	self.httpReferer = stringForEnv("HTTP_REFERER");
	self.httpUserAgent = stringForEnv("HTTP_USER_AGENT");
	self.pathInfo = stringForEnv("PATH_INFO");
	self.remoteAddress = stringForEnv("REMOTE_ADDR");
	self.requestMethod = stringForEnv("REQUEST_METHOD");
	self.serverName = stringForEnv("SERVER_NAME");
	self.port = strtol(getenv2("SERVER_PORT"), NULL, 10);

	// Parse Query String Data
	self.params = [NSDictionary dictionaryFromURLEncodedQueryString:queryString];

	// Manage POST data
	int content_length = strtol(getenv2("CONTENT_LENGTH"), NULL, 10);
	if(content_length > MAX_CGI_CONTENT_LENGTH) {
		//FIXME - give an error for too much data
	} else {
		if(content_length > 0) {
			NSFileHandle *fh = [NSFileHandle fileHandleWithStandardInput];
			self.postData = [fh readDataToEndOfFile];
			NSDictionary *postDict = [NSDictionary dictionaryFromURLEncodedQueryString:[postData stringValue]];
			[params addEntriesFromDictionary:postDict];
		}
	}
}

@end
