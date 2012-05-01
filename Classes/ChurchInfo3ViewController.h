//
//  ChurchInfo3ViewController.h
//  Church
//
//  Created by Kang Han on 11. 5. 11..
//  Copyright 2011 SSU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChurchInfo3ViewController : UIViewController {
	IBOutlet UIWebView *webView_facebook;

}

-(IBAction)fb:(id)sender;
-(IBAction)cw:(id)sender;
@property(retain,nonatomic) 	IBOutlet UIWebView *webView_facebook;

@end
