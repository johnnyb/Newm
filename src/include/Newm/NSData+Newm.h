#import <Foundation/Foundation.h>

@interface NSData(Newm)
+ (NSData *) dataFromBase64String: (NSString *)string;
-(NSString *)stringValue;
-(NSString *)URLEncode;
-(BOOL) isEmpty;
-(NSString *)base64Encoding;
@end
