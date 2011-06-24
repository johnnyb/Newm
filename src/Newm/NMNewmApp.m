// Copyright 2011 Jonathan Bartlett

#import <Newm/NMNewmApp.h>
#import <Newm/NMRoute.h>
#import <Newm/NMAbstractController.h>
#import <stdio.h>

@implementation NMNewmApp

-(NMRouteMap *) routeMap { return routeMap; }
-(void) setRouteMap:(NMRouteMap *)val { [val retain]; [routeMap release]; routeMap = val; }

-(void) processRequest:(NMAbstractRequest *)req usingResponse:(NMAbstractResponse *)resp {
	//use route map to map pathInfo into params, then use params to map to controllers and actions
	NMRoute *route = [routeMap routeForRequest:req];
	if(route == nil) {
		//FIXME - raise an error
		fprintf(stderr, "NO ROUTE FOUND for %s!\n", [[req pathInfo] cStringUsingEncoding:NSUTF8StringEncoding]);
	}
	[route applyToRequest:req];
	NSString *actionName = [[req params] objectForKey:@"action"];
	NSString *controllerName = [[req params] objectForKey:@"controller"];

	//FIXME - should I cache the controllers as I make them?
	//NOTE - if I do cache the controllers, I need to run reset
	fprintf(stderr, "Controller: %s\n", [controllerName cStringUsingEncoding:NSUTF8StringEncoding]);
	fprintf(stderr, "Action: %s\n", [actionName cStringUsingEncoding:NSUTF8StringEncoding]);
	
	Class controller_class = objc_getClass([controllerName cStringUsingEncoding:NSUTF8StringEncoding]);
	NMAbstractController *controller = [[[controller_class alloc] init] autorelease];

	// Initialize the controller
	[controller setApplication: self];
	[controller setRequest: req];
	[controller setResponse: resp];
	[controller loadSession];

	[controller runActionNamed:actionName];	

	[resp sendHeaders];
	[resp sendContent];
}

-(id) init {
	self = [super init];
	NMRouteMap *tmpmap = [[NMRouteMap alloc] init];
	[self setRouteMap: tmpmap];

	return self;
}

-(NSString *)sessionCookieKey {
	return [@"_session_" stringByAppendingString:[self className]];
}

-(void) dealloc {
	[routeMap release];

	[super dealloc];
}

@end
