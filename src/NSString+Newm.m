// Copyright 2011 Jonathan Bartlett

#import "NSString+Newm.h"

@implementation NSString(Newm)

//FIXME - these are dummies - need to be replaced with real stuff

-(NSString *) URLEncode {
	return self;
}
-(NSString *) URLDecode {
	return self;
}
-(NSString *) xmlEncode {
	return self;
}
-(NSString *) xmlDecode {
	return self;
}

-(BOOL) empty {
	return [self isEqualToString:@""];
}
@end
