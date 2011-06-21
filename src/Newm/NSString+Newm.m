// Copyright 2011 Jonathan Bartlett

#import <Newm/NSString+Newm.h>
#import <Newm/NSData+Newm.h>

@implementation NSString(Newm)

//FIXME - these are dummies - need to be replaced with real stuff

-(NSString *) URLEncode {
	return [[self dataUsingEncoding:NSUTF8StringEncoding] URLEncode];
}
-(NSString *) URLDecode {
	int len = [self length];
	NSData *data = [self dataUsingEncoding:NSASCIIStringEncoding];
	const char *dataBytes = [data bytes];
	char *buffer = malloc(len + 1);
	unichar c;
	unichar d;
	unichar e;
	int j = 0;	
	int i = 0;
	while(i < len) {
		c = dataBytes[i];
		if(c == '%') {
			i++;
			if(i < len) {
				d = [self characterAtIndex:i];
				i++;
			}
			if(i < len) {
				e = [self characterAtIndex:i];
				i++;
			}
			
			c = ((d * 16) + e);
		} else {
			i++;

			if(c == '+') {
				c = ' ';
			}
		}

		buffer[j] = c;

		j++;
	}
	buffer[j] = '\0';

	NSString *finalString = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];

	free(buffer);

	return finalString;
}

-(NSString *) xmlEncode {
	return self;
}

-(NSString *) xmlDecode {
	return self;
}

-(BOOL) isEmpty {
	return [self length] == 0;
}

@end
