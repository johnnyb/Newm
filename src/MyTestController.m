#import "MyTestController.h"

@implementation MyTestController

-(id) init {
	self = [super init];

	[self addBeforeFilterWithSelector:@selector(myBeforeFilter)];

	return self;
}

-(void) myAction {

}


@end
