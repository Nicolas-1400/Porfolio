# Portfolio Grupal

![]


Una plataforma de presentación profesional diseñada para exhibir las habilidades y proyectos de nuestro colectivo de desarrollo y diseño. Este proyecto fue construido para simular un entorno de trabajo real, utilizando un stack Node.js con un motor de plantillas para renderizado dinámico.

---

## ✨ Tecnologías Utilizadas

Este proyecto fue desarrollado utilizando un stack **Full-Stack JavaScript (MEVN/MERN-lite)** enfocado en la velocidad y el renderizado del lado del servidor.

* **Backend & Server:**
    * `Node.js`: Entorno de ejecución de JavaScript.
    * `Express.js`: Framework minimalista para el servidor web.
    * `express-handlebars`: Motor de plantillas para renderizar vistas dinámicamente (`.handlebars`).
* **Frontend & Estilo:**
    * `HTML5 / CSS3`: Marcado y estilos base.
    * `Bootstrap 5`: Framework CSS para asegurar un diseño *responsive* y moderno.
    * **Estilo Personalizado:** Esquema de colores Indigo/Coral/Teal para un look profesional y elegante.

---

## 📂 Estructura del Proyecto

La estructura sigue un patrón modular típico de aplicaciones Express con vistas separadas:

portfolio-grupal-server/ ├── node_modules/

├── public/ <-- Contenido estático (CSS, JS cliente, Assets) │ ├── css/ <-- Hojas de estilo personalizadas (style.css) │ ├── js/ <-- Lógica del lado del cliente y data.js │ └── assets/ <-- Imágenes de perfil y proyecto ├── views/ <-- Plantillas Handlebars │ ├── layouts/ <-- Plantilla principal (main.handlebars) │ └── home.handlebars <-- Contenido de la landing page ├── index.js <-- Lógica del Servidor (Rutas y Renderizado) ├── package.json <-- Dependencias y Scripts

---

## 🛠️ Instalación y Ejecución Local

Sigue estos pasos para configurar y ejecutar el proyecto en tu máquina local.

### 1. Requisitos Previos

Asegúrate de tener instalado:
* **Node.js** (versión 16 o superior)
* **npm** (Node Package Manager)

### 2. Clonar el Repositorio

```bash
git clone [URL_DE_TU_REPOSITORIO]
cd portfolio-grupal-server
