// Copyright 2011 Jonathan Bartlett

#import "NMCgiRequest.h"
#import "NMCgiResponse.h"
#import "NMNewmApp.h"

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NMNewmApp *app = [NMNewmApp boot];

	NMCgiRequest *req = [[[NMCgiRequest alloc] init] autorelease];
	NMCgiResponse *resp = [[[NMCgiResponse alloc] init] autorelease];
	[req loadEnvironmentVariables];

	[app processRequest:req usingResponse:resp];

	[pool drain];

	return 0;
}
