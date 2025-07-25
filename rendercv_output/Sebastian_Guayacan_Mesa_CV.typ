
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Sebastian Guayacan Mesa"
#let locale-catalog-page-numbering-style = context { "Sebastian Guayacan Mesa - Página " + str(here().page()) + " de " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Actualizado en Julio-2025"
#let locale-catalog-language = "es"
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



== Acerca De Mí


#one-col-entry(
  content: [Ingeniero Eléctrico y Electrónico con opción en matemática computacional, orientado a la mejora continua, la eficiencia operativa y la optimización de procesos en entornos industriales. Tengo experiencia en análisis de datos, automatización de tareas técnicas y documentación, con dominio de herramientas de ofimática y manejo de bases de datos.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [He trabajado con software de simulación eléctrica y herramientas CAD para diseño y revisión de planos. Me destaco por mi capacidad analítica, organización, atención al detalle y disposición para trabajar en equipos interdisciplinarios, apoyando tareas operativas, análisis de indicadores y soporte en procesos de mejora.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Me motiva aportar en ambientes dinámicos donde cada día presenta nuevos retos, integrando conocimientos técnicos con habilidades de comunicación, liderazgo y aprendizaje constante. Tengo especial interés en aplicar mis habilidades en entornos de producción industrial, donde pueda participar activamente en procesos de mejora continua, análisis de desempeño y seguimiento de operaciones.]
)


== Educación


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Universidad de los Andes], Ingeniería eléctrica
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Tesis: Análisis técnico-económico de microrredes agrofotovoltaicas en ZNI, incluyendo estudios de flujo de potencia y dimensionamiento de protecciones.],[Cursos Relevantes: Elementos de sistemas eléctricos, sistemas industriales, diseño de subestaciones eléctricas, electrónica de potencia, optimización ],)
  ],
  right-content: [
    Bogotá, Colombia

Ene 2020 – Abr 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Universidad de los Andes], Ingeniería electrónica
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Tesis: Modelado dinámico de cultivos en sistemas agrofotovoltaicos, con simulación de generación distribuida y análisis de estabilidad.],[Cursos Relevantes: Sistemas de apoyo a la decisión, estructuras de datos y algoritmos, sistemas de control, aprendizaje y evolución de sistemas, robótica.],)
  ],
  right-content: [
    Bogotá, Colombia

Ene 2020 – Abr 2025
  ],
)



== Experiencia


#two-col-entry(
  left-content: [
    #strong[IBM], Practicante de portafolio de sostenibilidad
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Brindé soporte técnico especializado al equipo de ventas digitales de productos de sostenibilidad en 5 países LATAM, dimensionamiento soluciones de gestión y desempeño de activos empresariales, mantenimiento predictivo con IA y análisis de huella de carbono con estándares ESG.],)
  ],
  right-content: [
    Híbrido

Jul 2023 – Ene 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IBM], Practicante de portafolio de datos e inteligencia artificial
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Colaboré con el equipo de ventas digitales de productos de software de Data & AI para 9 países LATAM, brindando soporte técnico y asistencia en labores operativas.],[Realicé dimensionamiento técnico y demostración de soluciones de IA, análisis de datos, automatización de procesos y asistentes virtuales.],)
  ],
  right-content: [
    Híbrido

Ene 2024 – Jun 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Departamento Ingeniería Eléctrica y Electrónica, Universidad de los Andes], Monitor del curso economía de sistemas de potencia
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Asistí en la enseñanza de principios económicos de sistemas de potencia, incluyendo despacho económico, flujo óptimo de potencia \(OPF\), y casación de energía desde la perspectiva de actores del mercado eléctrico],[Organicé y dirigí una simulación interactiva de mercado eléctrico, actuando como operador de red para gestionar ofertas de energía en sistemas uninodales y multinodales, ejecutar despacho económico y OPF],)
  ],
  right-content: [
    Bogotá, Colombia

Ene 2024 – Jun 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Departamento Ingeniería Eléctrica y Electrónica, Universidad de los Andes], Monitor del curso electrónica de potencia
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Asistí en la enseñanza de principios de semiconductores, elementos de sistemas eléctricos y diseño de conversores \(AC\/DC, DC\/DC, DC\/AC\).],[Ayudé a implementar proyectos de simulación en tiempo real \(HIL\) para rectificadores, transformadores tridevanados y control digital con modulación SPWM.],)
  ],
  right-content: [
    Bogotá, Colombia

Jul 2024 – Dic 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[HERON Agrodrones - Independiente], Desarrollador e integrador de sistemas
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Diseño y automatización del pipeline de análisis para inspección visual de cultivos: Procesamiento de imágenes multiespectrales, algoritmos de cálculo de índices especializados y modelos para detección de anomalías y evaluación de estado de salud.],[Gestión de datos geoespaciales: Arquitectura de procesamiento para imágenes georreferenciadas, integración de herramientas de visión computacional, optimización y frameworks de IA para generar mapas de salud vegetal y recomendaciones.],[Automatización de procesos repetitivos y estandarización de documentación técnica para facilitar toma de decisiones.],)
  ],
  right-content: [
    Remoto

Abr 2025 – Jul 2025
  ],
)



== Proyectos



#one-col-entry(
  content: [
    #strong[Robocol]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Líder de equipo de robótica competitiva y divulgación STEM])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Lideré el diseño eléctrico para un rover marciano: Diseño de planos del sistema eléctrico y de potencia, diseño de sistema de comunicaciones y programación de algoritmos.],[Participé en competencias nacionales e internacionales de programación y robótica, desarrollando habilidades de trabajo en equipo y resolución de problemas en contextos técnicos exigentes.],[Programé algoritmos de navegación, reconocimiento de imágenes y lógica de operación, aplicando metodologías de optimización para el desempeño del sistema.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Chocolatera Automatizada]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Diseño y desarrollo de un electrodoméstico automatizado])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Diseñé el sistema electrónico de una chocolatera, incluyendo planos eléctricos elaborados en Fusion 360 y modelado CAD de la estructura mecánica con AutoCAD.],[Trabajé de manera colaborativa en la integración de electrónica, mecánica y control, aplicando principios de documentación técnica, manufactura y optimización del diseño.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Coctelera Inteligente]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Diseño funcional y prototipado de un dispositivo mecatrónico])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Participé en el diseño del circuito electrónico y elaboración de planos eléctricos del sistema automatizado para una coctelera.],[Colaboré en la manufactura y documentación del prototipo, así como en la elaboración de archivos CAD para la estructura del dispositivo.],)
  ],
)



== Habilidades


#one-col-entry(
  content: [#strong[Lenguajes de Programación:] Python, C++, Visual Basic, MATLAB]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Herramientas:] Excel, AutoCAD, ETAP, Fusion360, Simulink, Git, Typhoon HIL, PVsyst, HOMER Pro, QGIS]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Idiomas:] Inglés \(Avanzado C1\), Español \(Nativo\)]
)


