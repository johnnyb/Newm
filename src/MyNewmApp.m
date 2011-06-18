#import <Foundation/Foundation.h>
#import "MyNewmApp.h"

NSString *newmAppClassName = @"MyNewmApp";

@implementation MyNewmApp

-(id) init {
	self = [super init];
	[routeMap addRoute:[NSArray arrayWithObjects:@"whatever",nil] params:[NSDictionary dictionaryWithObjectsAndKeys:@"MyTestController", @"controller", @"myAction", @"action", nil] name:nil];
	return self;
}

@end
