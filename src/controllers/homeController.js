const Programador = require("../models/Programador");
const Idioma = require("../models/Idioma");
const Tecnologia = require("../models/Tecnologias");
const ProgramaIdioma = require("../models/ProgramadorIdioma");
const ProgramaTec = require("../models/ProgramadorTecnologia");
const Proyecto = require("../models/Proyecto");
const Formulario = require("../models/Formulario");

// INICIO
exports.index = async (req, res) => {
	try {
		const proyectos = await Proyecto.findAll();
		const programadores = await Programador.findAll();

		// Transformar proyectos para la plantilla
		const projects = proyectos.map((p) => {
			// 'tecnologias' puede ser una cadena separada por comas
			const techs = p.tecnologias
				? String(p.tecnologias)
						.split(",")
						.map((t) => t.trim())
						.filter(Boolean)
				: [];

			// Formatear fecha (si es Date o string)
			let fecha = "";
			if (p.fecha) {
				if (p.fecha instanceof Date) {
					fecha = p.fecha.toISOString().split("T")[0];
				} else {
					fecha = String(p.fecha);
				}
			}

			return {
				nombreProyecto: p.titulo || p.nombreProyecto || "",
				fecha,
				descripcion: p.descripcion || "",
				tecnologias: techs,
				enlace: p.enlace || "",
			};
		});

		// Transformar programadores para la plantilla
		const teamMembers = programadores.map((u) => ({
			id: u.id || "",
			nombre: u.nombre || "",
			apellidos: u.apellidos || "",
			rol: u.titulacion || "",
			e_mail: u.email || "",
			linkedin: u.linkedin || "",
			cv: u.cv || "",
		}));

		res.render("home", {
			title: "Grupo Portfolio",
			projects,
			teamMembers,
		});
	} catch (error) {
		console.error("Error al cargar la página de inicio:", error);
		res.render("home", {
			title: "Grupo Portfolio",
			projects: [],
			teamMembers: [],
		});
	}
};

// PROGRAMADORES
exports.list = async (req, res) => {
	const programadores = await Programador.findAll();
	res.render("programadores/list", { programadores });
};

exports.detail = async (req, res) => {
	try {
		const id = req.params.id;
		const Idioma = require("../models/Idioma");
		const Tecnologia = require("../models/Tecnologias");
		const Proyecto = require("../models/Proyecto");

		const programador = await Programador.findByPk(id, {
			include: [
				{ model: Idioma, as: "Idiomas", through: { attributes: ["nivel"] } },
				{
					model: Tecnologia,
					as: "Tecnologias",
					through: { attributes: ["nivel"] },
				},
				{ model: Proyecto, as: "Proyectos" },
			],
		});

		if (!programador) return res.status(404).send("No encontrado");

		// Convertir la instancia de Sequelize a objeto plano para que Handlebars pueda acceder
		const programadorData = programador.toJSON
			? programador.toJSON()
			: JSON.parse(JSON.stringify(programador));

		// TEMPORAL: Añadir CV de ejemplo si no existe (diferente para cada ID)
		if (!programadorData.cv) {
			const cvExamples = {
				1: `Soy una persona trabajadora y responsable, con sólidos conocimientos de programación y alto nivel de inglés, enfocado en la resolución eficaz de los problemas que surgen para alcanzar mis objetivos. Tengo un carácter serio, lo que me permite asumir retos con disciplina y mantener la integridad en mis acciones. Tengo una mentalidad organizada, orientada a la mejora continua y me adapto con facilidad a diferentes contextos, manteniendo siempre una actitud proactiva y colaborativa.`,
				2: `Me considero una persona comprometida, con una sólida formación en programación y una clara orientación hacia la resolución efectiva de problemas para cumplir los objetivos establecidos. Tengo un carácter extrovertido y no me cuesta adaptarme para trabajar en equipo. Busco seguir desarrollándome profesionalmente en un entorno donde pueda aportar mis conocimientos, asumir nuevos retos y seguir creciendo tanto a nivel técnico como personal.`,
				3: `Soy un estudiante de desarrollo de aplicaciones web con un buen manejo de diversos lenguajes de programación y programas de Adobe como Photoshop, Premiere Pro, After Effects y Lightroom. Soy una persona creativa, positiva y comunicativa, orientada al público. Apasionada por tecnología, fotografía, diseño, viajes y deportes. Comprometida con el crecimiento personal y profesional.`,
			};
			programadorData.cv = cvExamples[id] || cvExamples[1];
		}

		if (!programadorData.imagen) {
			const imageExamples = {
				1: "/assets/Álvaro.jpg",
				2: "/assets/Nicolás.jpg",
				3: "/assets/Chao.jpg",
			};
			programadorData.imagen =
				imageExamples[id] || "/assets/perfil-default.jpg";
		}

		if (!programadorData.cvFile) {
			const cvFileExamples = {
				1: "/assets/Álvaro-CV.pdf",
				2: "/assets/Nicolás-CV.pdf",
				3: "/assets/Chao-CV.pdf",
			};
			programadorData.cvFile = cvFileExamples[id] || "/assets/default-CV.pdf";
		}

		// Los proyectos se cargan automáticamente de la tabla programadores_proyectos
		// Si no hay, la plantilla no mostrará la sección

		res.render("programadores/detail", { programador: programadorData });
	} catch (error) {
		console.error("Error al cargar detalle del programador:", error);
		res.status(500).send("Error al cargar la página");
	}
};

// PROYECTOS
exports.list = async (req, res) => {
	const proyectos = await Proyecto.findAll();
	res.render("proyectos/list", { proyectos });
};

// FORMULARIO
exports.form = (req, res) => {
	res.render("formulario");
};

exports.submit = async (req, res) => {
	try {
		const { nombre, email, mensaje } = req.body;
		console.log("📝 Datos recibidos del formulario:", {
			nombre,
			email,
			mensaje,
		});

		if (!nombre || !email || !mensaje) {
			return res.render("formulario", {
				error: "Todos los campos son obligatorios",
			});
		}

		const formularioGuardado = await Formulario.create({
			nombre,
			email,
			mensaje,
		});
		console.log("✓ Formulario guardado en BD:", formularioGuardado.toJSON());
		res.render("formulario", { success: true });
	} catch (error) {
		console.error("✗ Error al guardar formulario:", error);
		res.render("formulario", {
			error: "Error al enviar el formulario. Intenta más tarde.",
		});
	}
};
