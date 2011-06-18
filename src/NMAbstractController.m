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
		printf("Running before filter: %d", i);
		[inv invoke];
		//FIXME - check status to see if I need to redirect or stop the call chain or something
	}
}

-(void) runAction:(SEL)selector {
	[self runBeforeFilters];
	[self performSelector:selector];
}

-(void) runActionNamed:(NSString *)actionName {

	SEL actionSelector = NSSelectorFromString(actionName);

	[self runAction:actionSelector];
}

-(void) addBeforeFilterWithSelector:(SEL)filter {
	NSMethodSignature *ms = [self methodSignatureForSelector:filter];
	NSInvocation *inv = [NSInvocation invocationWithMethodSignature:ms];
	[inv setSelector:filter];
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
