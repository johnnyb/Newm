// Copyright 2011 Jonathan Bartlett

#import "NMAbstractController.h"

@implementation NMAbstractController

@synthesize application;
@synthesize beforeFilters;
@synthesize request;
@synthesize response;
@synthesize defaultLayout;
@synthesize currentLayout;
@synthesize actionViewData;

-(id) init {
	self = [super init];
	self.beforeFilters = [NSMutableArray arrayWithCapacity:10];

	return self;
}

-(void) reset {
	/* Reset request data */
	self.request = nil;
	self.response = nil;
	self.currentLayout = self.defaultLayout;

	/* Reset view-oriented data */
	self.actionViewData = nil;
}

-(void) runBeforeFilters {
	int i;
	for(i = 0; i < beforeFilters.count; i++) {
		NSInvocation *inv = [beforeFilters objectAtIndex:i];
		[inv invoke];
		//FIXME - check status to see if I need to redirect or stop the call chain or something
	}
}

-(void) runActionNamed:(NSString *)actionName {
	SEL actionSelector = NSSelectorFromString(actionName);
	[self runBeforeFilters];

	//Only run action if we are able - otherwise, just hit the view
	if([self respondsToSelector:actionSelector]) {
		[self performSelector:actionSelector];
	}

	
	// Get layout
	// render action into a "part"
	// render layout with action

	// write the output	

	if(response.contentNeeded) {
		NSData *finalData;

		NSString *format = @"html";
		NMAbstractView *v = [self viewForActionName:actionName format:format];
		
		if(v == nil) {
			//FIXME - raise error
		} else {
			self.actionViewData = [v render:self];
			[v reset];

			if(currentLayout == nil) {
				finalData = actionViewData;
			} else {
				finalData = [currentLayout render:self];
				[currentLayout reset];
			}

			[response writeContentData:finalData];
		}
	}
}

-(NMAbstractView *) viewForActionName:(NSString *)name format:(NSString *)fmt {
	return [NMAbstractView viewForControllerName:[self className] actionName:name format:fmt];
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
	[response release];
	[defaultLayout release];
	[currentLayout release];
	[actionViewData release];

	[super dealloc];
}

@end
