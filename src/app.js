const express = require("express");
const exhbs = require("express-handlebars");
const sequelize = require("./database/conexion");
const routes = require("./routes/index");

// Cargar todos los modelos ANTES de sincronizar
require("./models/Formulario");
require("./models/Programador");
require("./models/Proyecto");
require("./models/Idioma");
require("./models/Tecnologias");
require("./models/ProgramadorIdioma");
require("./models/ProgramadorProyecto");
require("./models/ProgramadorTecnologia");

const app = express();

// Middleware para parsear datos del formulario
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static("public"));


// Configurar Handlebars (apuntando a la carpeta 'views')
app.set("views", "./views");
app.engine(
	".handlebars",
	exhbs.engine({
		defaultLayout: "main",
		layoutsDir: app.get("views") + "/layouts",
		extname: ".handlebars",
	})
);
// Configuración de Handlebars
app.engine("handlebars", exhbs.engine());
app.set("view engine", "handlebars");

// Usar rutas
app.use("/", routes);

// Sincronizar BD e iniciar servidor
sequelize.sync({ alter: true }).then(() => {
	console.log("✓ Base de datos sincronizada");
	app.listen(3000, () => {
		console.log("✓ Servidor ejecutándose en http://localhost:3000");
	});
}).catch(err => {
	console.error("✗ Error al sincronizar la base de datos:", err);
});