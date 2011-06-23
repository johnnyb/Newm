#import "MySession.h"

@implementation MySession

-(id) initWithCoder:(NSCoder *)decoder {
	if((self = [super initWithCoder:decoder])) {
		[self setUserId: [decoder decodeIntForKey:@"userId"]];
	}
	return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
	[super encodeWithCoder:encoder];
	[encoder encodeInt:userId forKey:@"userId"];
}

OBJC_ACC_ASSIGN(int, userId, userId, setUserId)

@end
