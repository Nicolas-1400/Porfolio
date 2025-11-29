const Proyecto = require('../models/Proyecto');

exports.list = async (req, res) => {
  const proyectos = await Proyecto.findAll();
  res.render('proyectos/list', { proyectos });
};

