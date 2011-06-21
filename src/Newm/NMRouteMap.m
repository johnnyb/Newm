// Copyright 2011 Jonathan Bartlett

#import <Newm/NMRouteMap.h>

@implementation NMRouteMap

-(NSMutableArray *) routeDefinitions { return routeDefinitions; }
-(void) setRouteDefinitions:(NSMutableArray *)val { [val retain]; [routeDefinitions release]; routeDefinitions = val; }

-(id<NMAbstractRoute>) defaultRoute { return defaultRoute; }
-(void) setDefaultRoute:(id<NMAbstractRoute>)val { [val retain]; [defaultRoute release]; defaultRoute = val; }

-(NSMutableDictionary *) routesByName { return routesByName; }
-(void) setRoutesByName:(NSMutableDictionary *)val { [val retain]; [routesByName release]; routesByName = val; }


-(id) init {
	self = [super init];
	[self setRouteDefinitions: [NSMutableArray arrayWithCapacity:20]];
	[self setDefaultRoute: nil];
	[self setRoutesByName: [NSMutableDictionary dictionaryWithCapacity:20]];

	return self;
}

-(void) addRoute:(id<NMAbstractRoute>)route {
	[routeDefinitions addObject:route];
}

-(void) addRoute:(id<NMAbstractRoute>)route named:(NSString *)nm {
	[routeDefinitions addObject:route];
	if(nm != nil) {
		[routesByName setObject:route forKey:nm];
	}
}

-(id<NMAbstractRoute>)routeNamed:(NSString *)nm {
	return [routesByName objectForKey:nm];
}

-(id<NMAbstractRoute>)routeForRequest:(NMAbstractRequest *)req {
	int i;
	for(i = 0; i < [routeDefinitions count]; i++) {
		id<NMAbstractRoute> route = [routeDefinitions objectAtIndex:i];
		if([route matchesRequest:req]) {
			return route;
		}
	}

	return defaultRoute;
}

-(void) dealloc {
	[routeDefinitions release];
	[defaultRoute release];
	[routesByName release];

	[super dealloc];
}

@end
