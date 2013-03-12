#import <Foundation/Foundation.h>

#import "AeroGear.h"

@interface AGPPrototypeAPIClient : NSObject

@property(readonly, nonatomic) id<AGPipe> tasksPipe;

+ (AGPPrototypeAPIClient *)sharedInstance;

@end
