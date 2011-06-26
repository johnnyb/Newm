#import <Newm/NMAbstractSession.h>

@implementation NMAbstractSession
-(id) init {
	if((self = [super init])) {
		[self setStartDate:[NSDate date]];
		[self setLastAccessedDate:[NSDate date]];
		[self setFlash:[NSMutableDictionary dictionaryWithCapacity:5]];
	}

	return self;
}

-(id) initWithCoder:(NSCoder *)decoder {
	if((self = [super init])) {
		[self setStartDate: [decoder decodeObjectForKey:@"startDate"]];
		[self setLastAccessedDate: [decoder decodeObjectForKey:@"lastAccessedDate"]];
		[self setFlash: [decoder decodeObjectForKey:@"flash"]];
	}
	return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:startDate forKey:@"startDate"];
	[encoder encodeObject:lastAccessedDate forKey:@"lastAccessedDate"];
	[encoder encodeObject:flash forKey:@"flash"];

}

OBJC_ACC(NSDate *, startDate, startDate, setStartDate)
OBJC_ACC(NSDate *, lastAccessedDate, lastAccessedDate, setLastAccessedDate)
OBJC_ACC(NSMutableDictionary *, flash, flash, setFlash)

@end
