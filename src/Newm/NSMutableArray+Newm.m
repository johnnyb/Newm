#import <Newm/NSMutableArray+Newm.h>
#import <Newm/NSString+Newm.h>

@implementation NSMutableArray(Newm)

// Remove first and last objects if they are empty
-(void) trim {
	if(self.count > 0) {
		id first = [self objectAtIndex:0];
		if([first isEmpty]) {
			[self removeObjectAtIndex:0];
		}
	}

	if(self.count > 0) {
		int lastidx = self.count - 1;
		id last = [self objectAtIndex:lastidx];
		if([last isEmpty]) {
			[self removeObjectAtIndex:lastidx];
		}
	}
}

@end
