const Formulario = require('../models/Formulario');

exports.form = (req, res) => {
  res.render('formulario');
};

exports.submit = async (req, res) => {
  const { nombre, email, mensaje } = req.body;
  await Formulario.create({ nombre, email, mensaje });
  res.render('formulario', { success: true });
};
