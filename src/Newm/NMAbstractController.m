// Copyright 2011 Jonathan Bartlett

//FIXME - need different layouts for different formats?

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractController.h>

@implementation NMAbstractController

// No retaining to prevent retain cycles
-(NMNewmApp *) application { return application; }
-(void) setApplication:(NMNewmApp *)val { application = val; } 

-(NSMutableArray *) beforeFilters { return beforeFilters; }
-(void) setBeforeFilters:(NSMutableArray *)val { [val retain]; [beforeFilters release]; beforeFilters = val; }

-(NMAbstractRequest *) request { return request; }
-(void) setRequest:(NMAbstractRequest *)val { [val retain]; [request release]; request = val; }

-(NMAbstractResponse *) response { return response; }
-(void) setResponse:(NMAbstractResponse *)val { [val retain]; [response release]; response = val; }

-(NMAbstractView *) defaultLayout { return defaultLayout; }
-(void) setDefaultLayout:(NMAbstractView *)val { [val retain]; [defaultLayout release]; defaultLayout = val; }

-(NMAbstractView *) currentLayout { return currentLayout; }
-(void) setCurrentLayout:(NMAbstractView *)val { [val retain]; [currentLayout release]; currentLayout = val; }

-(NSData *) actionViewData { return actionViewData; }
-(void) setActionViewData:(NSData *)val { [val retain]; [actionViewData release]; actionViewData = val; }


-(id) init {
	self = [super init];
	[self setBeforeFilters: [NSMutableArray arrayWithCapacity:10]];
	[self setDefaultLayout: [NMAbstractView layoutForControllerName:[self className] format:@"html"]];
	[self setCurrentLayout: defaultLayout];

	return self;
}

-(void) reset {
	/* Reset request data */
	[self setRequest: nil];
	[self setResponse: nil];
	[self setCurrentLayout: [self defaultLayout]];

	/* Reset view-oriented data */
	[self setActionViewData: nil];
}

-(void) runBeforeFilters {
	int i;
	for(i = 0; i < [beforeFilters count]; i++) {
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

	if([response contentNeeded]) {
		NSData *finalData;

		NSString *format = @"html";
		NMAbstractView *v = [self viewForActionName:actionName format:format];
		
		if(v == nil) {
			//FIXME - raise error
		} else {
			[self setActionViewData: [v render:self]];
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
