#import "NSdata+Newm.h"

@implementation NSData(Newm)
-(NSString *)stringValue {
	return [[[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding] autorelease];
}
@end
