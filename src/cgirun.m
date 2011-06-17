#import "NMCgiRequest.h"

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NMCgiRequest *req = [[[NMCgiRequest alloc] init] autorelease];

	[req process];

	[pool drain];

	return 0;
}
