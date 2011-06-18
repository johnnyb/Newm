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
	printf("Hello there!\n");
}

-(void) myBeforeFilter {
	printf("Runnign Before filter\n");
}


@end
