// Copyright 2011 Jonathan Bartlett

#import "NMNewmApp.h"
#import "NewmGlobals.h"
#import "NMRoute.h"
#import "stdio.h"

@implementation NMNewmApp

@synthesize routeMap;

-(void) processRequest:(NMAbstractRequest *)req usingResponse:(NMAbstractResponse *)resp {
	//use route map to map pathInfo into params, then use params to map to controllers and actions
	NMRoute *route = [routeMap routeForRequest:req];
	if(route == nil) {
		//FIXME - raise an error
		fprintf(stderr, "NO ROUTE FOUND!\n");
	}
	[route applyToRequest:req];
	NSString *actionName = [req.params objectForKey:@"action"];
	NSString *controllerName = [req.params objectForKey:@"controller"];

	//FIXME - should I cache the controllers as I make them?
	//NOTE - if I do cache the controllers, I need to run reset
	fprintf(stderr, "Controller: %s\n", [controllerName cStringUsingEncoding:NSUTF8StringEncoding]);
	fprintf(stderr, "Action: %s\n", [actionName cStringUsingEncoding:NSUTF8StringEncoding]);
	
	Class controller_class = objc_getClass([controllerName cStringUsingEncoding:NSUTF8StringEncoding]);
	NMAbstractController *controller = [[[controller_class alloc] init] autorelease];

	// Initialize the controller
	controller.application = self;
	controller.request = req;
	controller.response = resp;

	[controller runActionNamed:actionName];	

	[resp sendHeaders];
	[resp sendContent];
}

-(id) init {
	self = [super init];
	NMRouteMap *tmpmap = [[NMRouteMap alloc] init];
	self.routeMap = tmpmap;

	return self;
}

-(void) dealloc {
	[routeMap release];

	[super dealloc];
}

@end
