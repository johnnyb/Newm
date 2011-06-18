#import <Foundation/Foundation.h>

@interface NSDictionary(Newm)
+(NSMutableDictionary *) dictionaryFromURLEncodedQueryString:(NSString *)str;
@end
