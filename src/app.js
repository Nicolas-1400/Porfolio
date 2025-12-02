const express = require("express");
const exhbs = require("express-handlebars");

const app = express();

app.use(express.static("public"));


// 1. Configurar Handlebars (apuntando a la carpeta 'views')
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

// 4. Ruta principal
app.get("/", (req, res) => {
	// Pasar los datos de las entidades a la vista 'home.handlebars'
	res.render("home", {
		title: "Grupo Portfolio",
		// Puedes añadir aquí la lógica de envío del formulario si usas POST
	});
});

app.listen(3000);
