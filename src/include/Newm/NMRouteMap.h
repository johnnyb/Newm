// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRoute.h>

@interface NMRouteMap : NSObject {
	NSMutableArray *routeDefinitions;
	NSMutableDictionary *routesByName;
	id<NMAbstractRoute> defaultRoute;
}

-(id<NMAbstractRoute>)routeForRequest:(NMAbstractRequest *)req;
-(void) addRoute:(id<NMAbstractRoute>)route;
-(void) addRoute:(id<NMAbstractRoute>)route named:(NSString *)nm;
-(void) setDefaultRoute:(id<NMAbstractRoute>)route;
-(id<NMAbstractRoute>)routeNamed:(NSString *)nm;

-(NSMutableArray *) routeDefinitions;
-(void)setRouteDefinitions:(NSMutableArray *)val;

-(id<NMAbstractRoute>) defaultRoute;
-(void)setDefaultRoute:(id<NMAbstractRoute>)val;
-(NSMutableDictionary *) routesByName;
-(void)setRoutesByName:(NSMutableDictionary *)val;


@end
