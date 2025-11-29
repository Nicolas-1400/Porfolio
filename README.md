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

portfolio-api/
├── package.json
├── src/
│   ├── app.js
│   ├── database/
│   │   └── connection.js
│   ├── models/
│   │   ├── Formulario.js
│   │   ├── Idioma.js
│   │   ├── Programador.js
│   │   ├── ProgramadorIdioma.js
│   │   ├── ProgramadorProyecto.js
│   │   ├── ProgramadorTecnologia.js
│   │   ├── Proyecto.js
│   │   └── Tecnologia.js
│   ├── controllers/
│   │   ├── homeController.js
│   │   ├── programadoresController.js
│   │   ├── proyectosController.js
│   │   └── formularioController.js
│   ├── routes/
│   │   ├── index.js
│   │   ├── programadores.js
│   │   ├── proyectos.js
│   │   └── formulario.js
│   └── views/
│       ├── layouts/
│       │   └── main.hbs
│       ├── partials/
│       │   └── _nav.hbs
│       ├── index.hbs
│       ├── programadores/
│       │   ├── list.hbs
│       │   └── detail.hbs
│       ├── proyectos/
│       │   └── list.hbs
│       └── formulario.hbs
└── .env (opcional)
