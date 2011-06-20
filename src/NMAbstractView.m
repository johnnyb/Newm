#import "NMAbstractView.h"

@implementation NMAbstractView

+(NMAbstractView *) layoutForControllerName:(NSString *)cname format:(NSString *)fmt {
	NSString *viewClassName = [NSString stringWithFormat:@"NewmView_layout_%@_%@", cname, fmt];
	Class viewClass = objc_getClass([viewClassName cStringUsingEncoding:NSUTF8StringEncoding]);
	if(viewClass == nil) {
		return nil;
	}

	NMAbstractView *v = [[viewClass alloc] init];
	return v;
}
+(NMAbstractView *) viewForControllerName:(NSString *)cname actionName:(NSString *)aname format:(NSString *)fmt {
	NSString *viewClassName = [NSString stringWithFormat:@"NewmView_view_%@_%@_%@", cname, aname, fmt];
	Class viewClass = objc_getClass([viewClassName cStringUsingEncoding:NSUTF8StringEncoding]);
	if(viewClass == nil) {
		return nil;
	}
	NMAbstractView *v = [[viewClass alloc] init];

	return v;
}

-(id) init {
	self = [super init];
	[self reset];

	return self;
}

-(void) reset {
	/* Release hold on any data */
}

// Render using a controller
-(NSData *) render:(NMAbstractController *)ctrl {
	//NOTE - view need to override this
	return [@"FIXME - need to override" dataUsingEncoding:NSUTF8StringEncoding];
}

-(void) dealloc {
	[super dealloc];
}

@end
