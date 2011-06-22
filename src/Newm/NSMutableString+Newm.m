#import <Newm/NSMutableString+Newm.h>

@implementation NSMutableString(Newm)
-(void) appendChar:(unichar)c {
	[self appendFormat:@"%c", c];
}
@end
