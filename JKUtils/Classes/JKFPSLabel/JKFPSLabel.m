//
//  JKFPSLabel.m
//  JKAsyncLayer
//
//  Created by 01 on 2017/9/24.
//  Copyright © 2017年 01. All rights reserved.
//

#import "JKFPSLabel.h"
#import "JKWeakProxy.h"

#define kSize CGSizeMake(55, 20)

@implementation JKFPSLabel {
    CADisplayLink *_link;
    NSUInteger _count;
    CFTimeInterval _lastTime;
    UIFont *_font;
    CFTimeInterval _timeInterval;
}

- (instancetype)init {
    if (self = [super init]) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 || frame.size.height == 0) frame.size = kSize;
    
    if (self = [super initWithFrame:frame]) {
        [self _setup];
    }
    return self;
}

- (void)_setup {
    self.layer.cornerRadius = 5.0f;
    self.clipsToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
    _font = [UIFont systemFontOfSize:14.0f];
    _link = [CADisplayLink displayLinkWithTarget:[JKWeakProxy proxyWithTarget:self] selector:@selector(tick:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)dealloc {
    [_link invalidate];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return kSize;
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    UIColor *color = [UIColor greenColor];
    if (fps <= 55 && fps >= 50) {
        color = [UIColor yellowColor];
    } else if (fps < 50) {
        color = [UIColor redColor];
    }
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d ", (int)roundf(fps)] attributes:@{NSForegroundColorAttributeName: color, NSFontAttributeName: _font}];
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"FPS" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: _font}]];
    
    self.attributedText = text;
}

@end
