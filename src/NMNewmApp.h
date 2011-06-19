// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import "NMRouteMap.h"
#import "NMAbstractRequest.h"
#import "NMAbstractResponse.h"

@class NMNewmApp;

@interface NMNewmApp : NSObject {
	NMRouteMap *routeMap;
}

+(NMNewmApp *) boot;

-(void) processRequest:(NMAbstractRequest *)req usingResponse:(NMAbstractResponse *)resp;

@property (retain) NMRouteMap *routeMap;

@end
