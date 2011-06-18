#import "NMRouteMap.h"

@implementation NMRouteMap

@synthesize routeDefinitions;

-(id) init {
	self = [super init];
	self.routeDefinitions = [NSMutableDictionary dictionaryWithCapacity:20];

	return self;
}

-(void) addRoute:(NSArray *)routeComponents params:(NSDictionary *)params name:(NSString *)nm {
	// FIXME - nothing here
	// Split routeString into components.  
	// Set each part into a dictionary
	// Should probably setup an NMRoute class
}

-(void) dealloc {
	[routeDefinitions release];

	[super dealloc];
}

@end
