#import "Foundation/Foundation.h"

@interface NMAbstractRequest : NSObject {
	NSString *queryString;
	NSData *postData;
	NSString *httpReferer;
	NSString *httpUserAgent;
	NSString *pathInfo;
	NSString *remoteAddress;
	NSString *requestMethod;
	NSString *serverName;
	NSMutableDictionary *params;
	int port;
}

-(void) process;


@property (retain) NSString *queryString;
@property (retain) NSData *postData;
@property (retain) NSString *httpReferer;
@property (retain) NSString *httpUserAgent;
@property (retain) NSString *pathInfo;
@property (retain) NSString *remoteAddress;
@property (retain) NSString *requestMethod;
@property (retain) NSString *serverName;
@property (retain) NSMutableDictionary *params;
@property int port;

@end
