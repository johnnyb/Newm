#import "MySession.h"

@implementation MySession

-(id) init {
	self = [super init];
	userId = 23;
	return self;
}

-(id) initWithCoder:(NSCoder *)decoder {
	//NSLog(@"Initializing class!");
	if((self = [super initWithCoder:decoder])) {
		[self setUserId: [decoder decodeIntForKey:@"userId"]];
		//NSLog(@"Setting user id: %d", userId);
	}
	return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
	[super encodeWithCoder:encoder];
	[encoder encodeInt:userId forKey:@"userId"];
}

OBJC_ACC_ASSIGN(int, userId, userId, setUserId)

@end
