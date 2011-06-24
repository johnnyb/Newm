// Copyright 2011 Jonathan Bartlett

//FIXME - need different layouts for different formats?

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractController.h>
#import <Newm/NSData+Newm.h>
#import <Newm/NMCookieJar.h>

@implementation NMAbstractController

// No retaining to prevent retain cycles
OBJC_ACC_ASSIGN(NMNewmApp *, application, application, setApplication)
OBJC_ACC(NSMutableArray *, beforeFilters, beforeFilters, setBeforeFilters)
OBJC_ACC(NMAbstractRequest *, request, request, setRequest)
OBJC_ACC(NMAbstractResponse *, response, response, setResponse)
OBJC_ACC(NMAbstractSession *, session, session, setSession)
OBJC_ACC(NMAbstractView *, defaultLayout, defaultLayout, setDefaultLayout)
OBJC_ACC(NMAbstractView *, currentLayout, currentLayout, setCurrentLayout)
OBJC_ACC(NSData *, actionViewData, actionViewData, setActionViewData)
OBJC_ACC(NMCookieJar *, cookieJar, cookieJar, setCookieJar)

-(id) init {
	self = [super init];
	[self setBeforeFilters: [NSMutableArray arrayWithCapacity:10]];
	[self setDefaultLayout: [NMAbstractView layoutForControllerName:[self className] format:@"html"]];
	[self setCurrentLayout: defaultLayout];
	[self setCookieJar: [[[NMCookieJar alloc] init] autorelease]];

	return self;
}

-(void) loadSession {
	NSString *signedSerializedSessionBase64 = [[request cookieJar] cookieValueForKey: [application sessionCookieKey]];
	NSString *serializedSessionBase64 = [signedSerializedSessionBase64 validatedStringForSecret:[application sessionSecret]];

	if(serializedSessionBase64 == nil) {
		[self setSession:nil];
	} else {
		NSData *serializedSession = [NSData dataFromBase64String:serializedSessionBase64];
		[self setSession:[NSKeyedUnarchiver unarchiveObjectWithData:serializedSession]];
	}

	if(session == nil) {
		[self setSession:[application buildSession]];
	}
	[session setLastAccessedDate:[NSDate date]];

	//FIXME - 
	// Set default cookiejar path
	// set default cookiejar domain
}

-(void) reset {
	/* Reset request data */
	[self setRequest: nil];
	[self setResponse: nil];
	[self setCurrentLayout: [self defaultLayout]];
	[self setCookieJar: [[[NMCookieJar alloc] init] autorelease]];

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

-(void) prepareResponseForSendingHeaders {
	// Serialize and sign session into cookiejar
	NSData *output = [NSKeyedArchiver archivedDataWithRootObject:session];
	[cookieJar setCookieValue:[[output base64Encoding] validatableStringForSecret:[application sessionSecret]] forKey:[application sessionCookieKey]];

	// Serialize cookiejar into headers
	NMCookie *cookie;
	NSEnumerator *e = [[cookieJar cookies] objectEnumerator];
	while((cookie = [e nextObject])) {
		[response addHeaderValue:[cookie headerStringForSetCookie] forField:@"Set-Cookie"];
	}		
}

-(void) runActionNamed:(NSString *)actionName {
	[self loadSession];

	//FIXME - do something to find out format

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

			[self prepareResponseForSendingHeaders];
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
