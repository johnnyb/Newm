#import <Newm/NSArray+Newm.h>
#import <Newm/NSMutableArray+Newm.h>

@implementation NSArray(Newm)
-(NSArray *) arrayByTrimming {
	NSMutableArray *ary = [self mutableCopy];
	[ary trim];
	return ary;
}
@end
