#import "Foundation/Foundation.h"
#import "NMCgiRequest.h"
#import "stdlib.h"
#import "Newm.h"

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

	int content_length = strtol(getenv2("CONTENT_LENGTH"), NULL, 10);
	self.queryString = stringForEnv("QUERY_STRING");
	self.httpReferer = stringForEnv("HTTP_REFERER");
	self.httpUserAgent = stringForEnv("HTTP_USER_AGENT");
	self.pathInfo = stringForEnv("PATH_INFO");
	self.remoteAddress = stringForEnv("REMOTE_ADDR");
	self.requestMethod = stringForEnv("REQUEST_METHOD");
	self.serverName = stringForEnv("SERVER_NAME");
	self.port = strtol(getenv2("SERVER_PORT"), NULL, 10);

	// Manage POST data

	

	// Parse POST and query data
	self.params = [NSDictionary dictionaryFromURLEncodedQueryString:queryString];
}

@end
