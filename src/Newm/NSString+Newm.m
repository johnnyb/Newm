// Copyright 2011 Jonathan Bartlett

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

#import <Newm/NSString+Newm.h>
#import <Newm/NSData+Newm.h>
#import <Newm/NewmMacros.h>

#define NIBBLE_HEX_VAL(val) ((val) >= 'a' ? (((val) - 'a') + 10) : ((val) >= 'A' ? (((val) - 'A') + 10) : ((val) - '0')))

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
				d = NIBBLE_HEX_VAL([self characterAtIndex:i]);
				i++;
			}
			if(i < len) {
				e = NIBBLE_HEX_VAL([self characterAtIndex:i]);
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

// Adapted from http://stackoverflow.com/questions/756492/objective-c-sample-code-for-hmac-sha1
// and http://api.rubyonrails.org/classes/ActiveSupport/MessageVerifier.html

-(NSString *) validatableStringForSecret:(NSString *)secret {
	if(IS_EMPTY(secret)) {
		NSLog(@"Warning - no secret found for signing");
		return self;
	}
	NSMutableData *dataForEncoding = [[self dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
	const char *cKey = [secret cStringUsingEncoding:NSASCIIStringEncoding];
	const char *cData = [dataForEncoding mutableBytes];
	unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];

	CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, [dataForEncoding length], cHMAC);

	NSString *signature = [dataForEncoding base64Encoding];
	return [NSString stringWithFormat:@"%@--%@", self, signature];
}

-(NSString *) validatedStringForSecret:(NSString *)secret {
	if(IS_EMPTY(secret)) {
		NSLog(@"Warning - no secret found for checking signature");
		return self;
	}
	NSRange r = [self rangeOfString:@"--" options:NSBackwardsSearch];
	if(r.length == 0) {
		NSLog(@"Didn't find separator");
		return nil; // Invalid coding;
	}

	NSString *signature = [self substringFromIndex:(r.location + r.length)];
	NSString *original = [self substringToIndex:r.location]; 

	NSString *valid_validated_string = [original validatableStringForSecret:secret];
	if([valid_validated_string isEqualToString:self]) {
		return original;
	} else {
		NSLog(@"Warning - invalid signature");
		return nil;
	}
}

@end
