
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Sebastian Guayacan Mesa"
#let locale-catalog-page-numbering-style = context { "Sebastian Guayacan Mesa - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Updated July-2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Sebastian Guayacan Mesa

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Bogotá, CO],
  [#box(original-link("mailto:guayacansebastian@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)guayacansebastian\@gmail.com])],
  [#box(original-link("tel:+57-322-2384366")[#fa-icon("phone", size: 0.9em) #h(0.05cm)322 2384366])],
  [#box(original-link("https://linkedin.com/in/Sebastian Guayacan Mesa")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)Sebastian Guayacan Mesa])],
  [#box(original-link("https://github.com/guayacansebastian")[#fa-icon("github", size: 0.9em) #h(0.05cm)guayacansebastian])],
)
#connections(connections-list)



== About Me


#one-col-entry(
  content: [Electronics  and Electrical Engineer with a minor in Computational Mathematics, experienced in software development for robotics and embedded systems. Proficient in Python and C++ for low-level development, computer vision algorithms, differential robot control, and simulation environments \(ROS\/Gazebo\).]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Key experience: • Design and implementation of testing frameworks for embedded systems • Process automation with Python\/Bash in Linux environments \(Ubuntu\) • Continuous integration with GitHub\/GitLab CI\/CD • Technical documentation of test cases and reports.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [I stand out for my analytical skills to address technical challenges, fast learning ability, and adaptability in collaborative environments. I seek to apply these skills in innovative projects integrating robotics, artificial intelligence, and robust system development.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Universidad de los Andes], Electronics Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Thesis: Dynamic modeling of crops in agrophotovoltaic systems, with distributed generation simulation and stability analysis.],[Minor: Computational Mathematics],[Relevant Courses: Data structures and algorithms, Robotics, Optimization, Learning and evolution of systems.],)
  ],
  right-content: [
    Bogotá, Colombia

Jan 2020 – Apr 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Universidad de los Andes], Electrical Engineering
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Thesis: Technical-economic analysis of agrophotovoltaic microgrids in non-interconnected zones, including power flow studies and protection sizing.],[Relevant Courses: Elements of electrical systems, Industrial systems, Microgrids],)
  ],
  right-content: [
    Bogotá, Colombia

Jan 2020 – Apr 2025
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[HERON Agrodrones - Freelance], Systems Developer and Integrator
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Design and automation of analysis pipeline for crop visual inspection: Multispectral image processing, specialized index calculation algorithms and models for anomaly detection and health status evaluation.],[Georeferenced data management: Processing architecture for georeferenced images, integration of computer vision tools, optimization and AI frameworks to generate vegetation health maps and recommendations.],[Automation of repetitive processes and standardization of technical documentation to facilitate decision making.],)
  ],
  right-content: [
    Bogotá, Colombia

Apr 2025 – Jul 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Electrical and Electronics Engineering Department, Universidad de los Andes], Teaching Assistant: Power Systems Economics and Power Electronics
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Simulation and analysis of power system operation, including economic dispatch and optimal power flow],[Implementation of projects with real-time simulation \(HIL\) for power systems and power electronics],[Stability analysis and protection coordination in electrical systems],)
  ],
  right-content: [
    Bogotá, Colombia

Jan 2024 – Dec 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IBM], Data & AI Portfolio Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Collaborated with the digital sales team for Data & AI software products in 9 LATAM countries, providing technical support and operational assistance.],[Performed technical sizing and demonstration of AI solutions, data analysis, process automation \(RPA\) and virtual assistants.],)
  ],
  right-content: [
    Bogotá, Colombia

Jan 2024 – Jun 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IBM], Sustainability Portfolio Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Provided specialized technical support to the digital sales team for sustainability products in 5 LATAM countries, sizing solutions for enterprise asset management \(OMS, ERP, APM, Visual inspection\), predictive maintenance with AI and carbon footprint analysis with ESG standards.],)
  ],
  right-content: [
    Bogotá, Colombia

Jul 2023 – Jan 2024
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Embedded Systems & Automation]
  ],
  right-content: [
    Jun 2022 – Jun 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [IoT device design and integration \(2 combined projects\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Electronic, software and mechanical integration in automated devices, using Python and C++ for control logic, utilizing various communication protocols.],[Development of Python Interface for remote configuration and monitoring],[Creation of integration manuals and code standardization \(Git\), focused on replicability and scalability],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Robocol]
  ],
  right-content: [
    Jun 2021 – Jun 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Competitive robotics team leader and STEM outreach])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Development of navigation, computer vision and control algorithms in Python and C++ for motor control and sensors of a differential rover, including electronic circuit design and communication architecture.],[Implementation of navigation algorithms in Python \(ROS2\) with low-level integration.],[Advanced debugging of concurrency and timing issues in electronic and control systems.],)
  ],
)



== Awards and Honors


#two-col-entry(
  left-content: [
    #strong[CODEFEST AD ASTRA 2023]
  ],
  right-content: [
    May 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Second place in Hackathon hosted by  Colombian Air Force and Universidad de los Andes.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Development of video and aerial image analysis algorithms for anomaly detection to protect the Colombian Amazon utilizing Yolo and EasyOCR.],[Development of NLP algorithms for text analysis and classification of public media.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Scholarship: Quiero Estudiar -Universidad de los Andes]
  ],
  right-content: [
    Dec 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Full scholarship for undergraduate studies in Electronics and Electrical Engineering.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Awarded for academic excellence and leadership potential.],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming Languages:] Python, Go, C++, Verilog \(basic\), MATLAB, SQL, Visual Basic]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Tools:] Visual Studio Code, Office Suite, Github, ROS2, Gazebo, Simulink, Typhoon HIL - SCADA]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(Advanced C1\), Spanish \(Native\)]
)


== References



#one-col-entry(
  content: [
    #strong[Abailable upon request]

    
  ],
)



