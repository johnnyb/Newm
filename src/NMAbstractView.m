#import "NMAbstractView.h"

@implementation NMAbstractView

@synthesize controller;

+(NMAbstractView *) viewForControllerName:(NSString *)cname actionName:(NSString *)aname format:(NSString *)fmt {
	NSString *viewClassName = [NSString stringWithFormat:@"NewmView_%@_%@_%@", cname, aname, fmt];
	Class viewClass = objc_getClass([viewClassName cStringUsingEncoding:NSUTF8StringEncoding]);
	NMAbstractView *v = [[viewClass alloc] init];

	return v;
}

-(id) init {
	self = [super init];
	[self reset];

	return self;
}

-(void) reset {
	/* Release hold on request data */
	self.controller = nil;
}

-(NSData *) render {
	//NOTE - view need to override this
	return [@"FIXME - need to override" dataUsingEncoding:NSUTF8StringEncoding];
}

-(void) dealloc {
	[controller release];

	[super dealloc];
}

@end
