// Copyright 2011 Jonathan Bartlett

#import "NMRoute.h"

@implementation NMRoute

+(NMRoute *)routeWithPath:(NSString *)rpath params:(NSDictionary *)p {
	return [[[NMRoute alloc] init] autorelease];
}

-(id) init {
	[super init];
	return self;
}

-(BOOL) matchesRequest:(NMAbstractRequest *)req {
	//FIXME - use pathInfo to check to see if this request is appropriate

	return YES;
}

-(void) applyToRequest:(NMAbstractRequest *)req {
	//FIXME - modify req.params according to what is in our route
}

@end
