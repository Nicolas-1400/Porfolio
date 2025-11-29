const { DataTypes } = require('sequelize');
const sequelize = require('../database/connection');

const Formulario = sequelize.define('formulario', {
  nombre: { type: DataTypes.STRING, allowNull: false },
  email: { type: DataTypes.STRING, allowNull: false },
  mensaje: { type: DataTypes.TEXT, allowNull: false }
}, { timestamps: false });

module.exports = Formulario;
