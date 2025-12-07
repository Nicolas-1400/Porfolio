const Programador = require("../models/Programador");
const Idioma = require("../models/Idioma");
const Tecnologia = require("../models/Tecnologias");
const Proyecto = require("../models/Proyecto");
const Formulario = require("../models/Formulario");

// Funciones de formato para preparar datos antes de renderizar
function formatearProyecto(p) {
	const techs = p.tecnologias ? String(p.tecnologias).split(",").map(t => t.trim()).filter(Boolean) : [];
	const fecha = p.fecha instanceof Date ? p.fecha.toISOString().split("T")[0] : (p.fecha ? String(p.fecha) : "");
	return {
	nombreProyecto: p.titulo || p.nombreProyecto || "",
	empresa: p.empresa || "",
	fecha,
	descripcion: p.descripcion || "",
	tecnologias: techs,
	enlace: p.enlace || "",
	};
}

function resumenProgramador(u) {
	return {
	id: u.id || "",
	nombre: u.nombre || "",
	apellidos: u.apellidos || "",
	rol: u.titulacion || "",
	email: u.email || "",
	linkedin: u.linkedin || "",
	cv: u.cv || "",
	};
}

// Página principal
exports.inicio = async (req, res) => {
    try {
	const proyectos = await Proyecto.findAll();
	const programadores = await Programador.findAll();

	const proyectosFormateados = proyectos.map(formatearProyecto);
	const miembrosEquipo = programadores.map(resumenProgramador);

	res.render("home", { title: "Grupo Portfolio", proyectos: proyectosFormateados, miembrosEquipo });
    } catch (error) {
	console.error("Error al cargar la página de inicio:", error);
	res.render("home", { title: "Grupo Portfolio", proyectos: [], miembrosEquipo: [] });
    }
};

// Lista de programadores
exports.listaProgramadores = async (req, res) => {
	const programadores = await Programador.findAll();
	res.render("programadores/list", { programadores });
};

// Detalle de un programador
exports.detalle = async (req, res) => {
    try {
	const id = req.params.id;
	const programador = await Programador.findByPk(id, {
	    include: [
		{ model: Idioma, as: "Idiomas", through: { attributes: ["nivel"] } },
		{ model: Tecnologia, as: "Tecnologias", through: { attributes: ["nivel"] } },
		{ model: Proyecto, as: "Proyectos" },
	    ],
	});

	if (!programador) return res.status(404).send("No encontrado");

	const data = programador.toJSON ? programador.toJSON() : JSON.parse(JSON.stringify(programador));

	// Valores por defecto
	const defaultCv = {
	    1: "Soy una persona trabajadora y responsable...",
	    2: "Me considero una persona comprometida...",
	    3: "Soy un estudiante de desarrollo de aplicaciones web...",
	};
	if (!data.cv) data.cv = defaultCv[id] || defaultCv[1];

	const defaultImages = { 1: "/assets/Álvaro.jpg", 2: "/assets/Nicolás.jpg", 3: "/assets/Chao.jpg" };
	if (!data.imagen) data.imagen = defaultImages[id] || "/assets/perfil-default.jpg";

	const defaultCvFile = { 1: "/assets/Álvaro-CV.pdf", 2: "/assets/Nicolás-CV.pdf", 3: "/assets/Chao-CV.pdf" };
	if (!data.cvFile) data.cvFile = defaultCvFile[id] || "/assets/default-CV.pdf";

	const title = `${data.nombre} ${data.apellidos}`;
	res.render("programadores/detail", { programador: data, title });
    } catch (error) {
	console.error("Error al cargar detalle del programador:", error);
	res.status(500).send("Error al cargar la página");
    }
};

// Proyectos
exports.listaProyectos = async (req, res) => {
	const proyectos = await Proyecto.findAll();
	res.render("proyectos/list", { proyectos });
};

// Formulario
exports.formulario = (req, res) => {
	res.render("formulario");
};

exports.enviarFormulario = async (req, res) => {
    try {
	const { nombre, email, mensaje } = req.body;
	console.log("Datos recibidos:", { nombre, email, mensaje });

	if (!nombre || !email || !mensaje) {
		return res.render("formulario", { error: "Todos los campos son obligatorios" });
	}

	const saved = await Formulario.create({ nombre, email, mensaje });
	console.log("Formulario guardado:", saved.toJSON());
	res.render("formulario", { exito: true });
    } catch (error) {
	console.error("Error al guardar formulario:", error);
	res.render("formulario", { error: "Error al enviar el formulario. Intenta más tarde." });
    }
};
