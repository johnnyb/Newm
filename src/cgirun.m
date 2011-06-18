#import "NMCgiRequest.h"
#import "NMNewmApp.h"

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NMNewmApp *app = [NMNewmApp boot];

	NMCgiRequest *req = [[[NMCgiRequest alloc] init] autorelease];
	[req loadEnvironmentVariables];

	[app processRequest:req];

	[pool drain];

	return 0;
}
