#import <Foundation/Foundation.h>
#import "Newm.h"

@interface NMRouteMap : NSObject {
	NSMutableDictionary *routeDefinitions;
}

-(void) addRoute:(NSArray *)routeComponents params:(NSDictionary *)params name:(NSString *)nm;

@property (retain) NSMutableDictionary *routeDefinitions;

@end
