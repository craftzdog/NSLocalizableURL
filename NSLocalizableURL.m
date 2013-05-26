//
//  NSLocalizableURL.m
//  walknote
//
//  Created by noradaiko on 5/26/13.
//  Copyright (c) 2013 noradaiko. All rights reserved.
//  http://odoruinu.net/
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSLocalizableURL.h"

@interface NSLocalizableURL()

@end

@implementation NSLocalizableURL

- (id)initWithString:(NSString *)URLString
{
    URLString = [NSLocalizableURL resolveLanguageForURL:URLString];
    return [super initWithString:URLString];
}

+ (id)URLWithString:(NSString *)URLString
{
    URLString = [NSLocalizableURL resolveLanguageForURL:URLString];
    return [super URLWithString:URLString];
}

+ (NSString*) resolveLanguageForURL: (NSString*) url;
{
    NSRange braceOpen = [url rangeOfString:@"{"];
    NSRange braceClose = [url rangeOfString:@"}"];
    NSRange langListRange = NSMakeRange(braceOpen.location, braceClose.location-braceOpen.location+1);
    NSString* strLangList = [url substringWithRange:NSMakeRange(braceOpen.location+1, braceClose.location - (braceOpen.location+1))];
    NSArray* langList = [strLangList componentsSeparatedByString:@","];
    if(langList==nil || langList.count<=0) return url;
    
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSUInteger langIdx = [langList indexOfObject:language];
    if(langIdx==NSNotFound)
        language = langList[0];
    
    return [url stringByReplacingCharactersInRange:langListRange withString:language];
}

@end
