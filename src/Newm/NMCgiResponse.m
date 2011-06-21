// Copyright 2011 Jonathan Bartlett

#import <Newm/NMCgiResponse.h>

@implementation NMCgiResponse

-(void) sendHeaders {
	NSFileHandle *out = [NSFileHandle fileHandleWithStandardOutput];
	id key;
	NSEnumerator *enumerator = [headers keyEnumerator];
	while((key = [enumerator nextObject])) {
		id val = [headers objectForKey:key];
		NSString *headerString = [NSString stringWithFormat:@"%@: %@\n", key, val];
		[out writeData:[headerString dataUsingEncoding:NSUTF8StringEncoding]];
		[out writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
	}
}

-(void) sendContent {
	NSFileHandle *out = [NSFileHandle fileHandleWithStandardOutput];
	[out writeData:content];
}

@end
