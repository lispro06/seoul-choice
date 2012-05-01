//
//  GalleryDetails.h
//  DietCenter
//
//Sugartin
//

#import <UIKit/UIKit.h>
#import "HJManagedImageV.h"
#import "HJObjManager.h"
#import <QuartzCore/QuartzCore.h>

@interface GalleryDetails : UIViewController<UIScrollViewDelegate> 



@property (nonatomic, strong) NSArray *arForImages;
@property (nonatomic, strong) IBOutlet UIScrollView *scrPage;
@property (nonatomic, strong) IBOutlet HJManagedImageV *imgV;
@property (nonatomic, readwrite) NSUInteger currentPage;
@property(strong,nonatomic) IBOutlet UIScrollView *ScrForImag;
@property(strong,nonatomic) NSMutableArray *arrForDetails;
@property (nonatomic, strong) HJObjManager* objMan;


@end
