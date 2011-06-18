// Copyright 2011 Jonathan Bartlett

#import "NMRouteMap.h"

@implementation NMRouteMap

@synthesize routeDefinitions;
@synthesize defaultRoute;
@synthesize routesByName;

-(id) init {
	self = [super init];
	self.routeDefinitions = [NSMutableArray arrayWithCapacity:20];
	self.defaultRoute = [[[NMRoute alloc] init] autorelease];
	self.routesByName = [NSMutableDictionary dictionaryWithCapacity:20];

	return self;
}

-(void) addRoute:(NMRoute *)route {
	[routeDefinitions addObject:route];
}

-(void) addRoute:(NMRoute *)route named:(NSString *)nm {
	[routeDefinitions addObject:route];
	if(nm != nil) {
		[routesByName setObject:route forKey:nm];
	}
}

-(NMRoute *)routeNamed:(NSString *)nm {
	return [routesByName objectForKey:nm];
}

-(NMRoute *)routeForRequest:(NMAbstractRequest *)req {
	int i;
	for(i = 0; i < routeDefinitions.count; i++) {
		NMRoute *route = [routeDefinitions objectAtIndex:i];
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
