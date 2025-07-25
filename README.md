# Documentación de renderCV

## ¿Qué es renderCV?

`renderCV` es un paquete de Python que te permite generar un Curriculum Vitae (CV) profesional a partir de un archivo YAML. Con esta herramienta, puedes:

- Mantener tu información profesional organizada en un formato estructurado (YAML)
- Generar automáticamente un CV PDF bien formateado
- Personalizar el diseño y estilo del CV
- Actualizar fácilmente tu información cuando sea necesario

## Requisitos previos

Antes de usar renderCV, necesitas tener instalado:

1. Python 3.6 o superior
2. La distribución de LaTeX (como TeX Live o MiKTeX) para generar el PDF
3. El paquete renderCV instalado (se puede instalar con pip)

## Instalación

```bash
pip install renderCV
```

## Estructura del archivo YAML

Tu CV se organiza en un archivo YAML con la siguiente estructura básica:

```yaml
cv:
  name: Tu nombre completo
  location: Tu ubicación
  email: tu@email.com
  phone: +123456789
  website: tu-sitio-web.com (opcional)
  social_networks: (opcional)
    - network: Nombre red social
      username: tu-usuario
  
  sections:
    # Secciones de tu CV como "Educación", "Experiencia", etc.
    # Cada sección contiene ítems con detalles específicos

design:
  theme: nombre-del-tema  # Por ejemplo: "engineeringclassic"

locale:
  # Configuración regional para fechas, formatos, etc.
```

## Secciones principales

### 1. Información personal
Incluye tu nombre, ubicación, contacto y redes sociales.

### 2. Secciones de contenido
Puedes agregar las secciones que necesites. Las más comunes son:

- **Acerca de mí**: Descripción profesional en párrafos
- **Educación**: Lista de instituciones con detalles
- **Experiencia**: Lista de trabajos con logros (highlights)
- **Proyectos**: Proyectos relevantes
- **Habilidades**: Habilidades técnicas y blandas

Ejemplo de estructura para educación:

```yaml
Educación:
  - institution: Universidad Ejemplo
    area: Tu carrera
    degree: BS/MS/PhD
    start_date: AAAA-MM
    end_date: AAAA-MM o "present"
    location: Ciudad, País
    highlights:
      - "Logro o detalle 1"
      - "Logro o detalle 2"
```

## Personalización

### Temas disponibles
Puedes cambiar el diseño del CV con el parámetro `theme`:

```yaml
design:
  theme: engineeringclassic  # Otros temas disponibles: classic, modern, etc.
```

### Configuración regional
El bloque `locale` permite adaptar formatos de fecha, nombres de meses, etc.:

```yaml
locale:
  language: es
  date_template: MONTH_ABBREVIATION YEAR
  month: mes
  months: meses
  # ... otras configuraciones
```

## Cómo generar tu CV

1. Guarda tu información en un archivo YAML (ej. `cv.yaml`)
2. Ejecuta el siguiente comando:

```bash
rendercv render cv.yaml
```

Esto generará un archivo PDF con tu CV en el mismo directorio.

## Consejos para modificar tu CV

1. **Mantén la estructura YAML**: Respeta la indentación y formato
2. **Actualiza fechas**: Usa formato AAAA-MM (ej. "2025-07")
3. **Destaca logros**: En "highlights", usa verbos de acción
4. **Personaliza secciones**: Agrega o quita secciones según necesites
5. **Prueba diferentes temas**: Encuentra el diseño que mejor represente tu perfil

## Ejemplo de comandos útiles

- Generar CV:
  ```bash
  rendercv render mi_cv.yaml
  ```

- Ver temas disponibles:
  ```bash
  rendercv show-themes
  ```

- Generar con tema específico:
  ```bash
  rendercv render mi_cv.yaml --theme modern
  ```

## Soporte

Para más información, consultar la documentación oficial de renderCV o reporta issues en su repositorio GitHub.
