NSLocalizableURL
================

Cocoa/UIKit frameworks don't load different resources on remote server based on user's preferred language.
This class allows you to have URLs localizable.

# Localizable URL

First, you prepare multiple files for each language and their filename are like following:

 *  cat-en.png
 *  cat-ja.png
 *  cat-zh.png

A localizable URL for those files would be:

    http://github.com/foo/bar/cat-{en,ja,zh}.png

As you can see above, the URL has two-letters language code(ISO 639-1) which is gonna be replaced on run-time. You include languages in the URL which resource is available. First one is used as default.
If a user prefers Japanese language, you will get URL resolved:

    http://github.com/foo/bar/cat-ja.png

If a user prefers other language that is not included in the available languages, English will be used.
It can also use with XCode style file tree:

    http://github.com/foo/{en,ja,zh}/cat.png


# Usage

It's same as NSURL.

    NSURL* url = [NSLocalizableURL URLWithString:@"http://github.com/foo/bar/cat-{en,ja,zh}.png"];

# License

MIT License
