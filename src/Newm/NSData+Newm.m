#import <Newm/NSData+Newm.h>
#import <Newm/Base64.h>

#define NIBBLE_HEX_CHAR(val) (((val) >= 10) ? 'a' + ((val) - 10) : '0' + (val))

@implementation NSData(Newm)

+(NSData *) dataFromBase64String:(NSString *)str {
	return [Base64 decode:str];
}

-(NSString *)stringValue {
	return [[[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding] autorelease];
}

-(NSString *)URLEncode {
	int len = [self length];
	char *encodedBytes = malloc((len * 3) + 1); // This should prevent us from having to worry about overflowing the buffer
	int myOffset = 0;
	int encodedOffset = 0;
	const char *myBytes = [self bytes];
	unsigned char c;
	for(myOffset = 0; myOffset < len; myOffset++) {
		c = myBytes[myOffset];
		if((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= ',' && c <= '.') || (c >= '0' && c <= '9') || (c == '_')) {
			encodedBytes[encodedOffset] = myBytes[myOffset];
			encodedOffset++;
		} else {
			encodedBytes[encodedOffset] = '%';
			encodedOffset++;
			encodedBytes[encodedOffset] = NIBBLE_HEX_CHAR(c / 16);
			encodedOffset++;
			encodedBytes[encodedOffset] = NIBBLE_HEX_CHAR(c % 16);
			encodedOffset++;
		}
	}
	encodedBytes[encodedOffset] = '\0';
	NSString *finalString = [NSString stringWithCString:encodedBytes encoding:NSASCIIStringEncoding];
	free(encodedBytes);
	return finalString;
}

-(BOOL) isEmpty {
	return [self length] == 0;
}

-(NSString *) base64Encoding {
	return [Base64 encode:self];
}



@end
