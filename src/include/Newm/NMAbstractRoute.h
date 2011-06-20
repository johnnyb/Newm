#import <Newm/NMAbstractRequest.h>

@protocol NMAbstractRoute <NSObject>
-(BOOL) matchesRequest:(NMAbstractRequest *)req;
-(void) applyToRequest:(NMAbstractRequest *)req;
-(NSString *) pathFromParams:(NSDictionary *)p;
@end
