#import "NSArray+Newm.h"
#import "NSMutableArray+Newm.h"

@implementation NSArray(Newm)
-(NSArray *) arrayByTrimming {
	NSMutableArray *ary = [self mutableCopy];
	[ary trim];
	return ary;
}
@end
