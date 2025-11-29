const Programador = require('../models/Programador');
const Idioma = require('../models/Idioma');
const Tecnologia = require('../models/Tecnologia');
const ProgramaIdioma = require('../models/ProgramadorIdioma');
const ProgramaTec = require('../models/ProgramadorTecnologia');
const Proyecto = require('../models/Proyecto');

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
