#import "AGPViewController.h"

#import "AGPPrototypeAPIClient.h"

@implementation AGPViewController {
    NSArray *_tasks;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // fetch the data
    [[AGPPrototypeAPIClient sharedInstance].tasksPipe read:^(id responseObject) {
        _tasks = responseObject;
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"An error has occured during read! \n%@", error);
    }];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [[_tasks objectAtIndex:row] objectForKey:@"title"];
    
    return cell;
}

@end
