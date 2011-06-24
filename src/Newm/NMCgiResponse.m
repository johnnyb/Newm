// Copyright 2011 Jonathan Bartlett

#import <Newm/NMCgiResponse.h>

@implementation NMCgiResponse

-(void) sendHeaders {
	NSFileHandle *out = [NSFileHandle fileHandleWithStandardOutput];
	id key;
	NSEnumerator *enumerator = [headers keyEnumerator];
	while((key = [enumerator nextObject])) {
		NSArray *results = [headers objectForKey:key];

		id val;
		NSEnumerator *val_enumerator = [results objectEnumerator];
		while((val = [val_enumerator nextObject])) {
			NSString *headerString = [NSString stringWithFormat:@"%@: %@\n", key, val];
			[out writeData:[headerString dataUsingEncoding:NSUTF8StringEncoding]];
		}
	}

	[out writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
}

-(void) sendContent {
	NSFileHandle *out = [NSFileHandle fileHandleWithStandardOutput];
	[out writeData:content];
}

@end
