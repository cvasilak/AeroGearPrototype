#import "AGPPrototypeAPIClient.h"

#import "AeroGear.h"

#define AGPPrototypeAPIClientBaseURL @"http://todo-aerogear.rhcloud.com/todo-server"

@implementation AGPPrototypeAPIClient

@synthesize tasksPipe = _tasksPipe;

+ (AGPPrototypeAPIClient *)sharedInstance {
    static AGPPrototypeAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:AGPPrototypeAPIClientBaseURL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    if (self = [super init]) {
        
        // create the Pipeline object pointing to the remote application
        AGPipeline *pipeline = [AGPipeline pipelineWithBaseURL:[NSURL URLWithString:AGPPrototypeAPIClientBaseURL]];
        
        // once pipeline is constructed setup the pipes that will
        // point to the remote application REST endpoints
        _tasksPipe = [pipeline pipe:^(id<AGPipeConfig> config) {
            [config setName:@"tasks"];
        }];
        // ...any other pipes
    }

    return self;
}

@end
