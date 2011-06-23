// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMRouteMap.h>
#import <Newm/NMAbstractRequest.h>
#import <Newm/NMAbstractResponse.h>

@class NMRouteMap;

@interface NMNewmApp : NSObject {
	NMRouteMap *routeMap;
}

-(void) processRequest:(NMAbstractRequest *)req usingResponse:(NMAbstractResponse *)resp;

-(NMRouteMap *) routeMap;
-(void)setRouteMap:(NMRouteMap *)val;
-(NSString *)sessionCookieKey;


@end
