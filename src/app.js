const express = require("express");
const expressHandlebars = require("express-handlebars");
const sequelize = require("./database/conexion");
const rutas = require("./routes/index");
const path = require("path");

// Cargar todos los modelos ANTES de sincronizar
require("./models/Formulario");
require("./models/Programador");
require("./models/Proyecto");
require("./models/Idioma");
require("./models/Tecnologias");
require("./models/ProgramadorIdioma");
require("./models/ProgramadorProyecto");
require("./models/ProgramadorTecnologia");
require("./models/Asociaciones");
const app = express();

// Middlewares para leer formularios y JSON
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// Servir archivos estáticos desde la carpeta public
app.use(express.static(path.join(__dirname, "public")));

// Configurar Handlebars (vistas)
app.set("views", path.join(__dirname, "views"));
app.engine(
  ".handlebars",
  expressHandlebars.engine({
    defaultLayout: "main",
    layoutsDir: path.join(__dirname, "views", "layouts"),
    extname: ".handlebars",
  })
);
app.set("view engine", "handlebars");

// Rutas
app.use("/", rutas);

// Sincronizar base de datos y arrancar servidor
sequelize
  .sync({ alter: false })
  .then(() => {
    console.log("✓ Base de datos sincronizada");
    app.listen(3000, () => {
      console.log("✓ Servidor ejecutándose en http://localhost:3000");
    });
  })
  .catch((err) => {
    console.error("✗ Error al sincronizar la base de datos:", err);
  });
