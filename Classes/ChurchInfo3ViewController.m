    //
//  ChurchInfo3ViewController.m
//  Church
//
//  Created by Kang Han on 11. 5. 11..
//  Copyright 2011 SSU. All rights reserved.
//

#import "ChurchInfo3ViewController.h"


@implementation ChurchInfo3ViewController
@synthesize webView_facebook;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


-(IBAction)fb:(id)sender{
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://m.facebook.com/?_rdr#!/seoulchoice2012?v=photos"];
    [webView_facebook loadRequest:[NSURLRequest requestWithURL:url]];
}
-(IBAction)cw:(id)sender{
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://m.club.cyworld.nate.com/club/club.php?show=imgall&club_id=50444949"];
    [webView_facebook loadRequest:[NSURLRequest requestWithURL:url]];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSURL alloc] initWithString:@"https://m.facebook.com/?_rdr#!/seoulchoice2012?v=photos"];
    [webView_facebook loadRequest:[NSURLRequest requestWithURL:url]];
/*    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"앞으로"
                                                                    style:UIBarButtonItemStyleBordered target:self action:@selector(newAction)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"뒤로"
                                                                    style:UIBarButtonItemStyleBordered target:self action:@selector(newAction)];
    self.navigationItem.leftBarButtonItem = leftButton;
*/
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[webView_facebook release];
    [super dealloc];
}


@end
