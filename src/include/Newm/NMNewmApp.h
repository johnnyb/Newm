// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMRouteMap.h>
#import <Newm/NMAbstractRequest.h>
#import <Newm/NMAbstractResponse.h>

@class NMRouteMap;
@class NMAbstractSession;

@interface NMNewmApp : NSObject {
	NSString *sessionSecret;
	NMRouteMap *routeMap;
}

-(void) processRequest:(NMAbstractRequest *)req usingResponse:(NMAbstractResponse *)resp;

OBJC_ACC_DECL(NMRouteMap *, routeMap, setRouteMap)
OBJC_ACC_DECL(NSString *, sessionSecret, setSessionSecret)

-(NSString *)sessionCookieKey;

-(NMAbstractSession *) buildSession;

@end
