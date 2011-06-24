// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import "MySession.h"
#import "MyNewmApp.h"

CGI_ENTRY_POINT(MyNewmApp)

@implementation MyNewmApp

-(id) init {
	self = [super init];
	[routeMap addRoute:[NMRoute routeWithPath:@"aaa" params:[NSDictionary dictionaryWithObjectsAndKeys:@"MyTestController", @"controller", @"myAction", @"action", nil]]];
	[routeMap addRoute:[NMRoute routeWithPath:@"bbb/:action" params:[NSDictionary dictionaryWithObjectsAndKeys:@"MyTestController", @"controller", @"whatever", @"whatever", nil]]];
	[self setSessionSecret:@"This is my secret"];
	return self;
}

-(NMAbstractSession *) buildSession {
	return [[[MySession alloc] init] autorelease];
}

@end
