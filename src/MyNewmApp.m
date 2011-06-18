#import <Foundation/Foundation.h>
#import "MyNewmApp.h"

NSString *newmAppClassName = @"MyNewmApp";

@implementation MyNewmApp

-(id) init {
	self = [super init];
	[routeMap addRoute:[NMRoute routeWithPath:@"whataver" params:[NSDictionary dictionaryWithObjectsAndKeys:@"MyTestController", @"controller", @"myAction", @"action", nil]]];
	return self;
}

@end
