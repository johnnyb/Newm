#import <Newm/Newm.h>

@interface MySession : NMAbstractSession {
	int userId;
}

OBJC_ACC_DECL(int, userId, setUserId)

@end
