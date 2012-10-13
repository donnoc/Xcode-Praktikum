//
//  ViewController.h
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateViewController.h"

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>



- (void) jumpToCreateViewController;

- (void)createViewController:(CreateViewController *)createViewController
			  didCreatedTask:(Task *)task;


@end
