// Copyright 2011 Jonathan Bartlett

#import "MyTestController.h"

@implementation MyTestController

-(id) init {
	self = [super init];

	[self addBeforeFilterWithSelector:@selector(myBeforeFilter)];

	return self;
}

-(void) myAction {
	//FIXME - need to create a response object to write back through
	printf("Content-Type: text/html\n\n");
	printf("Hello there!\n");
	printf("Path info: %s\n", [request.pathInfo cStringUsingEncoding:NSUTF8StringEncoding]);
}

-(void) myBeforeFilter {
	//printf("Runnign Before filter\n");
}


@end
