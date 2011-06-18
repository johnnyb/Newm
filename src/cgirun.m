#import "NMCgiRequest.h"
#import "NMNewmApp.h"

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NMCgiRequest *req = [[[NMCgiRequest alloc] init] autorelease];
	NMNewmApp *app = [NMNewmApp boot];

	[req process];

	[pool drain];

	return 0;
}
