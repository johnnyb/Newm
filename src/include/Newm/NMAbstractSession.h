#import <Foundation/Foundation.h>
#import <Newm/NewmMacros.h>

@interface NMAbstractSession : NSObject<NSCoding>{
	NSDate *startDate;
	NSDate *lastAccessedDate;
}

OBJC_ACC_DECL(NSDate *,startDate, setStartDate)
OBJC_ACC_DECL(NSDate *,lastAccessedDate, setLastAccessedDate)

@end
