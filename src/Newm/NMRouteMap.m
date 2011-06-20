// Copyright 2011 Jonathan Bartlett

#import "NMRouteMap.h"

@implementation NMRouteMap

@synthesize routeDefinitions;
@synthesize defaultRoute;
@synthesize routesByName;

-(id) init {
	self = [super init];
	self.routeDefinitions = [NSMutableArray arrayWithCapacity:20];
	self.defaultRoute = nil;
	self.routesByName = [NSMutableDictionary dictionaryWithCapacity:20];

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
	for(i = 0; i < routeDefinitions.count; i++) {
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
