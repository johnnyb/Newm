// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import "Newm.h"
#import "NMRoute.h"

@interface NMRouteMap : NSObject {
	NSMutableArray *routeDefinitions;
	NSMutableDictionary *routesByName;
	NMRoute *defaultRoute;
}

-(NMRoute *)routeForRequest:(NMAbstractRequest *)req;
-(void) addRoute:(NMRoute *)route;
-(void) addRoute:(NMRoute *)route named:(NSString *)nm;
-(void) setDefaultRoute:(NMRoute *)route;
-(NMRoute *)routeNamed:(NSString *)nm;

@property (retain) NSMutableArray *routeDefinitions;
@property (retain) NMRoute *defaultRoute;
@property (retain) NSMutableDictionary *routesByName;

@end
