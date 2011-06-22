#import <Newm/NMCookie.h>

@implementation NMCookie

-(void) dealloc {
	[key release];
	[value release];
	[expires release];
	[path release];
	[domain release];
	[signingKey release];

	[super dealloc];
}

@end
