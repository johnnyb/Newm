#import <Foundation/Foundation.h>
#import "NMAbstractView.h"

@interface NewmView_MyTestController_myAction2_html : NMAbstractView {
}
@end

@implementation NewmView_MyTestController_myAction2_html 
-(NSData *)render:(NMAbstractController *)ctrl {
	return [@"This is my Rendered View" dataUsingEncoding:NSUTF8StringEncoding];
}
@end
