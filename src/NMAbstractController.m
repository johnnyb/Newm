#import "NMAbstractController.h"

@implementation NMAbstractController

@synthesize beforeFilters;
@synthesize request;

-(id) init {
	self = [super init];
	self.beforeFilters = [NSMutableArray arrayWithCapacity:10];

	return self;
}

-(void) reset {
	self.request = nil;
}

-(void) runBeforeFilters {
	int i;
	for(i = 0; i < beforeFilters.count; i++) {
		NSInvocation *inv = [beforeFilters objectAtIndex:i];
		[inv invoke];
		//FIXME - check status to see if I need to redirect or stop the call chain or something
	}
}

-(void) addBeforeFilterWithSelector:(SEL)filter {
	NSMethodSignature *ms = [self methodSignatureForSelector:filter];
	NSInvocation *inv = [NSInvocation invocationWithMethodSignature:ms];
	[inv setTarget:self];
	[beforeFilters addObject:inv];
}

-(void) addBeforeFilterWithInvocation:(NSInvocation *)inv {
	if([inv target] == nil) {
		[inv setTarget:self];
	}
	[beforeFilters addObject:inv];
}


-(void) dealloc {
	[beforeFilters release];
	[request release];

	[super dealloc];
}

@end
