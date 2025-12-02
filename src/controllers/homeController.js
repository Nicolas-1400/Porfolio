const Programador = require('../models/Programador');
const Idioma = require('../models/Idioma');
const Tecnologia = require('../models/Tecnologias');
const ProgramaIdioma = require('../models/ProgramadorIdioma');
const ProgramaTec = require('../models/ProgramadorTecnologia');
const Proyecto = require('../models/Proyecto');


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
  const { nombre, email, mensaje } = req.body;
  await Formulario.create({ nombre, email, mensaje });
  res.render('formulario', { success: true });
};
