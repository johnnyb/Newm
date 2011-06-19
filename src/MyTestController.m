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
	[response writeContentString:@"Hello there!\n"];
	[response writeContentString:[NSString stringWithFormat:@"path Info: %@", request.pathInfo]];
}

-(void) myAction2 {
	[response writeContentString:@"My Action 2"];
}

-(void) myBeforeFilter {
	//printf("Runnign Before filter\n");
}


@end
