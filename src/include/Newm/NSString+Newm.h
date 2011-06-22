// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>

#define H(val) ([(val) xmlEncode])

@interface NSString(Newm)
-(NSString *) URLEncode;
-(NSString *) URLDecode;
-(NSString *) xmlEncode;
-(NSString *) xmlDecode;
-(BOOL) isEmpty;
-(NSString *) validatableStringForSecret:(NSString *)secret;
-(NSString *) validatedStringForSecret:(NSString *)secret;
@end
