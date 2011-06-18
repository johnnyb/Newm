#import "NMNewmApp.h"
#import "NewmGlobals.h"

@implementation NMNewmApp

@synthesize routeMap;

+(NMNewmApp *) boot {
	Class app_class = objc_getClass([newmAppClassName cStringUsingEncoding:NSUTF8StringEncoding]);
	NMNewmApp *app = [[app_class alloc] init];
	//class_createInstance(app_class, 0);

	return app;
}

-(id) init {
	self = [super init];
	self.routeMap = [[[NMRouteMap alloc] init] autorelease];

	return self;
}

-(void) dealloc {
	[routeMap release];

	[super dealloc];
}

@end
