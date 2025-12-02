const Programador = require('../models/Programador');
const Idioma = require('../models/Idioma');
const Tecnologia = require('../models/Tecnologias');
const ProgramaIdioma = require('../models/ProgramadorIdioma');
const ProgramaTec = require('../models/ProgramadorTecnologia');
const Proyecto = require('../models/Proyecto');
const Formulario = require('../models/Formulario');

// INICIO
exports.index = async (req, res) => {
	try {
		const proyectos = await Proyecto.findAll();
		const programadores = await Programador.findAll();

		// Transformar proyectos para la plantilla
		const projects = proyectos.map(p => {
			// 'tecnologias' puede ser una cadena separada por comas
			const techs = p.tecnologias
				? String(p.tecnologias).split(',').map(t => t.trim()).filter(Boolean)
				: [];

			// Formatear fecha (si es Date o string)
			let fecha = '';
			if (p.fecha) {
				if (p.fecha instanceof Date) {
					fecha = p.fecha.toISOString().split('T')[0];
				} else {
					fecha = String(p.fecha);
				}
			}

			return {
				nombreProyecto: p.titulo || p.nombreProyecto || '',
				fecha,
				descripcion: p.descripcion || '',
				tecnologias: techs,
				enlace: p.enlace || ''
			};
		});

		// Transformar programadores para la plantilla
		const teamMembers = programadores.map(u => ({
			nombre: u.nombre || '',
			apellidos: u.apellidos || '',
			rol: u.titulacion || '',
			e_mail: u.email || '',
			linkedin: u.linkedin || '',
			cv: u.cv || ''
		}));

		res.render('home', {
			title: 'Grupo Portfolio',
			projects,
			teamMembers
		});
	} catch (error) {
		console.error('Error al cargar la página de inicio:', error);
		res.render('home', {
			title: 'Grupo Portfolio',
			projects: [],
			teamMembers: []
		});
	}
};

// PROGRAMADORES
exports.list = async (req, res) => {
  const programadores = await Programador.findAll();
  res.render('programadores/list', { programadores });
};

exports.detail = async (req, res) => {
  const id = req.params.id;
  const programador = await Programador.findByPk(id, {
    include: [
      { model: Idioma, through: { attributes: ['nivel'] } },
      { model: Tecnologia, through: { attributes: ['nivel'] } },
      { model: Proyecto }
    ]
  });
  if (!programador) return res.status(404).send('No encontrado');
  res.render('programadores/detail', { programador });
};

// PROYECTOS
exports.list = async (req, res) => {
  const proyectos = await Proyecto.findAll();
  res.render('proyectos/list', { proyectos });
};

// FORMULARIO
exports.form = (req, res) => {
	res.render('formulario');
};

exports.submit = async (req, res) => {
	try {
		const { nombre, email, mensaje } = req.body;
		console.log('📝 Datos recibidos del formulario:', { nombre, email, mensaje });
		
		if (!nombre || !email || !mensaje) {
			return res.render('formulario', { error: 'Todos los campos son obligatorios' });
		}
		
		const formularioGuardado = await Formulario.create({ nombre, email, mensaje });
		console.log('✓ Formulario guardado en BD:', formularioGuardado.toJSON());
		res.render('formulario', { success: true });
	} catch (error) {
		console.error('✗ Error al guardar formulario:', error);
		res.render('formulario', { error: 'Error al enviar el formulario. Intenta más tarde.' });
	}
};
