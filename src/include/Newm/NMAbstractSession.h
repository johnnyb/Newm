#import <Foundation/Foundation.h>
#import <Newm/NewmMacros.h>

@interface NMAbstractSession : NSObject<NSCoding>{
	NSDate *startDate;
	NSDate *lastAccessedDate;
	NSMutableDictionary *flash;
}

OBJC_ACC_DECL(NSDate *,startDate, setStartDate)
OBJC_ACC_DECL(NSDate *,lastAccessedDate, setLastAccessedDate)
OBJC_ACC_DECL(NSMutableDictionary *, flash, setFlash)

@end
