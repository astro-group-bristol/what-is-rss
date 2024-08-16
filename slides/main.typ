#import "@preview/polylux:0.3.1": *
#import "tamburlaine.typ": *

#let HANDOUT_MODE = false
#enable-handout-mode(HANDOUT_MODE)

#show: tamburlaine-theme.with(aspect-ratio: "4-3")
#show link: item => underline(text(blue)[#item])

#let COLOR_CD = color.rgb("#56B4E9")
#let COLOR_REFL = color.rgb("#D55E00")
#let COLOR_CONT = color.rgb("#0072B2")

#let rss_logo = read("./figs/Feed-icon.svg")

#set text(size: 30pt)

#title-slide(
  title_size: 114pt,
  title: [
    #set par(leading: 40pt)
    #set par(spacing: 40pt)
    #grid(columns: (40%, 1fr),
      [#align(center, image.decode(rss_logo, width: 70%))],
      [_Really_ Simple],
    )
    Syndication
  ],
  authors: ([Fergus Baker],),
  where: "Astro Dev Group",
)[
]


#slide()[
  #align(center)[
    #text(size: 80pt, "🤔")
    #text(size: 30pt)[How to you keep track of the things \ you're *interested* in?]
  ]
  #v(1em)
  - Make an account, like 👍 and subscribe 🤠
  - "Feeds"
  - Algorithmically curated "feed"

  #text(size: 35pt)[
    *What about academic interests?*
  ]
  - Do you check the arXiv every day?
  - Mailing lists?

]

#slide()[
  #align(right)[
    Too many places, too much to keep track of, *infinite* items in a feed.
  ]
  - Can get noisy and overly messy with "recommended" items

  #v(-0.5em)
  #align(center)[
    #image("./figs/rss1.png", width: 50%)
  ]
  #v(-0.4em)
  #text(size: 18pt, [Image from: #link("https://ncase.me/rss/")])
  #v(-0.4em)

  #text(size: 40pt)[
    *RSS* is seeing the things you *want* to see.
  ]


]

#slide(title: "Nicky's shtuff")[
  #text(size: 20pt, [Go read it in your own time: #link("https://ncase.me/rss/")])

  #align(center)[
    #image("./figs/rss2.png", width: 50%)
  ]
  #v(-0.4em)

  #quote[Unlike newsletters where you give each publisher your email (and they may abuse that trust), RSS works on a "*don't call me, I'll call you*" policy.]
]

#slide(title: "The advantages")[

  You get more time to do other things.
  - Feeds have an end again.
  - Everything in one place.

  #v(1em)

  Publishing RSS is easy!
  - Your favourite blogs (probably) have RSS feeds.
  - Journals and ArXiV publish RSS.
  - YouTube channels can be treated as RSS feeds.
]

#slide(title: "What's in an RSS?")[
  It's just XML: #h(1fr) #text(size: 12pt, [Example from: https://en.wikipedia.org/wiki/RSS])
  #v(-0.5em)
  #set text(size: 17pt)
  ```xml
  <?xml version="1.0" encoding="UTF-8" ?>
  <rss version="2.0">
  <channel>
   <title>RSS Title</title>
   <description>This is an example of an RSS feed</description>
   <link>http://www.example.com/main.html</link>
   <copyright>2020 Example.com All rights reserved</copyright>
   <lastBuildDate>Mon, 6 Sep 2010 00:01:00 +0000</lastBuildDate>
   <pubDate>Sun, 6 Sep 2009 16:20:00 +0000</pubDate>
   <ttl>1800</ttl>

   <item>
    <title>Example entry</title>
    <description>Here is some text containing an interesting description.</description>
    <link>http://www.example.com/blog/post/1</link>
    <guid isPermaLink="false">7bd204c6-1655-4c27-aeee-53f933c5395f</guid>
    <pubDate>Sun, 6 Sep 2009 16:20:00 +0000</pubDate>
   </item>

  </channel>
  </rss>
  ```
]

#slide(title: "How to get started?")[
  #set text(size: 22pt)
  You'll need a *feed reader* and an RSS feed you want to fetch from.

  Some recommendations:
  - #link("https://www.inoreader.com/")[Inoreader]
  - #link("https://github.com/yang991178/fluent-reader")[Fluent Reader (GitHub)]
  - #link("https://newsboat.org/")[Newsboat]
  - #link("https://github.com/martinrotter/rssguard")[RSS Guard (GitHub)]

  There are plugins for other apps as well, such as web browsers or Obsidian.

  A good list of people's #link("https://www.reddit.com/r/rss/comments/16yo2p5/your_favorite_rss_reader/")[favourite readers (Reddit)], but caution, not all of them are FOSS.

  A _huge_ list of RSS feeds to look through: \ #link("https://github.com/plenaryapp/awesome-rss-feeds")
]

#slide(title: "How can I make my own?")[
  Write a generator yourself (it's quite straight forward)!

  Use a package that will generate it for you:
  - e.g., for Python there is the #link("https://github.com/svpino/rfeed")[rfeed] package.

  Share it with your friends! Build your own syndication network!
]

#slide(title: "Tips")[
  #set text(size: 30pt)
  - Don't subscribe to too many feeds. Only keep the ones that continue to post things you find interesting.
  - Avoid feeds that only contain a link to a webpage.
  - Don't refresh your feed too often.

  Have fun! 🎉
]

