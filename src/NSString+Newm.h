#import <Foundation/Foundation.h>

#define H(val) ([(val) xmlEncode])

@interface NSString(Newm)
-(NSString *) URLEncode;
-(NSString *) URLDecode;
-(NSString *) xmlEncode;
-(NSString *) xmlDecode;
@end
