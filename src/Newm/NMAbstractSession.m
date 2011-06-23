#import <Newm/NMAbstractSession.h>

@implementation NMAbstractSession
-(id) initWithCoder:(NSCoder *)decoder {
	if((self = [self init])) {
		[self setStartDate: [decoder decodeObjectForKey:@"startDate"]];
		[self setLastAccessedDate: [decoder decodeObjectForKey:@"lastAccessedDate"]];
	}
	return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:startDate forKey:@"startDate"];
	[encoder encodeObject:lastAccessedDate forKey:@"lastAccessedDate"];

}

OBJC_ACC(NSDate *, startDate, startDate, setStartDate)
OBJC_ACC(NSDate *, lastAccessedDate, lastAccessedDate, setLastAccessedDate)


@end
