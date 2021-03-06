//
//  JAPanoView.h
//  PanoTest
//
//  Created by Javier Alonso Gutiérrez on 16/02/12.
//  Copyright (c) 2012 NG Servicios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JAPanoViewDelegate;

@interface JAPanoView : UIView

@property (nonatomic) CGFloat zoomFactor; // from 0 to 100; default value: 1
@property (nonatomic) CGFloat hAngle; // azimuth angle in radians; from 0 to 2*PI; default value: 0 
@property (nonatomic) CGFloat vAngle; // elavation angle in radians; from -(PI/2) to (PI/2); default value: 0
@property (nonatomic) CGFloat leftLimit, rightLimit, upLimit, downLimit; // angle limits
@property (nonatomic) CGFloat minZoom, maxZoom; // zoom limits; default values: min 0, max 100
@property (nonatomic, getter = isPanEnabled) BOOL panEnabled;
@property (nonatomic, getter = isZoomEnabled) BOOL zoomEnabled;
@property (nonatomic, weak) id<JAPanoViewDelegate> delegate;

- (void)setFrontImage:(UIImage *)aFrontImage rightImage:(UIImage *)aRightImage backImage:(UIImage *)aBackImage leftImage:(UIImage *)aLeftImage topImage:(UIImage *)aTopImage bottomImage:(UIImage *)aBottomImage;

- (void)addHotspot:(UIView *)hotspotView atHAngle:(CGFloat)hAngle vAngle:(CGFloat)vAngle;

@end

@protocol JAPanoViewDelegate <NSObject>

@optional
- (void)panoViewDidPan:(JAPanoView *)panoView;
- (void)panoViewDidZoom:(JAPanoView *)panoView;

- (void)panoViewWillBeginPanning:(JAPanoView *)panoView;
- (void)panoViewWillBeginZooming:(JAPanoView *)panoView;

- (void)panoViewDidEndPanning:(JAPanoView *)panoView;
- (void)panoViewDidEndZooming:(JAPanoView *)panoView;

@end


@interface UIView (JAPanoViewHotspot)

@property (nonatomic, readonly) JAPanoView *panoView;
@property (nonatomic) BOOL shouldApplyPerspective;

- (void)removeFromPanoView;

@end
