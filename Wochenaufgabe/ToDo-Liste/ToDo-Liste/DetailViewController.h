//
//  DetailViewController_iPhone.h
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "WebViewController.h"
#import "MapViewController.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView* name;
@property (nonatomic, strong) IBOutlet UILabel* datum;
@property (nonatomic, strong) IBOutlet UITextView* infos;


-(DetailViewController*) initWithTask:(Task*) singleTask;
-(void) showMapCreate;

-(IBAction)clickHomepageButton:(id)sender;

@end
