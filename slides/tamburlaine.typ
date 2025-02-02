#import "@preview/polylux:0.3.1": *

#let date = datetime(year: 2024, month: 8, day: 16)

// colour configurations
#let SECONDARY_COLOR = rgb("#f6f0e0").lighten(60%)
#let PRIMARY_COLOR = rgb("#f99c36")

#let TEXT_COLOR = black.lighten(13%)

#let tamburlaine-theme(aspect-ratio: "4-3", body) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    fill: SECONDARY_COLOR,
    margin: 0.7em
  )
  set text(fill: TEXT_COLOR, size: 25pt, font: "Montserrat")
  body
}

#let title-slide(
  title: none,
  title_size: 80pt,
  authors: (),
  where: none,
  content
) = {
  set page(
    fill: SECONDARY_COLOR,
    margin: (top: 0em, left: 0em, right: 0em, bottom: 1.0em),
  )
  set text(fill: TEXT_COLOR, weight: "bold")
  let pretty-title = block(fill: PRIMARY_COLOR, inset: (left: 1em, right: 1em, top: 1em, bottom: 2em), [
      #set align(right)
      #text(weight: "black", size:title_size, fill: SECONDARY_COLOR)[#title]
    ])

  let author = authors.join(h(1em))

  logic.polylux-slide[
    #v(1em)
    #align(center)[
        #pretty-title
    ]
    #rect(inset: (top: 0em, left: 1em, right: 1em), width:100%, stroke:none, fill: SECONDARY_COLOR)[
      #grid(
        columns: (60%, 1fr),
        row-gutter: 15pt,
        [#text(weight: "regular")[_An introduction to RSS_]],
        align(right, where),
        author,
        align(right, text(size: 20pt, weight: "regular",
        date.display("[day] [month repr:long] [year]")
        )),
      )
      #v(-1.5em)
      #content
      #v(-0.5em)
    ]
  ]
}


#let slide(foreground: TEXT_COLOR, background: SECONDARY_COLOR, title: none, body) = {
  set page(
    fill: background,
    margin: (bottom: 1.5em)
  )
  let header = align(top, locate( loc => {
    set text(size: 20pt)
    grid(
    columns: (1fr, 1fr),
      align(horizon + right, grid(
        columns: 1, rows: 1em,
        title,
        utils.current-section,
      ))
    )
  }))

  let footer = locate( loc => {
    block(
      stroke: ( top: 1mm + foreground ), width: 100%, inset: ( y: .5em ),
      text(fill: foreground, .5em, {
        "CC BY-SA 4.0 Fergus Baker"
        h(2em)
        "/"
        h(2em)
        "Astro Dev Group"
        h(2em)
        "/"
        h(2em)
        date.display("[day] [month repr:long] [year]")
        h(1fr)
        logic.logical-slide.display()
      })
    )
  })

  set page(
    footer: footer,
    footer-descent: 0em,
    header-ascent: 1.5em,
  )

  let content = {
    block(spacing: 0.8em, par(leading: 10pt, text(fill: foreground, size: 50pt, weight: "black", title)))
    body
  }

  logic.polylux-slide(content)
}

#let _setgrp(img, grp, display:true) = {
  let key = "id=\"" + grp + "\""
  let pos1 = img.split(key)
  if display {
    pos1.at(1) = pos1.at(1).replace("display:none", "display:inline", count:1)
  } else {
    pos1.at(1) = pos1.at(1).replace("display:inline", "display:none", count:1)
  }
  pos1.join(key)
}

#let setgrp(img, ..grps, display: true) = {
  grps.pos().fold(img, (acc, grp) => {
    _setgrp(acc, grp, display: display)
  })
}

#let animsvg(img, display_callback, ..frames, handout: false) = {
  let _frame_wrapper(_img, hide: (), display: ()) = {
    setgrp((setgrp(_img, ..hide, display: false)), ..display, display: true)
  }
  if handout == true {
    let final_image = frames.pos().fold(img, (im, args) => _frame_wrapper(im, ..args))
    display_callback(1, final_image)
  } else {
    let output = ()
    let current_image = img
    for args in frames.pos().enumerate() {
      let (i, frame) = args
      current_image = _frame_wrapper(
        current_image, ..frame
      )
      let this = display_callback(i + 1, current_image)
      output.push(this)
    }
    output.join()
  }
}
