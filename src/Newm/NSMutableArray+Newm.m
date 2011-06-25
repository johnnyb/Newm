#import <Newm/NSMutableArray+Newm.h>
#import <Newm/NSString+Newm.h>
#import <Newm/NewmMacros.h>

@implementation NSMutableArray(Newm)

// Remove first and last objects if they are empty
-(void) trim {
	if([self count] > 0) {
		id first = [self objectAtIndex:0];
		if(IS_EMPTY(first)) {
			[self removeObjectAtIndex:0];
		}
	}

	if([self count] > 0) {
		int lastidx = [self count] - 1;
		id last = [self objectAtIndex:lastidx];
		if(IS_EMPTY(last)) {
			[self removeObjectAtIndex:lastidx];
		}
	}
}

@end
